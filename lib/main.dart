import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/home_screen.dart';
import 'screens/breathing_screen.dart';
import 'screens/vagus_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const VagusBreathApp());
}

class VagusBreathApp extends StatelessWidget {
  const VagusBreathApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تنفس العصب الحائر',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'SA'),
      supportedLocales: const [
        Locale('ar', 'SA'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF1A237E),
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF4FC3F7),
          secondary: Color(0xFF81C784),
          surface: Color(0xFF1E2430),
        ),
        fontFamily: 'Cairo',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/breathing': (context) => const BreathingScreen(),
        '/vagus': (context) => const VagusScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
