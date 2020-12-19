import 'package:f290_ddm2_mitridates_app/constants/contants.dart';
import 'package:f290_ddm2_mitridates_app/services/vitrine_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriaPage extends StatelessWidget {
  final service = VitrineService();
  final String filtro;

  CategoriaPage({this.filtro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FC),
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: FutureBuilder(
        future: service.getVitrine(filtro),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: Text('Ainda não deu...'));
            default:
              List vitrine = snapshot.data;
              return ListView.builder(
                itemCount: vitrine.length,
                itemBuilder: (context, index) {
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
                                  Text(vitrine[index].tipoVaga,
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
                                  Text('Aluno: ${vitrine[index].aluno}',
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('Curso: ${vitrine[index].curso}',
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(vitrine[index].descricao,
                                      style: TextStyle(fontFamily: 'Nunito')),
                                  ButtonBar(
                                    children: [
                                      (vitrine[index].linkedin.isNotEmpty)
                                          ? IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.linkedin,
                                                color: kPrimaryColor,
                                              ),
                                              onPressed: () {
                                                var url =
                                                    vitrine[index].linkedin;
                                                // service.launchUrl(url);
                                              })
                                          : Text(""),
                                      (vitrine[index].github.isNotEmpty)
                                          ? IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.github,
                                                color: kPrimaryColor,
                                              ),
                                              onPressed: () {
                                                if (vitrine[index]
                                                    .github
                                                    .isNotEmpty) {
                                                  var url =
                                                      vitrine[index].github;
                                                  // service.launchUrl(url);
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
              );
          }
        },
      ),
    );
  }
}
