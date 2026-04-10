import 'package:flutter/material.dart';

class CustomAuthField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;
  final IconData? suffixIcon;

  const CustomAuthField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(fontSize: 15, color: Colors.black87),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),

        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(icon, color: Colors.grey.shade400, size: 22),
        ),

        suffixIcon: suffixIcon != null
            ? Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(suffixIcon, color: Colors.grey.shade400, size: 22),
        )
            : null,

        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),

        filled: true,
        fillColor: const Color(0xFFFBFBFB),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade100, width: 1),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade100, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF9BA4FF), width: 1.5),
        ),
      ),
    );
  }
}