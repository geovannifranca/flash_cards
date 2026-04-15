import 'package:flash_cards/colors/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secundaryColor,
        title: Text('Decks'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/no_decks.png', width: 280),
                Container(
                  width: double.infinity,
                  height: 58,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  child: Text(
                    'Adicionar deck',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: EdgeInsets.symmetric(horizontal: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secundaryColor,
        onPressed: () {},
        label: Text('Adicionar', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
