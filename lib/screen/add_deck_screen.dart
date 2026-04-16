import 'package:flash_cards/colors/app_colors.dart';
import 'package:flash_cards/model/deck.model.dart';
import 'package:flash_cards/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AddDeckScreen extends StatelessWidget {
  AddDeckScreen({super.key});
  final homestore = GetIt.I.get<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Deck'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Qual o título do seu novo deck?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 54, height: 1.2),
                ),
                TextField(
                  onChanged: homestore.setTitle,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Título do deck',
                    hintStyle: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.secundaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text('Adicionar'),
                  onPressed: () {
                    if (homestore.title != null ||
                        homestore.title!.isNotEmpty) {
                      homestore.addDeck(deck: Deck(title: homestore.title!));
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
