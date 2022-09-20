import 'package:flutter/material.dart';

import 'details.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("FilmInspector"),),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
            },
            child: Container(
              child: Row(children: [
                Text("Home Page")
              ]),
            ),
          ),
        ],
      ),
    );
  }
}