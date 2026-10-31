import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../data/dummy_data.dart';
import './widgets/feature_card.dart';
import 'widgets/category_row.dart';
import 'widgets/todays_focus.dart';
import 'widgets/workout_card.dart';
import '../work_detail/workout_detail_screen.dart';
import '../../models/workout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openDetail(BuildContext context, Workout workout) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => WorkoutDetailScreen(workout: workout)),
    );
  }

  @override Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 20),
            FeaturedCard(
              workout: DummyData.featuredWorkout,
              onTap: () => _openDetail(context, DummyData.featuredWorkout),
            ),
            const SizedBox(height: 24),
            const CategoryRow(),
            const SizedBox(height: 28),
            _buildSectionHeader("Today's Focus", actionLabel: 'View All'),
            const SizedBox(height: 12),
            const TodaysFocus(),
            const SizedBox(height: 28),
            _buildSectionHeader('Recommended Workouts'),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < DummyData.recommended.length; i++) ...[
                  if (i > 0) const SizedBox(width: 14),
                  Expanded(
                    child: WorkoutCard(
                      workout: DummyData.recommended[i],
                      onTap: () => _openDetail(context, DummyData.recommended[i]),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good Morning,',
                style: TextStyle(color: AppColors.textGrey, fontSize: 14),
              ),
              Text(
                '${DummyData.userName} 👋',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        // Notification bell with red dot
        Stack(
          children: [
            const Icon(Icons.notifications_none_rounded, size: 28),
            Positioned(
              right: 2,
              top: 2,
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 14),
        // Avatar (falls back to an icon if the image is missing)
        ClipOval(
          child: Image.asset(
            'assets/images/avatar.jpg',
            width: 44,
            height: 44,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: 44,
              height: 44,
              color: AppColors.surfaceLight,
              child: const Icon(Icons.person, color: AppColors.textGrey),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: AppColors.textGrey),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Search workouts, meals, or goals...',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: AppColors.textGrey, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSectionHeader(String title, {String? actionLabel}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        if (actionLabel != null)
          Text(
            actionLabel,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}