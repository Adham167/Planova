import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'profile_screen.dart';
import 'change_password_screen.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({super.key});

  void _showDeleteConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Delete Account',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          content: Text(
            'Are you sure you want to permanently delete your account and all related data?',
            style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textDark),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(color: AppColors.textGrey),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.logoutRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Account deletion confirmed (placeholder).',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                );
              },
              child: Text(
                'Delete',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTrailingIcon(Color color) {
    return Icon(Icons.chevron_right, color: color);
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
          'Privacy & Security',
          style: GoogleFonts.poppins(
            color: AppColors.textDark,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundColor,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    leading: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDE7F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.person, color: Color(0xFF5C6BC0)),
                    ),
                    title: Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Mahmoud Ragab',
                      style: GoogleFonts.poppins(
                        color: AppColors.textGrey,
                        fontSize: 13,
                      ),
                    ),
                    trailing: _buildTrailingIcon(const Color(0xFF9E9E9E)),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ProfileScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    leading: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDE7F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.lock, color: Color(0xFF5C6BC0)),
                    ),
                    title: Text(
                      'Change Password',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Last changed 3 months ago',
                      style: GoogleFonts.poppins(
                        color: AppColors.textGrey,
                        fontSize: 13,
                      ),
                    ),
                    trailing: _buildTrailingIcon(const Color(0xFF9E9E9E)),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ChangePasswordScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    leading: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFEBEE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Color(0xFFE53935),
                      ),
                    ),
                    title: Text(
                      'Delete Account',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFE53935),
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Permanently remove your data',
                      style: GoogleFonts.poppins(
                        color: AppColors.textGrey,
                        fontSize: 13,
                      ),
                    ),
                    trailing: _buildTrailingIcon(const Color(0xFFE53935)),
                    onTap: () => _showDeleteConfirmDialog(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
