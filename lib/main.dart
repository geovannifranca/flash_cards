import 'package:flash_cards/adapter/hive_registrar.g.dart';
import 'package:flash_cards/model/deck.model.dart';
import 'package:flash_cards/my_app.dart';
import 'package:flash_cards/repository/deck_repository.dart';
import 'package:flash_cards/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox<Deck>('decksBox');
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<DeckRepository>(DeckRepository());
  getIt.registerSingleton<HomeStore>(HomeStore());
  runApp(const MyApp());
}
