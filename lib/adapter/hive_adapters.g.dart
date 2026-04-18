// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class DeckAdapter extends TypeAdapter<Deck> {
  @override
  final typeId = 0;

  @override
  Deck read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Deck(
      id: fields[2] as String?,
      title: fields[0] as String,
      cards: fields[1] == null ? const [] : (fields[1] as List).cast<AppCard>(),
    );
  }

  @override
  void write(BinaryWriter writer, Deck obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.cards)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeckAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AppCardAdapter extends TypeAdapter<AppCard> {
  @override
  final typeId = 2;

  @override
  AppCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppCard(
      id: fields[0] as String?,
      front: fields[1] as String,
      back: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppCard obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.front)
      ..writeByte(2)
      ..write(obj.back);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
