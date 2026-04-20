import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const VisitorApp());
}

class VisitorApp extends StatelessWidget {
  const VisitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visitor',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final userName = settings.arguments as String? ?? 'User';
          return MaterialPageRoute(
            builder: (_) => HomeScreen(userName: userName),
          );
        }
        return null;
      },
    );
  }
}