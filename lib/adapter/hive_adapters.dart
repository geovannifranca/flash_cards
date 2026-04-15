import 'package:flash_cards/model/card.model.dart';
import 'package:flash_cards/model/deck.model.dart';
import 'package:hive_ce/hive_ce.dart';

@GenerateAdapters([AdapterSpec<Deck>(), AdapterSpec<Card>()])
part 'hive_adapters.g.dart';
