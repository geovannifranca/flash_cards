import 'package:flash_cards/model/deck.model.dart';
import 'package:flash_cards/repository/deck_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _deckRepository = GetIt.I.get<DeckRepository>();

  @observable
  bool isLoading = false;
  bool get isloading => isLoading;

  @observable
  String? _title;
  String? get title => _title;

  @observable
  ObservableList<Deck> _decks = ObservableList<Deck>();
  ObservableList<Deck> get decks => _decks;

  @action
  void setTitle(String? text) => _title = text;

  @action
  Future<void> addDeck({required Deck deck}) async {
    isLoading = true;
    await _deckRepository.saveDeck(deck: deck);
    _decks.add(deck);
    isLoading = false;
  }

  @action
  Future<List<Deck>> getAllDeck() async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 2));
    final result = await _deckRepository.getAllDeck();
    _decks.addAll(result);
    isLoading = false;
    return result;
  }
}
