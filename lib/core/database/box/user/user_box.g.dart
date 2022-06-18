// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserBoxAdapter extends TypeAdapter<UserBox> {
  @override
  final int typeId = 1;

  @override
  UserBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserBox(
      id: fields[1] as int?,
      salesSaldo: fields[2] as int?,
      referral: fields[3] as String?,
      name: fields[4] as String?,
      email: fields[5] as String?,
      roleId: fields[6] as int?,
      salesCode: fields[7] as String?,
      address: fields[8] as String?,
      phoneNumber: fields[9] as String?,
      storeName: fields[10] as String?,
      totalBonus: fields[11] as int?,
      totalBalance: fields[12] as int?,
      totalPoint: fields[13] as int?,
      authToken: fields[15] as String?,
      photoProfile: fields[14] as String?,
      birthDate: fields[16] as String?,
      birthPlace: fields[17] as String?,
      gender: fields[18] as String?,
      fcmToken: fields[19] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserBox obj) {
    writer
      ..writeByte(19)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.salesSaldo)
      ..writeByte(3)
      ..write(obj.referral)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.roleId)
      ..writeByte(7)
      ..write(obj.salesCode)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.phoneNumber)
      ..writeByte(10)
      ..write(obj.storeName)
      ..writeByte(11)
      ..write(obj.totalBonus)
      ..writeByte(12)
      ..write(obj.totalBalance)
      ..writeByte(13)
      ..write(obj.totalPoint)
      ..writeByte(14)
      ..write(obj.photoProfile)
      ..writeByte(15)
      ..write(obj.authToken)
      ..writeByte(16)
      ..write(obj.birthDate)
      ..writeByte(17)
      ..write(obj.birthPlace)
      ..writeByte(18)
      ..write(obj.gender)
      ..writeByte(19)
      ..write(obj.fcmToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
