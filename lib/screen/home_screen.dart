import 'package:flash_cards/colors/app_colors.dart';
import 'package:flash_cards/screen/add_deck_screen.dart';
import 'package:flash_cards/screen/deck_detail.dart';
import 'package:flash_cards/store/home_store.dart';
import 'package:flash_cards/widget/deck.widget.dart';
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
      appBar: AppBar(title: const Text('Decks'), centerTitle: true),
      body: SafeArea(
        child: Observer(
          builder: (_) {
            return Center(
              child: homestore.isLoading
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : homestore.decks.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DeckdetailScreen(
                                    deck: homestore.decks[index],
                                  ),
                                ),
                              );
                            },
                            onLongPress: () => homestore.removeDeck(
                              id: homestore.decks[index].id,
                            ),
                            child: DeckWidget(deck: homestore.decks[index]),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 2),
                        itemCount: homestore.decks.length,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            key: const Key("image"),
                            'assets/images/no_decks.png',
                            width: 280,
                          ),
                          InkWell(
                            key: const Key("btnOutlineAdicionar"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddDeckScreen(),
                                ),
                              );
                            },
                            child: Ink(
                              width: double.infinity,
                              height: 68,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              child: const Text(
                                'Adicionar deck',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key("btnAdicionar"),
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
