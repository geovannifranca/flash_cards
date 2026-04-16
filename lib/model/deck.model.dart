import 'package:flash_cards/model/card.model.dart';
import 'package:uuid/uuid.dart';

class Deck {
  final String id;
  final String title;
  final List<Card> cards;

  Deck({required this.title, this.cards = const []}) : id = Uuid().v4();
}
