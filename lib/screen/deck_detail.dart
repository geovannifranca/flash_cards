import 'package:flash_cards/colors/app_colors.dart';
import 'package:flash_cards/model/deck.model.dart';
import 'package:flash_cards/screen/add_card_screen.dart';
import 'package:flash_cards/store/home_store.dart';
import 'package:flash_cards/widget/primary_button.widget.dart';
import 'package:flash_cards/widget/secundary_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class DeckdetailScreen extends StatefulWidget {
  final Deck deck;
  const DeckdetailScreen({super.key, required this.deck});

  @override
  State<DeckdetailScreen> createState() => _DeckdetailScreenState();
}

class _DeckdetailScreenState extends State<DeckdetailScreen> {
  final homeStore = GetIt.I.get<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.deck.title), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Observer(
          builder: (_) {
            return homeStore.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              widget.deck.title,
                              style: const TextStyle(fontSize: 46),
                            ),
                            Text(
                              '${widget.deck.cards.length} cartões',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Column(
                          children: [
                            SecundaryButton(
                              label: 'Add Cartão',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddCardScreen(deck: widget.deck),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            PrimaryButton(
                              label: 'Iniciar Quiz',
                              onPressed: () {},
                              size: 60,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
