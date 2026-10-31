import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../models/workout.dart';
import 'widgets/stat_chip.dart';
import '../../widgets/primary_button.dart';
import 'widgets/exercise_tile.dart';

class WorkoutDetailScreen extends StatefulWidget {
  final Workout workout;
  const WorkoutDetailScreen({super.key, required this.workout});

  @override
  State<WorkoutDetailScreen> createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final w = widget.workout;

    return Scaffold(
      bottomNavigationBar: Container(
        color: AppColors.background,
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
        child: SafeArea(
          top: false,
          child: PrimaryButton(
            label: 'Start Workout',
            icon: Icons.play_arrow_rounded,
            onPressed: () {
              // Work In progress
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Starting ${w.title}...')),
              );
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          // 1. Header image stays fixed at the top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Image.asset(
              w.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
              const ColoredBox(color: AppColors.surface),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 260),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        w.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildStatsRow(w),
                      const SizedBox(height: 24),
                      const Text(
                        'Overview',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        w.overview,
                        style: const TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 13,
                          height: 1.6,
                        ),
                      ),
                      if (w.exercises.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Exercises',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'See All',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        for (int i = 0; i < w.exercises.length; i++)
                          ExerciseTile(number: i + 1, exercise: w.exercises[i]),
                      ],
                      const SizedBox(height: 20),
                      _buildWhatYouNeed(w),


                    ],
                  ),
                ),
              ],
            ),
          ),

          // 3. Back + favorite buttons, fixed on top of everything
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  _circleButton(
                    icon: _isFavorite ? Icons.favorite : Icons.favorite_border,
                    iconColor: _isFavorite ? Colors.redAccent : AppColors.onPrimary,
                    onTap: () => setState(() => _isFavorite = !_isFavorite),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(Workout w) {
    Widget divider() => Container(
      width: 1,
      height: 18,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      color: AppColors.surfaceLight,
    );
    return Row(
      children: [
        StatChip(
          icon: Icons.local_fire_department,
          iconColor: AppColors.fire,
          label: '${w.kcal} kcal',
        ),
        divider(),
        StatChip(icon: Icons.access_time, label: '${w.durationMin} min'),
        divider(),
        StatChip(icon: Icons.bar_chart_rounded, label: w.level),
      ],
    );
  }

  Widget _buildWhatYouNeed(Workout w) {
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
            child: const Icon(Icons.fitness_center, color: AppColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What You Need',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  w.equipment,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _circleButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = AppColors.onPrimary,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
    );
  }
}