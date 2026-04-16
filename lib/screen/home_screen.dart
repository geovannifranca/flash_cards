import 'package:flash_cards/colors/app_colors.dart';
import 'package:flash_cards/screen/add_deck_screen.dart';
import 'package:flash_cards/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homestore = GetIt.I.get<HomeStore>();

  @override
  void initState() {
    super.initState();
    homestore.getAllDeck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secundaryColor,
        title: const Text('Decks'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Observer(
            builder: (_) {
              return Center(
                child: homestore.isLoading
                    ? const CircularProgressIndicator()
                    : homestore.decks.isNotEmpty
                    ? ListView.separated(
                        itemBuilder: (context, index) {
                          return Text(homestore.decks[index].title);
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemCount: homestore.decks.length,
                      )
                    : Column(
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
                            child: const Text(
                              'Adicionar deck',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.symmetric(horizontal: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secundaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDeckScreen()),
          );
        },
        label: const Text('Adicionar', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
