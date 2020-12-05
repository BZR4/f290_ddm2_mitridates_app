import 'dart:io';
import 'package:f290_ddm2_mitridates_app/model/vitrine.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher.dart';

class VitrineService {
  final url = 'https://plataforma-fatec-araras-api.herokuapp.com/api/vitrine/';

  Future<List<Vitrine>> getVitrine() async {
    var response = await http.get(url, headers: {
      HttpHeaders.contentTypeHeader: "charset=utf-8",
    });
    var vitrine = List<Vitrine>();
    try {
      if (response.statusCode == 200) {
        var jsonResultList = convert.jsonDecode(response.body);
        vitrine =
            (jsonResultList as List).map((c) => (Vitrine.fromJson(c))).toList();
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
