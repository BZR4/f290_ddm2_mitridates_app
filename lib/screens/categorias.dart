import 'package:f290_ddm2_mitridates_app/Model/vitrine.dart';
import 'package:f290_ddm2_mitridates_app/services/vitrine_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'categoria_page.dart';

class CategoriasPage extends StatefulWidget {
  @override
  _CategoriaPagesState createState() => _CategoriaPagesState();
}

class _CategoriaPagesState extends State<CategoriasPage> {
  VitrineService service = VitrineService();
  List<Vitrine> vitrine = List<Vitrine>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Selecione um dos cards para filtrar os alunos',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "images/estagio.svg",
                      height: 150,
                    ),
                    ListTile(
                      title: Text(
                        'Estágio',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      subtitle: Text(
                          'Conheça nossos alunos disponíneis para estágio.'),
                    ),
                    ButtonBar(
                      children: [
                        FlatButton(
                          onPressed: () {
                            print('precionado');

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CategoriaPage(vitrine: vitrine)));
                          },
                          child: Text('ABRIR'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "images/trabalho.svg",
                      height: 150,
                    ),
                    ListTile(
                      title: Text(
                        'Trabalho',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      subtitle: Text(
                          'Conheça nossos alunos com disponibilidade para trabalho em tempo integral.'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // _loadData(String filtro) async {
  //   vitrine = await service.getVitrine(filtro);
  // }
}
