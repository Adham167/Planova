import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/auth_button.dart';
import '../providers/auth_provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isOldPasswordHidden = true;
  bool isNewPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  void _handleChange() async {
    final oldPass = oldPasswordController.text.trim();
    final newPass = newPasswordController.text.trim();
    final confirmPass = confirmPasswordController.text.trim();

    if (oldPass.isEmpty || newPass.isEmpty || confirmPass.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.info(message: "Please fill all fields"),
      );
      return;
    }

    if (newPass != confirmPass) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(message: "New passwords do not match"),
      );
      return;
    }

    if (oldPass == newPass) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.info(message: "New password must be different from the old one"),
      );
      return;
    }

    try {
      await context.read<AuthProvider>().changePassword(
            oldPassword: oldPass,
            newPassword: newPass,
          );

      if (!mounted) return;

      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(message: "Password updated successfully"),
      );
      
      context.pop();
    } catch (e) {
      if (!mounted) return;
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: e.toString()),
      );
    }
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthProvider>().isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D264F),
                  ),
                ),
                const SizedBox(height: 40),
                
                CustomAuthField(
                  hint: "Current Password",
                  icon: Icons.lock_outline,
                  isPassword: isOldPasswordHidden,
                  controller: oldPasswordController,
                  suffixIcon: isOldPasswordHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  onSuffixTap: () =>
                      setState(() => isOldPasswordHidden = !isOldPasswordHidden),
                ),
                const SizedBox(height: 20),
                
                CustomAuthField(
                  hint: "New Password",
                  icon: Icons.lock_outline,
                  isPassword: isNewPasswordHidden,
                  controller: newPasswordController,
                  suffixIcon: isNewPasswordHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  onSuffixTap: () =>
                      setState(() => isNewPasswordHidden = !isNewPasswordHidden),
                ),
                const SizedBox(height: 20),
                
                CustomAuthField(
                  hint: "Confirm New Password",
                  icon: Icons.lock_outline,
                  isPassword: isConfirmPasswordHidden,
                  controller: confirmPasswordController,
                  suffixIcon: isConfirmPasswordHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  onSuffixTap: () => setState(
                      () => isConfirmPasswordHidden = !isConfirmPasswordHidden),
                ),
                
                const Spacer(),
                
                isLoading
                    ? const CircularProgressIndicator(color: Color(0xFF9BA4FF))
                    : AuthButton(
                        text: "Update Password",
                        onPressed: _handleChange,
                      ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}