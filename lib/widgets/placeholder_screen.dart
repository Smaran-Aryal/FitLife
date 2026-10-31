import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          '$title\nComing soon',
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.textGrey, fontSize: 16),
        ),
      ),
    );
  }
}