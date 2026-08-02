import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NeumorphicToggle extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onToggle;

  const NeumorphicToggle({
    super.key,
    this.initialValue = false,
    required this.onToggle,
  });

  @override
  State<NeumorphicToggle> createState() => _NeumorphicToggleState();
}

class _NeumorphicToggleState extends State<NeumorphicToggle> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _isSelected = !_isSelected);
        widget.onToggle(_isSelected);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 70,
        height: 35,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.neumorphicShadowDark,
              offset: const Offset(4, 4),
              blurRadius: 8,
            ),
            BoxShadow(
              color: AppColors.neumorphicShadowLight,
              offset: const Offset(-4, -4),
              blurRadius: 8,
            ),
          ],
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: _isSelected ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              color: _isSelected ? AppColors.primary : AppColors.textSecondary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
