import 'package:flash_cards/model/card.model.dart';
import 'package:flash_cards/model/deck.model.dart';
import 'package:hive_ce/hive.dart';

class DeckRepository {
  final Box<Deck> _box = Hive.box<Deck>('decksBox');

  Future<void> saveDeck({required Deck deck}) async {
    await _box.put(deck.id, deck);
  }

  Future<List<Deck>> getAllDeck() async {
    return _box.values.toList();
  }

  Future<Deck?> getDeck({required String id}) async {
    return _box.get(id);
  }

  Future<void> deleteDeck({required String id}) async {
    await _box.delete(id);
  }

  Future<void> saveCard({required Card card, required String id}) async {
    final deck = await getDeck(id: id);
    if (deck != null) {
      deck.cards.add(card);
      await saveDeck(deck: deck);
    }
  }

  Future<List<Card>> getAllCard({required String id}) async {
    final deck = await getDeck(id: id);
    if (deck != null) {
      return deck.cards;
    }
    return [];
  }

  Future<Card?> getCard({required Card card, required String id}) async {
    final deck = await getDeck(id: id);
    if (deck != null) {
      return deck.cards.firstWhere((element) => element.id == card.id);
    }
    return null;
  }

  Future<void> deleteCard({required Card card, required String id}) async {
    final deck = await getDeck(id: id);
    if (deck != null) {
      deck.cards.removeWhere((element) => element.id == card.id);
      await saveDeck(deck: deck);
    }
  }
}
