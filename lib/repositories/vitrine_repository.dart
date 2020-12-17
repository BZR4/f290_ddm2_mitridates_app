import 'package:f290_ddm2_mitridates_app/Model/vitrine.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VitrineRepository {
  final url = 'http://18.231.178.234/api/vitrine/';

  Future<List<Vitrine>> fetchVitrine(String filtro) async {
    http.Response response;
    if (filtro.isNotEmpty) {
      response = await http.get(url + 'tipo/' + filtro, headers: {
        // HttpHeaders.contentTypeHeader: "charset=utf-8",
        'Content-Type': 'application/json',
      });
    } else {
      response = await http.get(url, headers: {
        // HttpHeaders.contentTypeHeader: "charset=utf-8",
        'Content-Type': 'application/json',
      });
    }
    var vitrine = List<Vitrine>();
    // try {
    if (response.statusCode == 200) {
      List<dynamic> jsonResultList =
          json.decode(utf8.decode(response.bodyBytes));
      // var jsonResultList = convert.jsonDecode(response.body);
      vitrine =
          // (jsonResultList as List).map((c) => (Vitrine.fromJson(c))).toList();
          (jsonResultList).map((c) => (Vitrine.fromJson(c))).toList();
    }
    return vitrine;
    // } catch (e) {
    //   print('Erro: ${e.toString()}');
    //   return vitrine;
    // }
  }
}
