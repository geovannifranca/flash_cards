import 'package:uuid/uuid.dart';

class Card {
  final String id;
  final String front;
  final String back;

  Card({required this.front, required this.back}) : id = Uuid().v4();
}
