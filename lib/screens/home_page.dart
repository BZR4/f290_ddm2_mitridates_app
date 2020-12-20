import 'package:f290_ddm2_mitridates_app/constants/contants.dart';
import 'package:f290_ddm2_mitridates_app/screens/vitrine_page.dart';
import 'package:f290_ddm2_mitridates_app/services/vitrine_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'categorias.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedPage = 0;
  var pages = <Widget>[];

  final service = VitrineService();

  @override
  void initState() {
    super.initState();
    pages.add(VitrinePage());
    pages.add(CategoriasPage());

    _loadVitrine();
  }

  _loadVitrine() async {
    service.getVitrine('').then((list) {
      list.forEach((element) {
        print(element);
      });
    });
  }

  final Uri uriEmail = Uri(
      scheme: 'mailto',
      path: 'esdrasilva@gmail.com',
      queryParameters: {
        'subject': 'Gostaria muito de entra em contato com vocês!'
      });

  Future launchEmail(String uri) async {
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Falha ao enviar email.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mitrídates'),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/0/06/Mithridates_VI_Louvre.jpg'),
                ),
                accountName: Text('Mitrídates'),
                accountEmail: Text('contato@mitridates.com'),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kPrimaryColor, kPrimaryColorDark],
                    stops: [0.0, 0.6],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.email),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Fale conosco'),
                subtitle: Text('Equipe de suporte Mitridates'),
                onTap: () {
                  launch(uriEmail.toString());
                },
              ),
              ListTile(
                leading: Icon(Icons.access_alarm),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Developers'),
                subtitle: Text('Conheça nosso time'),
                onTap: () {
                  print('Close!');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sair'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: selectedPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Vitrine'),
          BottomNavigationBarItem(
              icon: Icon(Icons.umbrella), label: 'Categorias'),
        ],
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
