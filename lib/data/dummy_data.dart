import '../models/exercise.dart';
import '../models/workout.dart';

class DummyData {
  static const userName = 'Smaran Kun';

  static const featuredWorkout = Workout(
    title: 'Full Body Workout',
    durationMin: 30,
    level: 'Intermediate',
    kcal: 300,
    image: 'assets/images/featured.jpg',
    isFeatured: true,
    overview: 'A complete full body session to build strength and endurance.',
    equipment: 'A pair of dumbbells\n(optional).',
  );

  static const hiitCardio = Workout(
    title: 'HIIT Cardio',
    durationMin: 20,
    level: 'Beginner',
    kcal: 220,
    image: 'assets/images/hiit.jpg',
    overview:
    'A high-intensity interval training (HIIT) workout designed to boost '
        'your metabolism, improve endurance, and burn calories. No equipment '
        'needed. Just your body and determination!',
    exercises: [
      Exercise(name: 'Jumping Jacks', durationMin: 1, image: 'assets/images/ex_jumping_jacks.jpg'),
      Exercise(name: 'High Knees', durationMin: 1, image: 'assets/images/ex_high_knees.jpg'),
      Exercise(name: 'Mountain Climbers', durationMin: 1, image: 'assets/images/ex_mountain_climbers.jpg'),
      Exercise(name: 'Burpees', durationMin: 1, image: 'assets/images/ex_burpees.jpg'),
      Exercise(name: 'Cat-Cow', durationMin: 2, image: 'assets/images/ex_cat_cow.jpg'),
      Exercise(name: 'Downward Dog', durationMin: 3, image: 'assets/images/ex_downward_dog.jpg'),
    ],
  );

  static const morningYoga = Workout(
    title: 'Morning Yoga',
    durationMin: 15,
    level: 'All Levels',
    kcal: 180,
    image: 'assets/images/yoga.jpg',
    overview: 'A gentle flow to wake up your body and calm your mind.',
    equipment: 'A yoga mat is\nrecommended.',
  );

  // Used by the "Recommended Workouts" row on Home
  static const recommended = [hiitCardio, morningYoga];
}