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
                          Text('Estágio',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w900)),
                          Text('Aluno: Marcelo Eliseu',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                          Text('Curso: Sistemas para Internet',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500)),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ac risus et lacus consequat placerat a quis diam. Cras rutrum magna blandit, pellentesque ipsum id, iaculis orci. Maecenas tincidunt nisi vulputate condimentum sollicitudin. Curabitur maximus et purus a venenatis. Sed rhoncus erat congue condimentum accumsan. Vestibulum volutpat lectus et nunc pulvinar pharetra. Integer ac felis dui. Donec efficitur diam sed lorem tincidunt, ac condimentum sapien pharetra. Suspendisse interdum cursus libero sit amet suscipit. Etiam sodales urna sit amet libero molestie sagittis. Duis laoreet mauris vitae dapibus aliquet.',
                          ),
                        ]),
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
