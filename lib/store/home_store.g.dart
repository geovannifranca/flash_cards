// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$isLoadingAtom = Atom(
    name: 'HomeStoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_titleAtom = Atom(
    name: 'HomeStoreBase._title',
    context: context,
  );

  @override
  String? get _title {
    _$_titleAtom.reportRead();
    return super._title;
  }

  @override
  set _title(String? value) {
    _$_titleAtom.reportWrite(value, super._title, () {
      super._title = value;
    });
  }

  late final _$_questionAtom = Atom(
    name: 'HomeStoreBase._question',
    context: context,
  );

  @override
  String? get _question {
    _$_questionAtom.reportRead();
    return super._question;
  }

  @override
  set _question(String? value) {
    _$_questionAtom.reportWrite(value, super._question, () {
      super._question = value;
    });
  }

  late final _$_responseAtom = Atom(
    name: 'HomeStoreBase._response',
    context: context,
  );

  @override
  String? get _response {
    _$_responseAtom.reportRead();
    return super._response;
  }

  @override
  set _response(String? value) {
    _$_responseAtom.reportWrite(value, super._response, () {
      super._response = value;
    });
  }

  late final _$_decksAtom = Atom(
    name: 'HomeStoreBase._decks',
    context: context,
  );

  @override
  ObservableList<Deck> get _decks {
    _$_decksAtom.reportRead();
    return super._decks;
  }

  @override
  set _decks(ObservableList<Deck> value) {
    _$_decksAtom.reportWrite(value, super._decks, () {
      super._decks = value;
    });
  }

  late final _$_currentPageAtom = Atom(
    name: 'HomeStoreBase._currentPage',
    context: context,
  );

  @override
  int get _currentPage {
    _$_currentPageAtom.reportRead();
    return super._currentPage;
  }

  @override
  set _currentPage(int value) {
    _$_currentPageAtom.reportWrite(value, super._currentPage, () {
      super._currentPage = value;
    });
  }

  late final _$_isVisibleAtom = Atom(
    name: 'HomeStoreBase._isVisible',
    context: context,
  );

  @override
  bool get _isVisible {
    _$_isVisibleAtom.reportRead();
    return super._isVisible;
  }

  @override
  set _isVisible(bool value) {
    _$_isVisibleAtom.reportWrite(value, super._isVisible, () {
      super._isVisible = value;
    });
  }

  late final _$errorAtom = Atom(name: 'HomeStoreBase.error', context: context);

  @override
  int get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(int value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$correctAtom = Atom(
    name: 'HomeStoreBase.correct',
    context: context,
  );

  @override
  int get correct {
    _$correctAtom.reportRead();
    return super.correct;
  }

  @override
  set correct(int value) {
    _$correctAtom.reportWrite(value, super.correct, () {
      super.correct = value;
    });
  }

  late final _$addDeckAsyncAction = AsyncAction(
    'HomeStoreBase.addDeck',
    context: context,
  );

  @override
  Future<void> addDeck({required Deck deck}) {
    return _$addDeckAsyncAction.run(() => super.addDeck(deck: deck));
  }

  late final _$removeDeckAsyncAction = AsyncAction(
    'HomeStoreBase.removeDeck',
    context: context,
  );

  @override
  Future<void> removeDeck({required String id}) {
    return _$removeDeckAsyncAction.run(() => super.removeDeck(id: id));
  }

  late final _$getAllDeckAsyncAction = AsyncAction(
    'HomeStoreBase.getAllDeck',
    context: context,
  );

  @override
  Future<List<Deck>> getAllDeck() {
    return _$getAllDeckAsyncAction.run(() => super.getAllDeck());
  }

  late final _$addCardAsyncAction = AsyncAction(
    'HomeStoreBase.addCard',
    context: context,
  );

  @override
  Future<void> addCard({required AppCard card, required String id}) {
    return _$addCardAsyncAction.run(() => super.addCard(card: card, id: id));
  }

  late final _$HomeStoreBaseActionController = ActionController(
    name: 'HomeStoreBase',
    context: context,
  );

  @override
  void seeAnswer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.seeAnswer',
    );
    try {
      return super.seeAnswer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuestion(String? text) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.setQuestion',
    );
    try {
      return super.setQuestion(text);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String? text) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.setTitle',
    );
    try {
      return super.setTitle(text);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setResponse(String? text) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.setResponse',
    );
    try {
      return super.setResponse(text);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void next({required int value, required int index}) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.next',
    );
    try {
      return super.next(value: value, index: index);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.reset',
    );
    try {
      return super.reset();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
correct: ${correct}
    ''';
  }
}
