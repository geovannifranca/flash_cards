import 'package:flash_cards/colors/app_colors.dart';
import 'package:flash_cards/model/deck.model.dart';
import 'package:flash_cards/store/home_store.dart';
import 'package:flash_cards/widget/primary_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class QuizScreen extends StatelessWidget {
  final Deck deck;
  QuizScreen({super.key, required this.deck});

  final homeStore = GetIt.I.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz: ${deck.title}'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Observer(
          builder: (_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(flex: 4),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Text(
                        deck.cards[homeStore.currentPage].front,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 38),
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                      ),
                      const SizedBox(height: 20),
                      homeStore.isVisible
                          ? TextButton(
                              onPressed: () => homeStore.seeAnswer(),
                              child: Text(
                                deck.cards[homeStore.currentPage].back,
                                style: const TextStyle(
                                  color: AppColors.success,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          : TextButton(
                              onPressed: () => homeStore.seeAnswer(),
                              child: const Text(
                                'Visualizar resposta',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                    ],
                  ),
                ),
                const Spacer(flex: 4),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      PrimaryButton(
                        label: 'Acertei',
                        onPressed: () {},
                        size: 68,
                        color: AppColors.success,
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        label: 'Errei',
                        onPressed: () {},
                        size: 78,
                        color: AppColors.error,
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 4),
              ],
            );
          },
        ),
      ),
    );
  }
}
