import 'package:flutter/material.dart';

import '../widgets/select.widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
late TextEditingController _controller;
List<String> opciones = ["azul","rojo"];

 @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("Detalles de Busqueda"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: 
                    Container (
                      // ignore: sort_child_properties_last
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                       
                       Padding(
                         padding: const EdgeInsets.all(20),
                         child: Center(
                            child: TextField(
                            controller: _controller,                              
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Escribe el nombre la pelicula',
                              hintStyle: TextStyle(color: Color.fromARGB(255, 245, 245, 245)),
                            ),
                          )
                         ),
                       ),
                       SelectDown(listaOpciones: opciones),
                      ],
                    ),
                    decoration: BoxDecoration(
                                  
                                    //color: Color.fromARGB(255, 233, 233, 243),
                                    borderRadius: BorderRadius.circular(20)
                                ),  
                  )
                  ),
                ),
              ],
            )
          ),
        ]
      ),
    );
  }
}