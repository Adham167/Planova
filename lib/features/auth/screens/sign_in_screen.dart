import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/auth_button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordHidden = true;
  bool isLoading = false;

  void handleLogin() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.info(message: "Please enter email & password"),
      );
      return;
    }

    try {
      final currentContext = context;

      await currentContext.read<AuthProvider>().login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!currentContext.mounted) return;

      final auth = currentContext.read<AuthProvider>();
      if (auth.isEmailVerified) {
        currentContext.go('/');
      } else {
        currentContext.go(
          '/verifyCode',
          extra: {'email': emailController.text.trim(), 'fullName': auth.userName ?? ''},
        );
      }
    } catch (e) {
      if (!context.mounted) return;

      final errorMessage = context.read<AuthProvider>().getErrorMessage(e);
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: errorMessage),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D264F),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Welcome back, you've been missed",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 50),

              CustomAuthField(
                hint: "Email Address",
                icon: Icons.email_outlined,
                controller: emailController,
              ),

              const SizedBox(height: 20),

              CustomAuthField(
                hint: "Password",
                icon: Icons.lock_outline,
                isPassword: isPasswordHidden,
                controller: passwordController,
                suffixIcon: isPasswordHidden
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                onSuffixTap: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    context.push('/resetPassword');
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              context.watch<AuthProvider>().isLoading
                  ? const CircularProgressIndicator(color: Color(0xFF9BA4FF))
                  : AuthButton(text: "Sign In", onPressed: handleLogin),

              const SizedBox(height: 20),
              _buildOrDivider(),
              const SizedBox(height: 25),
              _buildSignUpRow(context),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("or", style: TextStyle(color: Colors.grey.shade400)),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300)),
      ],
    );
  }

  Widget _buildSignUpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't Have an Account ? ",
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
        GestureDetector(
          onTap: () {
            context.push('/signUp');
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Color(0xFF9BA4FF),
              fontWeight: FontWeight.bold,
              fontSize: 13,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
