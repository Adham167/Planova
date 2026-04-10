import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planova_app/core/constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _usernameController = TextEditingController(text: 'Mahmoud Ragab');
  final _emailController = TextEditingController(
    text: 'mahmoudragab@example.com',
  );

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onChangePhotoTapped() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Change photo tapped', style: GoogleFonts.poppins()),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
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
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            style: GoogleFonts.poppins(color: AppColors.textDark, fontSize: 14),
            decoration: InputDecoration(
              hintText: label,
              hintStyle: GoogleFonts.poppins(
                color: AppColors.textGrey,
                fontSize: 14,
              ),
              prefixIcon: Icon(icon, color: AppColors.textGrey),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 0,
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
          'Profile',
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
            children: [
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: const Color(0xFF5C6BC0),
                    child: Text(
                      'MR',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: _onChangePhotoTapped,
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Mahmoud Ragab',
                style: GoogleFonts.poppins(
                  color: AppColors.textDark,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Undergraduate Student',
                style: GoogleFonts.poppins(
                  color: AppColors.textGrey,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 24),
              _buildFormField(
                label: 'Username',
                icon: Icons.person_outline,
                controller: _usernameController,
              ),
              const SizedBox(height: 16),
              _buildFormField(
                label: 'Email Address',
                icon: Icons.mail_outline,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
