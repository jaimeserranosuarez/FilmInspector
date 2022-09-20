import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Detalles de la pelicula"),),
      body: Column(
        children: [    
             Container(
              child: Row(children: [
                Text("Details Page")
              ]),
            ),
          
        ],
      ),
    );
  }
}