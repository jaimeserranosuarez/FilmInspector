// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../models/genres.model.dart';
import '../widgets/select.widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
late TextEditingController _controller;
 Map<String,String> opcionesTipoMap = {
  "Pelicula": "feature",
  "TV pelicula":"tv_movie",
  "Serie":"tv_series"
  };
  
List<String> opcionesTipo = [
  "Pelicula",
  "TV pelicula",
  "Serie"
];

Map<String,String> opcionesGeneroMap = {
  "Acción":"action",
  "Aventura":"adventure",
  "Animación":"animation",
  "Biografico":"biography",
  "Comedia":"comedy",
  "Crimen":"crime",
  "Documental":"documentary",
  "Drama":"drama",
  "Familiar":"family",
  "Fantasia":"fantasy",
  "Cine Negro":"film_noir",
  "Game Show":"game_show",
  "Historia":"history",
  "Horror":"horror",
  "Musica":"music",
  "Musical":"musical",  
  "Misterio":"mystery",
  "Noticias":"news",
  "Reality Show":"reality_tv",
  "Romance":"romance",
  "Ciencia Ficcion":"sci_fi",
  "Deportes":"sport",
  "Talk Show":"talk_show",
  "Suspenso":"thriller",
  "Guerra":"war",
  "Viejo Oeste":"western" 
};

List<String> opcionesGenero = [
  "Acción",
  "Aventura",
  "Animación",
  "Biografico",
  "Comedia",
  "Crimen",
  "Documental",
  "Drama",
  "Familiar",
  "Fantasia",
  "Cine Negro",
  "Game Show",
  "Historia",
  "Horror",
  "Musica",
  "Musical",  
  "Misterio",
  "Noticias",
  "Reality Show",
  "Romance",
  "Ciencia Ficcion",
  "Deportes",
  "Talk Show",
  "Suspenso",
  "Guerra",
  "Viejo Oeste" 
];


String textFieldvalue = '';
String? dropDownValueType;
String? dropDownValueGenre;



 @override
  void initState() {    

    dropDownValueType = opcionesTipo.first;
    dropDownValueGenre = opcionesGenero.first;
    _controller = TextEditingController();
    super.initState();
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
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
                              ),
                              hintText: 'Escribe el nombre la pelicula',                              
                              hintStyle: TextStyle(color: Color.fromARGB(255, 245, 245, 245), fontSize: 30),
                            ),
                          )
                         ),
                       ),
                       SelectDown(listaOpciones: opcionesTipo, callBackOnchange:(String dropDownValue){
                        dropDownValueType = opcionesTipoMap[dropDownValue];
                         print(dropDownValue);
                       },),
                       SelectDown(listaOpciones: opcionesGenero, callBackOnchange:(String dropDownValue){
                        dropDownValueGenre = opcionesGeneroMap[dropDownValue];
                         print(dropDownValue);
                       },),
                       ElevatedButton(
                        onPressed: (){
                            textFieldvalue= _controller.text;
                            print(textFieldvalue);
                            print(dropDownValueType);
                            print(dropDownValueGenre);                       
                            },
                        child: Text('Buscar'),
                         style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                        ),)
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