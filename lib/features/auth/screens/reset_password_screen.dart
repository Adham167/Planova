import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/auth_button.dart';
import '../screens/verify_code_screen.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text("Reset Password", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1D264F))),
            const SizedBox(height: 12),
            const Text("Enter your email to recover your password", style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 40),
            const CustomAuthField(hint: "example@gmail.com", icon: Icons.email_outlined),
            const Spacer(),
            AuthButton(
              text: "Send OTP",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VerifyCodeScreen()),
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}