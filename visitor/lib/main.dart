import 'package:flutter/material.dart';

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
      home: Scaffold(
        body: Center(
          child: Text(
            'Visitor App',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}