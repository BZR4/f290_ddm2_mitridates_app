import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'categoria_page.dart';

class CategoriasPage extends StatefulWidget {
  @override
  _CategoriaPagesState createState() => _CategoriaPagesState();
}

class _CategoriaPagesState extends State<CategoriasPage> {
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CategoriaPage(filtro: '0')));
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
                    ButtonBar(
                      children: [
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CategoriaPage(filtro: '1')));
                          },
                          child: Text('ABRIR'),
                        )
                      ],
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
}
