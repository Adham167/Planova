import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/auth_button.dart';
import '../screens/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D264F),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Create new account to get Started",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 40),

                const CustomAuthField(hint: "Username", icon: Icons.alternate_email),
                const SizedBox(height: 20),
                const CustomAuthField(hint: "Email Address", icon: Icons.email_outlined),
                const SizedBox(height: 20),
                const CustomAuthField(
                    hint: "Password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    suffixIcon: Icons.visibility_off_outlined
                ),
                const SizedBox(height: 20),
                const CustomAuthField(
                    hint: "Confirm Password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    suffixIcon: Icons.visibility_off_outlined
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: true,
                        onChanged: (val) {},
                        activeColor: const Color(0xFF9BA4FF),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text("Agree with ", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    const Text(
                      "Terms & Conditions",
                      style: TextStyle(
                        color: const Color(0xFF9BA4FF),
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                        decorationColor: const Color(0xFF9BA4FF),
                        decorationThickness: 1,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
                AuthButton(text: "Sign Up", onPressed: () {}),

                const SizedBox(height: 25),
                _buildOrDivider(),
                const SizedBox(height: 25),

                _buildSignInRow(context),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade200)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("or", style: TextStyle(color: Colors.grey, fontSize: 12)),
        ),
        Expanded(child: Divider(color: Colors.grey.shade200)),
      ],
    );
  }

  Widget _buildSignInRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already Have an Account ? ", style: TextStyle(color: Colors.grey, fontSize: 13)),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
            );
          },
          child: const Text(
            "Sign In",
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