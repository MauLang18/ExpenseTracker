// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_pre.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddpreAdapter extends TypeAdapter<Add_pre> {
  @override
  final int typeId = 3;

  @override
  Add_pre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Add_pre(
      fields[4] as String,
      fields[3] as String,
      fields[2] as String,
      fields[1] as String,
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Add_pre obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.explain)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.in_)
      ..writeByte(4)
      ..write(obj.horas);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddpreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
