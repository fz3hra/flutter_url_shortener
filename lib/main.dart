import 'package:flutter/material.dart';
import 'package:flutter_url_shortener/config/routes.dart';
import 'package:flutter_url_shortener/screens/home_screen/home_screen.dart';
import 'package:flutter_url_shortener/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.onboarding,
      routes: {
        Routes.onboarding: (context) => const OnboardingScreen(),
        Routes.home: (context) => const HomeScreen(),
      },
    );
  }
}
