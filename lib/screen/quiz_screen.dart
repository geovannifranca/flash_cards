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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {homeStore.reset(), Navigator.pop(context)},
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Quiz: ${deck.title}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Observer(
          builder: (context) {
            return homeStore.currentPage == deck.cards.length
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'O quiz acabou. Você fez ${homeStore.correct} pontos.',
                          style: const TextStyle(fontSize: 48),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            homeStore.reset();
                          },
                          child: const Text(
                            key: Key("btnVoltar"),
                            'Voltar',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${homeStore.currentPage + 1}/${deck.cards.length}',
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(
                              deck.cards[homeStore.currentPage].front,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 38),
                              maxLines: 3,
                              overflow: TextOverflow.clip,
                            ),
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
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            PrimaryButton(
                              key: const Key("btnAcertei"),
                              label: 'Acertei :)',
                              onPressed: () => homeStore.next(
                                value: 1,
                                index: deck.cards.length,
                              ),
                              size: 68,
                              color: AppColors.success,
                            ),
                            const SizedBox(height: 20),
                            PrimaryButton(
                              key: const Key("btnErrei"),
                              label: 'Errei :(',
                              onPressed: () => homeStore.next(
                                value: 2,
                                index: deck.cards.length,
                              ),
                              size: 78,
                              color: AppColors.error,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
