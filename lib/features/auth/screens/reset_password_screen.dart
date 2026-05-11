import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/auth_button.dart';
import '../providers/auth_provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final emailController = TextEditingController();

  void _handleReset() async {
    if (emailController.text.trim().isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.info(message: "Please enter your email address"),
      );
      return;
    }

    try {
      await context.read<AuthProvider>().sendPasswordReset(emailController.text.trim());
      
      if (!mounted) return;

      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(message: "Reset link sent! Please check your email inbox"),
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
    emailController.dispose();
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
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Reset Password",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1D264F)),
            ),
            const SizedBox(height: 12),
            const Text(
              "Enter your email to recover your password",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            CustomAuthField(
              hint: "example@gmail.com",
              icon: Icons.email_outlined,
              controller: emailController,
            ),
            const Spacer(),
            isLoading
                ? const CircularProgressIndicator(color: Color(0xFF9BA4FF))
                : AuthButton(
                    text: "Send Reset Link",
                    onPressed: _handleReset,
                  ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}