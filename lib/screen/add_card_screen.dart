import 'package:flash_cards/colors/app_colors.dart';
import 'package:flash_cards/model/App_card.model.dart';
import 'package:flash_cards/model/deck.model.dart';
import 'package:flash_cards/store/home_store.dart';
import 'package:flash_cards/widget/primary_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AddCardScreen extends StatelessWidget {
  final Deck deck;
  AddCardScreen({super.key, required this.deck});

  final homeStore = GetIt.I.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Novo Cartão'),
          centerTitle: true,
          backgroundColor: AppColors.secundaryColor,
          foregroundColor: AppColors.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Column(
            children: [
              TextField(
                onChanged: homeStore.setQuestion,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  label: Text('Pergunta'),
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                onChanged: homeStore.setResponse,
                minLines: 3,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  label: Text('Resporta'),
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 64),
              PrimaryButton(
                label: 'Adicionar',
                onPressed: () => {
                  if ((homeStore.question != null &&
                          homeStore.response != null) ||
                      (homeStore.question!.isNotEmpty &&
                          homeStore.response!.isNotEmpty))
                    {
                      homeStore.addCard(
                        card: AppCard(
                          front: homeStore.question!,
                          back: homeStore.response!,
                        ),
                        id: deck.id,
                      ),
                      Navigator.pop(context),
                    },
                },
                size: 38,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
