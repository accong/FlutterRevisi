import 'package:flutter/material.dart';
import 'package:tripkuy/core/util/util.dart';
import 'package:tripkuy/model/destination.dart';
import 'package:tripkuy/model/tourguide.dart';

enum ErrorPPOB { payed, unknow, failed }

class Constant {
  static const poppinsRegular = "poppins_regular";

  static const String adminEmail = "admin@gmail.com";
  static const String adminPassword = "12345678";
  static const String adminName = "Super Admin Chairil";

  static const fontSizeLargeExtra = 20.0;
  static const fontSizeLarge = 15.0;
  static const fontSizeMedium = 13.0;
  static const fontSizeSmall = 11.0;
  static const paddingScreen =
      EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static const double paddingHorizontalScreen = 20.0;

  static final List<Tourguide> listTourguide = [
    Tourguide(
        nama: "Chairil",
        email: "chairil@gmail.com",
        location: "Bandung",
        phone: "092748732"),
    Tourguide(
        nama: "Rafi",
        email: "raif@gmail.com",
        location: "Jakarta",
        phone: "082174897"),
    Tourguide(
        nama: "Purnama",
        email: "Purnama@gmail.com",
        location: "Bali",
        phone: "01232133"),
  ];

  static final List<String> listCategory = [
    "all",
    "Ciwidey",
    "Puncak Ciumbuleuit",
    "Pangalengan"
  ];

  static final List<Destination> listDestination = [
    Destination(
        nama: "Burj Khalifa",
        catering: "Makanan",
        desc:
            "Nama Ciwidey, menurut penduduk di sana, berasal dari bahasa Portugis kuno. Dimana arti kata ciwi adalah kiwi dan dey adalah hari. Tetapi ada juga yang menyebut Ciwidey berasal dari bahasa Yunani kuno. Dimana Ciwow yang berarti sapi dan Dos artinya lima. Menurut kepercayaan, Ciwidey dulunya adalah tempat lahirnya sapi berkepala lima.",
        image: "assets/images/image_menu1.png",
        location: "Uni Emirate Arab",
        price: CoreFunction.moneyFormatter(2000000),
        tourguide: "Chairil"),
    Destination(
        nama: "Millenium Park",
        catering: "Makanan",
        desc:
            "Jakarta, Indonesia's massive capital, sits on the northwest coast of the island of Java. A historic mix of cultures – Javanese, Malay, Chinese, Arab, Indian and European – has influenced its architecture, language and cuisine. The old town, Kota Tua, is home to Dutch colonial buildings, Glodok (Jakarta’s Chinatown) and the old port of Sunda Kelapa, where traditional wooden schooners dock. ― Google",
        image: "assets/images/image_menu2.png",
        location: "Chicago, USA",
        price: CoreFunction.moneyFormatter(3000000),
        tourguide: "Rafi"),
    Destination(
        nama: "Tanah Lot",
        catering: "Makanan",
        desc:
            "Tanah Lot is a rock formation off the Indonesian island of Bali. It is home to the ancient Hindu pilgrimage temple Pura Tanah Lot, a popular tourist and cultural icon for photography. Wikipedia",
        image:
            "https://media.tacdn.com/media/attractions-splice-spp-674x446/07/a3/81/e3.jpg",
        location: "Bali",
        price: CoreFunction.moneyFormatter(9000000),
        tourguide: "Purnama"),
  ];

  static final List<Destination> listRecommended = [
    Destination(
        nama: "Ciwidey",
        catering: "Makanan",
        desc:
            "Nama Ciwidey, menurut penduduk di sana, berasal dari bahasa Portugis kuno. Dimana arti kata ciwi adalah kiwi dan dey adalah hari. Tetapi ada juga yang menyebut Ciwidey berasal dari bahasa Yunani kuno. Dimana Ciwow yang berarti sapi dan Dos artinya lima. Menurut kepercayaan, Ciwidey dulunya adalah tempat lahirnya sapi berkepala lima.",
        image:
            "https://asset.kompas.com/crops/nG2HXjKEC1s4eEeJNAM3m2W9X0E=/0x23:700x373/750x500/data/photo/2020/09/07/5f5581f1e138a.jpg",
        location: "Bandung",
        price: CoreFunction.moneyFormatter(2000000),
        tourguide: "Chairil"),
    Destination(
        nama: "Taman Mini Indonesia",
        catering: "Makanan",
        desc:
            "Jakarta, Indonesia's massive capital, sits on the northwest coast of the island of Java. A historic mix of cultures – Javanese, Malay, Chinese, Arab, Indian and European – has influenced its architecture, language and cuisine. The old town, Kota Tua, is home to Dutch colonial buildings, Glodok (Jakarta’s Chinatown) and the old port of Sunda Kelapa, where traditional wooden schooners dock. ― Google",
        image:
            "https://akcdn.detik.net.id/visual/2021/04/08/wisata-tmii_169.jpeg?w=650",
        location: "Jakarta",
        price: CoreFunction.moneyFormatter(3000000),
        tourguide: "Rafi"),
    Destination(
        nama: "Tanah Lot",
        catering: "Makanan",
        desc:
            "Tanah Lot is a rock formation off the Indonesian island of Bali. It is home to the ancient Hindu pilgrimage temple Pura Tanah Lot, a popular tourist and cultural icon for photography. Wikipedia",
        image:
            "https://media.tacdn.com/media/attractions-splice-spp-674x446/07/a3/81/e3.jpg",
        location: "Bali",
        price: CoreFunction.moneyFormatter(9000000),
        tourguide: "Purnama"),
  ];
}
