import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/tempat_pariwisata.dart';

class Webservice {
  Future<List<TempatPariwisata>> loadTempatPariwisata() async {
    String url = "http://10.0.2.2:8000/api/tempat_pariwisatas";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body);
      final Iterable list = json["tempat_pariwisata"];
      return list.map((item) => TempatPariwisata.fromJSON((item))).toList();
    } else {
      throw Exception("Error loading tempat pariwisata...");
    }
  }
}
