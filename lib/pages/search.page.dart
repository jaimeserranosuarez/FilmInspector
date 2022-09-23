import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
late TextEditingController _controller;

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
                       Text("Busqueda"),
                       Center(
                        //   child: TextField(
                        //   controller: _controller,
                        //   obscureText: true,
                        //   textAlign: TextAlign.left,
                        //   decoration: InputDecoration(
                        //     border: InputBorder.none,
                        //     hintText: 'PLEASE ENTER YOUR EMAIL',
                        //     hintStyle: TextStyle(color: Colors.grey),
                        //   ),
                        // )
                       )
                      ],
                    ),
                    decoration: BoxDecoration(
                                  
                                    color: Color.fromRGBO(29, 30,51, 1),
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