

import 'package:hive_flutter/hive_flutter.dart';
import 'package:tripkuy/core/database/utility_box.dart';

part 'notification_box.g.dart';

@HiveType(typeId: UtilityBox.hiveType2)

class NotificationBox {

  @HiveField(1)
  String? dataTitle;

  @HiveField(2)
  String? dataBody;

  @HiveField(3)
  String? dataImage;

  @HiveField(4)
  String? clickAction;

  @HiveField(5)
  String? notificationType;

  @HiveField(6)
  String? statucCode;

  @HiveField(7)
  String? statusName;

  NotificationBox({
    this.dataTitle,
    this.dataBody,
    this.dataImage,
    this.clickAction,
    this.notificationType,
    this.statucCode,
    this.statusName
  });

  NotificationBox.fromJson(Map<String, dynamic> json) {
    dataTitle = json['data_title'];
    dataBody = json['data_body'];
    dataImage = json['data_image'];
    clickAction = json['click_action'];
    notificationType = json['notification_type'];
    statucCode = json['statuc_code'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data_title'] = dataTitle;
    data['data_body'] = dataBody;
    data['data_image'] = dataImage;
    data['click_action'] = clickAction;
    data['notification_type'] = notificationType;
    data['statuc_code'] = statucCode;
    data['status_name'] = statusName;
    return data;
  }
}
