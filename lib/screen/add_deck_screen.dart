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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Novo Deck'),
          backgroundColor: AppColors.secundaryColor,
          foregroundColor: AppColors.primaryColor,
          centerTitle: true,
        ),
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
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                      label: Text('Título do deck'),
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                      ),
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
      ),
    );
  }
}
