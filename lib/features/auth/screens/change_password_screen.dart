import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/auth_button.dart';
import '../screens/reset_password_screen.dart';


class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

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
            const Text("Change Password", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1D264F))),
            const SizedBox(height: 40),
            const CustomAuthField(hint: "Current Password", icon: Icons.lock_outline, isPassword: true, suffixIcon: Icons.visibility_off_outlined),
            const SizedBox(height: 20),
            const CustomAuthField(hint: "Create a new password", icon: Icons.lock_outline, isPassword: true, suffixIcon: Icons.visibility_off_outlined),
            const SizedBox(height: 20),
            const CustomAuthField(hint: "Confirm new password", icon: Icons.lock_outline, isPassword: true, suffixIcon: Icons.visibility_off_outlined),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                  );
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      decoration: TextDecoration.underline
                  ),
                ),
              ),
            ),
            const Spacer(),
            AuthButton(text: "Change Password", onPressed: () {}),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}