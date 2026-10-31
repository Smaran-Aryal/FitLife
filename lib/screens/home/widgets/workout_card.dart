import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../models/workout.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;
  final VoidCallback onTap;

  const WorkoutCard({super.key, required this.workout, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Image.asset(
                workout.image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                const ColoredBox(color: AppColors.surfaceLight),
              ),
            ),
            // Info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          workout.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: AppColors.surfaceLight,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_forward, size: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${workout.durationMin} min  •  ${workout.level}',
                    style: const TextStyle(color: AppColors.textGrey, fontSize: 11),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.local_fire_department,
                          color: AppColors.fire, size: 15),
                      const SizedBox(width: 4),
                      Text(
                        '${workout.kcal} kcal',
                        style: const TextStyle(color: AppColors.textGrey, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}