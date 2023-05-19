// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddtodoAdapter extends TypeAdapter<Add_todo> {
  @override
  final int typeId = 2;

  @override
  Add_todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Add_todo(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Add_todo obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddtodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
