import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planova_app/core/constants/app_colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback toggle,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: AppColors.textDark,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscure,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field is required';
              }
              if (label == 'New Password' && value.trim().length < 8) {
                return 'Password must be at least 8 characters';
              }
              if (label == 'Confirm Password' &&
                  value.trim() != _newController.text.trim()) {
                return 'Passwords do not match';
              }
              return null;
            },
            style: GoogleFonts.poppins(color: AppColors.textDark),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline, color: AppColors.textGrey),
              suffixIcon: IconButton(
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.textGrey,
                ),
                onPressed: toggle,
              ),
              hintText: hint,
              hintStyle: GoogleFonts.poppins(color: AppColors.textGrey),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Change Password',
          style: GoogleFonts.poppins(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE7F6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Icon(Icons.lock, color: Color(0xFF5C6BC0), size: 40),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Update your password',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Choose a strong password to keep your account safe',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: AppColors.textGrey,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPasswordField(
                      label: 'Current Password',
                      controller: _currentController,
                      obscure: _obscureCurrent,
                      toggle: () =>
                          setState(() => _obscureCurrent = !_obscureCurrent),
                      hint: 'Enter current password',
                    ),
                    const SizedBox(height: 16),
                    _buildPasswordField(
                      label: 'New Password',
                      controller: _newController,
                      obscure: _obscureNew,
                      toggle: () => setState(() => _obscureNew = !_obscureNew),
                      hint: 'Enter new password',
                    ),
                    const SizedBox(height: 16),
                    _buildPasswordField(
                      label: 'Confirm Password',
                      controller: _confirmController,
                      obscure: _obscureConfirm,
                      toggle: () =>
                          setState(() => _obscureConfirm = !_obscureConfirm),
                      hint: 'Re-enter new password',
                    ),
                    const SizedBox(height: 26),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Password updated successfully ✅',
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Save Changes',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
