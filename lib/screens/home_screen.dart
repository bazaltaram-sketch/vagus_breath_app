import 'package:flutter/material.dart';
import '../models/breathing_exercise.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'تنفس العصب الحائر',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF4FC3F7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'تمارين تنفس مبنية على أبحاث علمية لتحفيز العصب الحائر (Vagus Nerve) وتقليل التوتر',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildInfoCard(context),
                    const SizedBox(height: 30),
                    Text(
                      'التمارين العلمية',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final exercise = exercises[index];
                  return _buildExerciseCard(context, exercise);
                },
                childCount: exercises.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A237E).withOpacity(0.5), Color(0xFF0D47A1).withOpacity(0.3)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF4FC3F7).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.science, color: Color(0xFF4FC3F7), size: 28),
              SizedBox(width: 12),
              Text(
                'الأساس العلمي',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4FC3F7),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'العصب الحائر (Vagus Nerve) هو أطول عصب في الجهاز العصبي اللاإرادي. يتحكم في معدل ضربات القلب، الهضم، والاسترخاء. التنفس البطيء والعميق يحفز هذا العصب وينشّط وضع "الراحة والهضم" (Rest & Digest).',
            style: TextStyle(fontSize: 15, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(BuildContext context, BreathingExercise exercise) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF1E2430),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF2D3748)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.pushNamed(context, '/breathing', arguments: exercise);
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        exercise.nameAr,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Color(0xFF4FC3F7).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${exercise.cycles} دورة',
                        style: const TextStyle(
                          color: Color(0xFF4FC3F7),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  exercise.descriptionAr,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildPhaseChip('شهيق', exercise.inhaleSeconds, Colors.blue),
                    if (exercise.holdSeconds > 0) ...[
                      const SizedBox(width: 8),
                      _buildPhaseChip('حبس', exercise.holdSeconds, Colors.orange),
                    ],
                    const SizedBox(width: 8),
                    _buildPhaseChip('زفير', exercise.exhaleSeconds, Colors.green),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhaseChip(String label, int seconds, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$label ${seconds}ث',
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
