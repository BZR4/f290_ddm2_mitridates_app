import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Squad extends StatefulWidget {
  @override
  _SquadState createState() => _SquadState();
}

class _SquadState extends State<Squad> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          child: Card(
            child: Row(
              children: [
                Container(
                  height: 150,
                  child: Image.network(
                    "https://avatars3.githubusercontent.com/u/51539646?s=460&u=685d6029355905e34a9ec486d620401e7c7d45a5&v=4",
                    fit: BoxFit.fitHeight,
                    width: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vinicius Vieira",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(height: 1, color: Colors.black),
                      Text(
                        "vvinicius.vieira@gmail.com",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ButtonBar(
                        children: [
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.linkedin,
                                color: Colors.blue,
                              ),
                              onPressed: () {}),
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.github,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
