import 'package:f290_ddm2_mitridates_app/controllers/categorias_controller.dart';
import 'package:flutter/material.dart';

// import 'categoria_page.dart';

class CategoriasPage extends StatefulWidget {
  @override
  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final controller = CategoriasController();

  _success() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Filtrar os alunos',
              // style: Theme.of(context).textTheme.headline4,
            ),
          ),
          // Card(
          //   child: Container(
          //     padding: EdgeInsets.all(16),
          //     child: Column(
          //       children: [
          //         SvgPicture.asset(
          //           "images/estagio.svg",
          //           height: 80,
          //         ),
          //         ListTile(
          //           title: Text(
          //             'Estágio',
          //             style: Theme.of(context).textTheme.headline4,
          //           ),
          //           subtitle: Text(
          //               'Conheça nossos alunos disponíneis para estágio.'),
          //         ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: FlatButton(
                  onPressed: () {
                    print('Estágio');
                    controller.start('0');

                    // List<Vitrine> vitrine = Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) =>
                    //             CategoriaPage(vitrine: vitrine)));
                  },
                  child: Text(
                    'Estágio',
                    // style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              Card(
                child: FlatButton(
                  onPressed: () {
                    print('Trabalho');
                    controller.start('1');

                    // List<Vitrine> vitrine = Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) =>
                    //             CategoriaPage(vitrine: vitrine)));
                  },
                  child: Text(
                    'Trabalho',
                    // style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ],
          )
          //       ],
          //     ),
          //   ),
          // ),
          // Card(
          //   child: Container(
          //     padding: EdgeInsets.all(16),
          //     child: Column(
          //       children: [
          //         SvgPicture.asset(
          //           "images/trabalho.svg",
          //           height: 80,
          //         ),
          //         ListTile(
          //           title: Text(
          //             'Trabalho',
          //             style: Theme.of(context).textTheme.headline4,
          //           ),
          //           subtitle: Text(
          //               'Conheça nossos alunos com disponibilidade para trabalho em tempo integral.'),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          controller.start('');
        },
        child: Text('Tentar Novamente'),
      ),
    );
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  stateManagement(CategoriasState state) {
    switch (state) {
      case CategoriasState.start:
        return _start();

      case CategoriasState.loading:
        return _loading();

      case CategoriasState.error:
        return _error();

      case CategoriasState.success:
        return _success();

      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
