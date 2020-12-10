import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriaPage extends StatefulWidget {
  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    subtitle:
                        Text('Conheça nossos alunos disponíneis para estágio.'),
                  ),
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
    );
  }
}
