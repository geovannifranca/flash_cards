import 'package:flash_cards/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flash_cards/model/deck.model.dart';

class DeckWidget extends StatelessWidget {
  final Deck deck;

  const DeckWidget({super.key, required this.deck});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: AppColors.primaryColor),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black54, offset: Offset(0, 1), blurRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textAlign: TextAlign.center,
            deck.title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            textAlign: TextAlign.center,
            '${deck.cards.length} cards',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
