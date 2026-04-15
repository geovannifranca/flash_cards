import 'package:flash_cards/adapter/hive_registrar.g.dart';
import 'package:flash_cards/model/deck.model.dart';
import 'package:flash_cards/my_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox<Deck>('decksBox');
  runApp(const MyApp());
}
