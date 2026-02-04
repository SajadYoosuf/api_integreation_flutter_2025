import 'package:api_integreation_beginner_2025/screens/all_employees_screen.dart';
import 'package:api_integreation_beginner_2025/screens/login_screen.dart';
import 'package:api_integreation_beginner_2025/screens/vyshanv_login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: VyshanvLoginScreen());
  }
}
