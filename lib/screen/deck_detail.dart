import 'package:flash_cards/model/deck.model.dart';
import 'package:flash_cards/widget/pimary_button.widget.dart';
import 'package:flash_cards/widget/secundary_button.widget.dart';
import 'package:flutter/material.dart';

class DeckdetailScreen extends StatelessWidget {
  final Deck deck;
  const DeckdetailScreen({super.key, required this.deck});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(deck.title), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Expanded(
              child: Column(
                children: [
                  Text(deck.title, style: const TextStyle(fontSize: 46)),
                  Text(
                    '${deck.cards.length} cartões',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              child: Column(
                children: [
                  SecundaryButton(label: 'Add Cartão', onPressed: () {}),
                  const SizedBox(height: 20),
                  PimaryButton(label: 'Iniciar Quiz', onPressed: () {}),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
