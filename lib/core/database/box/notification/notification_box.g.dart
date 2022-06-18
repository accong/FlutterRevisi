// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationBoxAdapter extends TypeAdapter<NotificationBox> {
  @override
  final int typeId = 2;

  @override
  NotificationBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationBox(
      dataTitle: fields[1] as String?,
      dataBody: fields[2] as String?,
      dataImage: fields[3] as String?,
      clickAction: fields[4] as String?,
      notificationType: fields[5] as String?,
      statucCode: fields[6] as String?,
      statusName: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationBox obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.dataTitle)
      ..writeByte(2)
      ..write(obj.dataBody)
      ..writeByte(3)
      ..write(obj.dataImage)
      ..writeByte(4)
      ..write(obj.clickAction)
      ..writeByte(5)
      ..write(obj.notificationType)
      ..writeByte(6)
      ..write(obj.statucCode)
      ..writeByte(7)
      ..write(obj.statusName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
