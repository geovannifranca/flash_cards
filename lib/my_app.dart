import 'package:flash_cards/colors/app_colors.dart';
import 'package:flash_cards/screen/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash Cards',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.secundaryColor,
        ),
        colorScheme: .fromSeed(seedColor: Colors.black),
        scaffoldBackgroundColor: AppColors.secundaryColor,
      ),
      home: const HomeScreen(),
    );
  }
}
