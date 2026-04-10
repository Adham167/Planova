import 'package:flutter/material.dart';
import '../widgets/auth_button.dart';
import '../screens/reset_password_screen.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

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
            const Text("Verify Code", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1D264F))),
            const SizedBox(height: 12),
            const Text("Please enter the code we just sent to email", style: TextStyle(fontSize: 14, color: Colors.grey)),
            const Text("example@gmail.com", style: TextStyle(color: Color(0xFF9BA4FF), fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) => _otpBox(context)),
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive an OTP? ",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                    );
                  },
                  child: const Text(
                    "Resend OTP",
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
            ),
            const Spacer(),
            AuthButton(text: "Verify", onPressed: () {}),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _otpBox(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFFFBFBFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: const TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(border: InputBorder.none, counterText: ""),
      ),
    );
  }
}