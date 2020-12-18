import 'package:f290_ddm2_mitridates_app/Model/vitrine.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VitrineRepository {
  Future<List<Vitrine>> fetchVitrine(String filtro) async {
    var url = 'http://18.231.178.234/api/vitrine/';

    http.Response response;
    await new Future.delayed(const Duration(seconds: 1));
    if (filtro.isNotEmpty) {
      url = url + 'tipo/' + filtro;
    }
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    var vitrine = List<Vitrine>();
    // try {
    if (response.statusCode == 200) {
      List<dynamic> jsonResultList =
          json.decode(utf8.decode(response.bodyBytes));

      vitrine = (jsonResultList).map((c) => (Vitrine.fromJson(c))).toList();
    }
    return vitrine;
  }
}
