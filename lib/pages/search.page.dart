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

 Map<String,String> opcionesClasificacionMap = { 
  "Todas las Edades": "us:G",
  "Contenido no acto para niños":"us:PG",
  "Mayores de 13 años":"us:PG-13",
  "M17 - compañia de un adulto":"us:R",
  "Mayores de 17 años":"NC-17"
  };
  
List<String> opcionesClasificacion = [
  "Todas las Edades",
  "Contenido no acto para niños",
  "Mayores de 13 años",
  "M17 - compañia de un adulto",
  "Mayores de 17 años"
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


String textFieldvalue = 'Pelicula Predefinida';
String? dropDownValueType;
String? dropDownValueGenre;
String? dropDownValueCertificade;



 @override
  void initState() {    
    dropDownValueType = opcionesTipoMap[opcionesTipo.first];
    dropDownValueGenre = opcionesGeneroMap[opcionesGenero.first];
    dropDownValueCertificade = opcionesClasificacionMap[opcionesClasificacion.first];
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
            flex: 2,
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
                            textAlign: TextAlign.center,                            
                            decoration: InputDecoration( 
                              isDense: true, 
                              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                              prefixIcon: const Icon(
                              Icons.movie,
                              size: 35,
                              color: Colors.green,
                            ),                            
                              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 42, 214, 131), width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 243, 242, 242), width: 1.0),
            ),
                              labelText: '  Escribe el nombre la pelicula',
                              labelStyle: TextStyle(color: Color.fromARGB(255, 245, 245, 245), fontSize: 20,fontWeight: FontWeight.bold),                             
                              hintStyle: TextStyle(color: Color.fromARGB(255, 245, 245, 245), fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          )
                         ),
                       ),                      
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
          Expanded(
            flex: 4,
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
                         padding: const EdgeInsets.all(35),
                         child: Container(
                          width: 500,
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: Colors.red, style: BorderStyle.solid, width: 1),
                          ),
                            child:  Center(
                              child: SelectDown(listaOpciones: opcionesTipo, callBackOnchange:(String dropDownValue){
                        dropDownValueType = opcionesTipoMap[dropDownValue];
                         print(dropDownValue);
                       },),
                            ),
                         ),
                       ),
                       
                       Padding(
                         padding: const EdgeInsets.all(35),
                         child: Container(
                          width: 500,
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: Colors.red, style: BorderStyle.solid, width: 1),
                          ),
                            child:   Center(
                              child: SelectDown(listaOpciones: opcionesGenero, callBackOnchange:(String dropDownValue){
                                                    dropDownValueGenre = opcionesGeneroMap[dropDownValue];
                                                     print(dropDownValue);
                                                   },),
                            ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(35),
                         child: Container(
                          width: 500,
                          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: Colors.red, style: BorderStyle.solid, width: 1),
                          ),
                            child:   Center(
                              child: SelectDown(listaOpciones: opcionesClasificacion, callBackOnchange:(String dropDownValue){
                                dropDownValueCertificade = opcionesClasificacionMap[dropDownValue];
                                print(dropDownValue);
                              },),
                            ),
                         ),
                       ),
                      
                      
                      
                      
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
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: 
                    GestureDetector(
                      onTap: () {
                        textFieldvalue= _controller.text;
                            print(textFieldvalue);
                            print(dropDownValueType);
                            print(dropDownValueGenre);  
                            print(dropDownValueCertificade);
                      },
                      child: Container (
                        // ignore: sort_child_properties_last
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [                
                         
                         Padding(
                           padding: const EdgeInsets.all(1),                         
                              child:  Icon(Icons.search,size: 80,)                                                            
                         ),                  
                        ],
                      ),
                      decoration: BoxDecoration(                                  
                                      color: Color.fromARGB(255, 131, 177, 72),
                                      border: Border.all(
                                        color: Color.fromARGB(255, 29, 10, 9), //                   <--- border color
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(20)
                                  ),  
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