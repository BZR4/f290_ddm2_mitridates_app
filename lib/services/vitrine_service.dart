import 'dart:convert';
import 'package:f290_ddm2_mitridates_app/model/vitrine.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class VitrineService {
  final url = 'http://18.231.178.234/api/vitrine/';

  Future<List<Vitrine>> getVitrine(String filtro) async {
    http.Response response;
    if (filtro.isNotEmpty) {
      response = await http.get(url + 'tipo/' + filtro, headers: {
        'Content-Type': 'application/json',
      });
    } else {
      response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });
    }
    var vitrine = <Vitrine>[];
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonResultList =
            json.decode(utf8.decode(response.bodyBytes));
        vitrine = (jsonResultList).map((c) => (Vitrine.fromJson(c))).toList();
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
