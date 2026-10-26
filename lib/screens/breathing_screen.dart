import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import '../models/breathing_exercise.dart';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({Key? key}) : super(key: key);

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen> with SingleTickerProviderStateMixin {
  late BreathingExercise exercise;
  late AnimationController _controller;
  late Animation<double> _animation;

  Timer? _timer;
  int _currentCycle = 0;
  int _currentPhase = 0; // 0: inhale, 1: hold, 2: exhale
  int _secondsRemaining = 0;
  bool _isRunning = false;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    exercise = ModalRoute.of(context)!.settings.arguments as BreathingExercise;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    Wakelock.disable();
    super.dispose();
  }

  void _startExercise() {
    setState(() {
      _isRunning = true;
      _isPaused = false;
      _currentCycle = 0;
      _currentPhase = 0;
    });
    Wakelock.enable();
    _startPhase();
  }

  void _startPhase() {
    int duration = 0;
    String phaseText = '';

    switch (_currentPhase) {
      case 0:
        duration = exercise.inhaleSeconds;
        phaseText = 'شهيق';
        _controller.duration = Duration(seconds: exercise.inhaleSeconds);
        _controller.forward(from: 0.3);
        break;
      case 1:
        duration = exercise.holdSeconds;
        phaseText = 'حبس';
        break;
      case 2:
        duration = exercise.exhaleSeconds;
        phaseText = 'زفير';
        _controller.duration = Duration(seconds: exercise.exhaleSeconds);
        _controller.reverse(from: 1.0);
        break;
    }

    setState(() {
      _secondsRemaining = duration;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsRemaining--;
      });

      if (_secondsRemaining <= 0) {
        timer.cancel();
        _nextPhase();
      }
    });
  }

  void _nextPhase() {
    if (_currentPhase < 2) {
      _currentPhase++;
      _startPhase();
    } else {
      _currentCycle++;
      if (_currentCycle >= exercise.cycles) {
        _completeExercise();
      } else {
        _currentPhase = 0;
        _startPhase();
      }
    }
  }

  void _completeExercise() {
    setState(() {
      _isRunning = false;
    });
    Wakelock.disable();
    _showCompletionDialog();
  }

  void _pauseExercise() {
    _timer?.cancel();
    setState(() {
      _isPaused = true;
    });
  }

  void _resumeExercise() {
    setState(() {
      _isPaused = false;
    });
    _startPhase();
  }

  void _stopExercise() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _isPaused = false;
    });
    Wakelock.disable();
    Navigator.pop(context);
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E2430),
        title: const Text('أحسنت! 🎉', textAlign: TextAlign.center),
        content: Text(
          'أكملت ${exercise.cycles} دورة من تمرين ${exercise.nameAr}.

استمر في الممارسة اليومية لتحسين صحة العصب الحائر.',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }

  Color _getPhaseColor() {
    switch (_currentPhase) {
      case 0: return Colors.blue;
      case 1: return Colors.orange;
      case 2: return Colors.green;
      default: return Colors.blue;
    }
  }

  String _getPhaseText() {
    switch (_currentPhase) {
      case 0: return 'شهيق';
      case 1: return 'حبس';
      case 2: return 'زفير';
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: _stopExercise,
                  ),
                  Text(
                    exercise.nameAr,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            // Scientific info
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1E2430),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.science, color: Color(0xFF4FC3F7), size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      exercise.scientificBasis,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[400],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Breathing circle
            if (_isRunning || _isPaused)
              _buildBreathingCircle()
            else
              _buildStartButton(),

            const Spacer(),

            // Controls
            if (_isRunning || _isPaused)
              _buildControls(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildBreathingCircle() {
    return Column(
      children: [
        // Progress
        Text(
          'الدورة ${_currentCycle + 1} من ${exercise.cycles}',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[400],
          ),
        ),
        const SizedBox(height: 30),

        // Animated circle
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    _getPhaseColor().withOpacity(0.8),
                    _getPhaseColor().withOpacity(0.3),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: _getPhaseColor().withOpacity(0.5),
                    blurRadius: 40 * _animation.value,
                    spreadRadius: 10 * _animation.value,
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _getPhaseText(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$_secondsRemaining',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildStartButton() {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFF4FC3F7), width: 3),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${exercise.cycles}',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4FC3F7),
                  ),
                ),
                const Text(
                  'دورة',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF4FC3F7),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton.icon(
          onPressed: _startExercise,
          icon: const Icon(Icons.play_arrow, size: 32),
          label: const Text('ابدأ التمرين', style: TextStyle(fontSize: 20)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4FC3F7),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_isPaused)
          ElevatedButton.icon(
            onPressed: _resumeExercise,
            icon: const Icon(Icons.play_arrow),
            label: const Text('استئناف'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          )
        else
          ElevatedButton.icon(
            onPressed: _pauseExercise,
            icon: const Icon(Icons.pause),
            label: const Text('إيقاف مؤقت'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        const SizedBox(width: 20),
        ElevatedButton.icon(
          onPressed: _stopExercise,
          icon: const Icon(Icons.stop),
          label: const Text('إنهاء'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ],
    );
  }
}
