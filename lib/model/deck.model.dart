import 'package:flash_cards/model/card.model.dart';
import 'package:uuid/uuid.dart';

class Deck {
  final String id;
  final String title;
  final List<Card> cards;

  Deck({required this.title, required this.cards}) : id = Uuid().v4();
}
