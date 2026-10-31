import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';

class TodaysFocus extends StatelessWidget {
  const TodaysFocus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primaryDim,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.gps_fixed, color: AppColors.primary),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You're on track!",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 2),
                Text(
                  'Complete your workout and\nstay consistent.',
                  style: TextStyle(color: AppColors.textGrey, fontSize: 12, height: 1.4),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textGrey),
        ],
      ),
    );
  }
}