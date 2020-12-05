import 'dart:convert';
import 'package:f290_ddm2_mitridates_app/model/vitrine.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class VitrineService {
  final url = 'https://plataforma-fatec-araras-api.herokuapp.com/api/vitrine/';

  Future<List<Vitrine>> getVitrine() async {
    var response = await http.get(url, headers: {
      // HttpHeaders.contentTypeHeader: "charset=utf-8",
      'Content-Type': 'application/json',
    });
    var vitrine = List<Vitrine>();
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonResultList =
            json.decode(utf8.decode(response.bodyBytes));
        // var jsonResultList = convert.jsonDecode(response.body);
        vitrine =
            // (jsonResultList as List).map((c) => (Vitrine.fromJson(c))).toList();
            (jsonResultList).map((c) => (Vitrine.fromJson(c))).toList();
      }
      return vitrine;
    } catch (e) {
      print('Erro: ${e.toString()}');
      return vitrine;
    }
  }

  Future launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Falha ao abrir url: $url';
    }
  }
}
