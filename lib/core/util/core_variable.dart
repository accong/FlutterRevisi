import 'package:flutter/material.dart';

class CoreVariable {

  //? Global Attributte
  static const bool debug = true;
  static const bool production = true;

  //? Config API
  static const String appsVersionAndroid = "v1.0.0";
  static const String appsversionIos = "v1.0.0";
  static const String clientKey = "f91f6194378f27fb58d8c5d59afa6778";
  static const String urlStagging = "https://core-pp.bfireship.com/api/";
  static const String urlProduction = "https://core-pp.bfireship.com/api/";

  static const String urlProvince = "https://province.atozpay.co.id/api/";

  static const String appsOrigin = "Customer";
  static const String cacheControl = "no-cache";
  static const String contentType = "application/json";

  static const Duration timeRequestApi = Duration(minutes: 1);
  static const int countdownVerification = 120; //? Second
  static const int durationShimmer = 1200;

  //? Encrypt Atributte (sample)
  static const String password = "asf1t3QqsPySdssEj-sU";
  static const String salt = "cWzFTEf9HAZeQ9zpgZZG";

  static const String notificationBroadcast = "notification_broadcast";

  static const String notificationUpdateOrder = "notification_update_order";

  static const String minlength8char = r'Panjang Karakter Minimal 8 Karakter';

  static const String minlength4char = r'Panjang Karakter Minimal 4 Karakter';

  //? Firebase
  static const String firebaseCollection = 'messaging';
  static const String firebaseDocument = 'chat';
  static const String isUnreadConsumer = 'is_unread_consumer';
  static const String isUnreadMerchant = 'is_unread_merchant';

  static const List<String> codedMonth = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  static const List<String> decodedMonth = [
    r'Januari',
    r'Februari',
    r'Maret',
    r'April',
    r'Mei',
    r'Juni',
    r'Juli',
    r'Agustus',
    r'September',
    r'Oktober',
    r'November',
    r'Desember'
  ];

  //BorderRadius circular
  static final borderRadius5 = BorderRadius.circular(5);
  static final borderRadius10 = BorderRadius.circular(10);
  static final borderRadius15 = BorderRadius.circular(15);
  static final borderRadius20 = BorderRadius.circular(20);
  static final borderRadius25 = BorderRadius.circular(25);
  static final borderRadius30 = BorderRadius.circular(30);
  static final borderRadius35 = BorderRadius.circular(35);
  static final borderRadius40 = BorderRadius.circular(40);
  static final borderRadius45 = BorderRadius.circular(45);
  static final borderRadius50 = BorderRadius.circular(50);
  static final borderRadius55 = BorderRadius.circular(55);
  static final borderRadius60 = BorderRadius.circular(60);
  static final borderRadius65 = BorderRadius.circular(65);
  static final borderRadius70 = BorderRadius.circular(70);
  static final borderRadius75 = BorderRadius.circular(75);
  static final borderRadius80 = BorderRadius.circular(80);
  static final borderRadius85 = BorderRadius.circular(85);
  static final borderRadius90 = BorderRadius.circular(90);
  static final borderRadius95 = BorderRadius.circular(95);
  static final borderRadius100 = BorderRadius.circular(100);

  static const String payment = r'payment';
  static const String inquiry = r'inquiry';
  static const String bill = r'Tagihan';

  static const String simpananPokok = r'simpanan-pokok';
  static const String simpananWajib = r'simpanan-wajib';
  static const String simpananMultiguna = r'simpanan-multiguna';

  //? Notification Type
  static const String notificationTypeOrder = 'order';
  static const String notificationTypeChat = 'chat';
  static const String notificationTypePPOB = 'ppob';
  static const String notificationTypeTopUp = 'topup';
  static const String notificationTypePulsaAndEMoney = 'pulsa&emoney';
  static const String notificationTypeKYC = 'kyc';
  static const String notificationTypeTransaction = 'transaction';
  static const String notificationTypeTransactionn = 'Transaction';
  static const String notificationTypeTransfer = 'transfer';
  static const String notification = "notification";
  static const String notificationTypeInfo = 'info';
  static const String notificationUpdateBadge = 'update_badge';

  //? Notification Action
  static const String notificationClickActionChat = 'ACTION_CHAT';
  static const String notificationClickActionTransfer = 'ACTION_TRANSFER';
  static const String notificationClickActionOrder = 'ACTION_ORDER';
  static const String notificationClickActionPPOB = 'ACTION_PPOB';
  static const String notificationClickActionTopUp = 'ACTION_TOPUP';
  static const String notificationClickActionInfo = 'ACTION_INFO';
  static const String notificationClickActionEMoney = 'ACTION_EMONEY';
  static const String notificationClickActionPulsa = 'ACTION_PULSA';
  static const String notificationClickActionTransaction = 'ACTION_TRANSACTION';
  static const String notificationClickActionWitdraw = 'ACTION_WITHDRAW';

}
