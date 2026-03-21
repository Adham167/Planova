import 'package:flutter/material.dart';
import 'package:planova_app/core/widgets/custom_button.dart';
import 'package:planova_app/features/group/presentation/views/widgets/appearance_body.dart';
import 'package:planova_app/features/group/presentation/views/widgets/members_body.dart';
import 'package:planova_app/features/group/presentation/views/widgets/stepper_widget.dart';

class CreateGroupBody extends StatefulWidget {
  const CreateGroupBody({super.key});

  @override
  State<CreateGroupBody> createState() => _CreateGroupBodyState();
}

class _CreateGroupBodyState extends State<CreateGroupBody> {
  int currentStep = 0;
  final PageController _pageController = PageController();

  final List<Color> colors = [
    const Color(0xFFFFC1BE),
    const Color(0xFFF6E1D3),
    const Color(0xFFBEE7E9),
    const Color(0xFFFFF2CC),
    const Color(0xFFB9B4A1),
    const Color(0xFFE1D5FF),
    const Color(0xFFA8D1A9),
    const Color(0xFFF3C4D3),
    const Color(0xFFD9EDB4),
    const Color(0xFFE5D9C3),
  ];

  Color selectedColor = const Color(0xFFFFC1BE);

  void nextStep() {
    if (currentStep < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        currentStep++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          StepperWidget(currentStep: currentStep),

          const SizedBox(height: 40),

          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentStep = index;
                });
              },
              children: [
                // Align(
                //   alignment: AlignmentGeometry.topCenter,
                //   child: const DetailsBody(),
                // ),
                AppearanceBody(
                  colors: colors,
                  selectedColor: selectedColor,
                  onColorSelected: (color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                ),
                MembersBody(selectedColor: selectedColor),
              ],
            ),
          ),

          CustomButton(
            onTap: nextStep,
            title: currentStep == 2 ? "Create Group" : "Continue",
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
