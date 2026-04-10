import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int initialIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    super.key,
    this.initialIndex = 1, 
    required this.onItemSelected,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home_outlined, 'Home'),
              _buildNavItem(1, Icons.assignment_turned_in_outlined, 'Tasks'),
              _buildNavItem(2, Icons.group_outlined, 'Group'),
              _buildNavItem(3, Icons.settings_outlined, 'Setting'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? const Color(0xFF9BA3EB) : Colors.grey[500];

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        widget.onItemSelected(index);
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
