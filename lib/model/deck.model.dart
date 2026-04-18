import 'package:flash_cards/model/card.model.dart';
import 'package:uuid/uuid.dart';

class Deck {
  final String id;
  final String title;
  final List<Card> cards;

  Deck({String? id, required this.title, this.cards = const []})
    : id = id ?? const Uuid().v4();
}
