import 'package:flutter/material.dart';

class SelectDown extends StatefulWidget {
  SelectDown({super.key, required this.listaOpciones});
  List<String> listaOpciones;


  @override
  State<SelectDown> createState() => _SelectDownState();
}

class _SelectDownState extends State<SelectDown> {
 
 String dropdownValue='';

@override
  void initState() {
    
    dropdownValue = widget.listaOpciones.first;
    super.initState();
  }
  
   @override
   Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.listaOpciones.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}