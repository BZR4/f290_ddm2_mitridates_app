import 'package:f290_ddm2_mitridates_app/constants/contants.dart';
import 'package:f290_ddm2_mitridates_app/controllers/categorias_controller.dart';
import 'package:f290_ddm2_mitridates_app/services/vitrine_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'categoria_page.dart';
// List<Vitrine> vitrine = List<Vitrine>();

class CategoriasPage extends StatefulWidget {
  @override
  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final controller = CategoriasController();
  final service = VitrineService();

  _pre() {
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
                    controller.start('1');

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
                    controller.start('0');

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

  _success() {
    // return SingleChildScrollView(
    //   child: Column(
    //     children: [
    // return Column(
    //   children: [
    //     // mainAxisAlignment: MainAxisAlignment.center,
    //     // child:
    //     Card(
    //       child: FlatButton(
    //         onPressed: () {
    //           print('voltar');
    //           controller.pre();
    //         },
    //         child: Text(
    //           'Limpar',
    //           // style: Theme.of(context).textTheme.headline4,
    //         ),
    //       ),
    //     ),
    //     //   ],
    //     // ),
    return ListView.builder(
      itemCount: controller.vitrines.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 6,
            child: ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Colors.blueAccent,
                      width: 8,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.vitrines[index].tipoVaga,
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 24,
                                fontWeight: FontWeight.w900)),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(height: 1, color: kDisabledColor),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Aluno: ${controller.vitrines[index].aluno}',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Curso: ${controller.vitrines[index].curso}',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 22,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 16,
                        ),
                        Text(controller.vitrines[index].descricao,
                            style: TextStyle(fontFamily: 'Nunito')),
                        ButtonBar(
                          children: [
                            (controller.vitrines[index].linkedin.isNotEmpty)
                                ? IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.linkedin,
                                      color: kPrimaryColor,
                                    ),
                                    onPressed: () {
                                      var url =
                                          controller.vitrines[index].linkedin;
                                      service.launchUrl(url);
                                    })
                                : Text(""),
                            (controller.vitrines[index].github.isNotEmpty)
                                ? IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.github,
                                      color: kPrimaryColor,
                                    ),
                                    onPressed: () {
                                      if (controller
                                          .vitrines[index].github.isNotEmpty) {
                                        var url =
                                            controller.vitrines[index].github;
                                        service.launchUrl(url);
                                      }
                                    },
                                  )
                                : Text(""),
                          ],
                        )
                      ]),
                ),
              ),
              clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        );
      },
      //       ),
      //     ],
      //   ),
      //   ),
      // ],
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
      case CategoriasState.pre:
        return _pre();

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
    controller.pre();
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
