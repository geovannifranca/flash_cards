import 'package:flash_cards/model/App_card.model.dart';
import 'package:uuid/uuid.dart';

class Deck {
  final String id;
  final String title;
  final List<AppCard> cards;

  Deck({String? id, required this.title, this.cards = const []})
    : id = id ?? const Uuid().v4();
}
