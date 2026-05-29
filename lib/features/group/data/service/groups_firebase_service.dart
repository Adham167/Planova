import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:planova_app/core/errors/failure.dart';
import 'package:planova_app/features/group/data/models/group_model.dart';

abstract class GroupsFirebaseService {
  Future<Either<Failure, void>> createGroup(GroupModel group);
}

class GroupsFirebaseServiceImpl implements GroupsFirebaseService {
  final FirebaseFirestore firestore;

  GroupsFirebaseServiceImpl({required this.firestore});
  @override
  Future<Either<Failure, void>> createGroup(GroupModel group) async {
    try {
      final docRef = firestore.collection('Groups').doc();

      final newGroup = group.copyWith(groupId: docRef.id);

      await docRef.set(newGroup.toMap());
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
  