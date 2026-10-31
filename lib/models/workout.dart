import 'exercise.dart';

class Workout {
  final String title;
  final int durationMin;
  final String level;      // Beginner, Intermediate, All Levels
  final int kcal;
  final String image;
  final String overview;
  final String equipment;
  final bool isFeatured;
  final List<Exercise> exercises;

  const Workout({
    required this.title,
    required this.durationMin,
    required this.level,
    required this.kcal,
    required this.image,
    this.overview = '',
    this.equipment = 'Just your body. No equipment\nrequired!',
    this.isFeatured = false,
    this.exercises = const [],
  });
}