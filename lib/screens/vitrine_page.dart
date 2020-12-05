import 'package:flutter/material.dart';

class VitrinePage extends StatefulWidget {
  @override
  _VitrinePageState createState() => _VitrinePageState();
}

/*
Title -> tipo_vaga
sub -> aluno
curso -> curso
descricao -> 

vermais -> git, linkedin -> botoes com link
*/

class _VitrinePageState extends State<VitrinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FC),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ClipPath(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.blueAccent,
                        width: 8,
                      ),
                    ),
                  ),
                ),
                clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
