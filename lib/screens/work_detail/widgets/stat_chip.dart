import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';

class StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const StatChip({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor = AppColors.textGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: iconColor),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(color: AppColors.textGrey, fontSize: 13),
        ),
      ],
    );
  }
}