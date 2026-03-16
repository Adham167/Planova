import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/auth_button.dart';
import '../screens/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
              const Text("Sign In", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1D264F))),
              const SizedBox(height: 12),
              const Text("Welcome back, you've been missed", style: TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 50),

              const CustomAuthField(hint: "Email Address", icon: Icons.email_outlined),
              const SizedBox(height: 20),
              const CustomAuthField(
                  hint: "Password",
                  icon: Icons.lock_outline,
                  isPassword: true,
                  suffixIcon: Icons.visibility_off_outlined
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?", style: TextStyle(color: Colors.grey, fontSize: 13, decoration: TextDecoration.underline)),
                ),
              ),

              const Spacer(),

              AuthButton(text: "Sign In", onPressed: () {}),

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
        const Text("Don't Have an Account ? ", style: TextStyle(color: Colors.grey, fontSize: 13)),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Color(0xFF9BA4FF),
              fontWeight: FontWeight.bold,
              fontSize: 13,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xFF9BA4FF),
              decorationThickness: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}