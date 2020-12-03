import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedPage = 0;
  var pages = [Vitrine(), Categorias(), Squad()];

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
                    colors: [Colors.deepPurple, Colors.red.shade600],
                    stops: [0.0, 0.6],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.email),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Fale conosco'),
                subtitle: Text('Equipe de suporte Mitridates'),
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
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Vitrine'),
          BottomNavigationBarItem(
              icon: Icon(Icons.umbrella), label: 'Categorias'),
          BottomNavigationBarItem(icon: Icon(Icons.shield), label: 'Squad'),
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

class Vitrine extends StatefulWidget {
  @override
  _VitrineState createState() => _VitrineState();
}

class _VitrineState extends State<Vitrine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.deepOrange),
    );
  }
}

class Categorias extends StatefulWidget {
  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.deepPurple),
    );
  }
}

class Squad extends StatefulWidget {
  @override
  _SquadState createState() => _SquadState();
}

class _SquadState extends State<Squad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.pink),
    );
  }
}
