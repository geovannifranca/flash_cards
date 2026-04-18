import 'package:uuid/uuid.dart';

class AppCard {
  final String id;
  final String front;
  final String back;

  AppCard({String? id, required this.front, required this.back})
    : id = id ?? const Uuid().v4();
}
