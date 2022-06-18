import 'package:hive_flutter/hive_flutter.dart';
import 'package:tripkuy/core/database/utility_box.dart';

part 'user_box.g.dart';

@HiveType(typeId: UtilityBox.hiveType1)

class UserBox {
  
  @HiveField(1)
  int? id;

  @HiveField(2)
  int? salesSaldo;

  @HiveField(3)
  String? referral;

  @HiveField(4)
  String? name;

  @HiveField(5)
  String? email;

  @HiveField(6)
  int? roleId;

  @HiveField(7)
  String? salesCode;

  @HiveField(8)
  String? address;

  @HiveField(9)
  String? phoneNumber;

  @HiveField(10)
  String? storeName;
  
  @HiveField(11)
  int? totalBonus;

  @HiveField(12)
  int? totalBalance;

  @HiveField(13)
  int? totalPoint;

  @HiveField(14)
  String? photoProfile;

  @HiveField(15)
  String? authToken;

  @HiveField(16)
  String? birthDate;

  @HiveField(17)
  String? birthPlace;

  @HiveField(18)
  String? gender;

  @HiveField(19)
  String? fcmToken;

  UserBox({
    this.id,
    this.salesSaldo,
    this.referral,
    this.name,
    this.email,
    this.roleId,
    this.salesCode,
    this.address,
    this.phoneNumber,
    this.storeName,
    this.totalBonus,
    this.totalBalance,
    this.totalPoint,
    this.authToken,
    this.photoProfile,
    this.birthDate,
    this.birthPlace,
    this.gender,
    this.fcmToken
  });

  UserBox.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salesSaldo = json['sales_saldo'];
    referral = json['referral'];
    name = json['name'];
    email = json['email'];
    roleId = json['role_id'];
    salesCode = json['sales_code'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    storeName = json['store_name'];
    totalBonus = json['total_bonus'];
    totalBalance = json['total_balance'];
    totalPoint = json['total_point'];
    authToken = json['auth_token'];
    photoProfile = json['photo_profile'];
    birthDate = json['birth_date'];
    birthPlace = json['birth_place'];
    gender = json['gender'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sales_saldo'] = salesSaldo;
    data['referral'] = referral;
    data['name'] = name;
    data['email'] = email;
    data['role_id'] = roleId;
    data['sales_code'] = salesCode;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['store_name'] = storeName;
    data['total_bonus'] = totalBonus;
    data['total_balance'] = totalBalance;
    data['total_point'] = totalPoint;
    data['auth_token'] = authToken;
    data['photo_profile'] = photoProfile;
    data['birth_date'] = birthDate;
    data['birth_place'] = birthPlace;
    data['gender'] = gender;
    data['fcm_token'] = fcmToken;
    return data;
  }
}
