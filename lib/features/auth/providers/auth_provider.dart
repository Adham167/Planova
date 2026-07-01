import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? get userName => _userData?['full_name'];
  String? pendingName;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool get isLoggedIn => _auth.currentUser != null;
  bool get isEmailVerified => _auth.currentUser?.emailVerified ?? false;

  Map<String, dynamic>? _userData;
  Map<String, dynamic>? get userData => _userData;

  String getErrorMessage(dynamic e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          return "Invalid email format. Example: example@gmail.com";

        case 'user-disabled':
          return "This user account has been disabled.";

        case 'user-not-found':
        case 'wrong-password':
        case 'invalid-credential':
          return "Invalid email or password. Please try again.";

        case 'email-already-in-use':
          return "This email is already in use.";

        case 'weak-password':
          return "The password provided is too weak.";

        case 'too-many-requests':
          return "Too many failed attempts. Please try again later.";

        default:
          return "An unexpected error occurred. Please try again.";
      }
    }
    return e.toString();
  }

  Future<void> signUp({required String email, required String password}) async {
    _setLoading(true);
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendVerificationEmail();
    } catch (e) {
      throw getErrorMessage(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> saveUserDataToFirestore({
    required String fullName,
    required String email,
  }) async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) return;

    try {
      await _firestore.collection('users').doc(currentUser.uid).set({
        'uid': currentUser.uid,
        'full_name': fullName,
        'email': currentUser.email ?? email,
        'profile_pic_url': '',
        'bio_title': 'Undergraduate Student',
        'created_at': FieldValue.serverTimestamp(),
        'passwordChangedAt': FieldValue.serverTimestamp(),
        'statistics': {
          'current_streak': 0,
          'longest_streak': 0,
          'completed_tasks_count': 0,
          'active_tasks_count': 0,
        },
        'preferences': {
          'notifications_enabled': true,
          'dark_mode_enabled': false,
          'privacy_policy_read': true,
        },
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login({required String email, required String password}) async {
    _setLoading(true);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } catch (e) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> sendVerificationEmail() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<void> checkEmailVerified() async {
    await _auth.currentUser?.reload();
    notifyListeners();
  }

  Future<void> logout() async {
    _setLoading(true);
    try {
      await _auth.signOut();
      notifyListeners();
    } catch (e) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> sendPasswordReset(String email) async {
    _setLoading(true);
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw getErrorMessage(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    _setLoading(true);
    try {
      final user = _auth.currentUser;
      if (user == null) throw "User not found";

      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);

      DateTime now = DateTime.now();
      await _firestore.collection('users').doc(user.uid).update({
        'passwordChangedAt': now,
      });

      if (_userData != null) {
        _userData!['passwordChangedAt'] = Timestamp.fromDate(now);
        notifyListeners();
      }

      _setLoading(false);
    } catch (e) {
      _setLoading(false);
      throw getErrorMessage(e);
    }
  }

  Future<void> fetchUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        final doc = await _firestore.collection('users').doc(user.uid).get();
        if (doc.exists) {
          _userData = doc.data();
          notifyListeners();
        }
      } catch (e) {
        debugPrint("Error fetching user data: $e");
      }
    }
  }
}
