import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';

class _Category {
  final String label;
  final IconData icon;
  final Color color;
  const _Category(this.label, this.icon, this.color);
}

class CategoryRow extends StatelessWidget {
  final ValueChanged<String>? onTap;
  const CategoryRow({super.key, this.onTap});

  static const _items = [
    _Category('Workouts', Icons.fitness_center, AppColors.primary),
    _Category('Nutrition', Icons.restaurant, Color(0xFF6FA8FF)),
    _Category('Mindfulness', Icons.spa_outlined, Color(0xFFFF7B9C)),
    _Category('Progress', Icons.bar_chart_rounded, Color(0xFFFFB84D)),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _items.map((c) {
        return GestureDetector(
          onTap: () => onTap?.call(c.label),
          child: Column(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: c.color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(c.icon, color: c.color, size: 28),
              ),
              const SizedBox(height: 8),
              Text(c.label, style: const TextStyle(fontSize: 12)),
            ],
          ),
        );
      }).toList(),
    );
  }
}