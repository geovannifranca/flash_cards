import 'package:uuid/uuid.dart';

class Card {
  final String id;
  final String front;
  final String back;

  Card({String? id, required this.front, required this.back})
    : id = id ?? const Uuid().v4();
}
