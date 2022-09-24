import 'package:flutter/material.dart';

class SelectDown extends StatefulWidget {
  SelectDown({super.key, required this.listaOpciones, required this.callBackOnchange});
  List<String> listaOpciones;
  dynamic callBackOnchange;

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
      elevation: 10,
      style: const TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
      underline: SizedBox(),
      // underline: Container(
      //   height: 3,
      //   color: Colors.white,
      // ),
      onChanged: (String? value) {  
         setState(() {
          dropdownValue = value!;
        });
        widget.callBackOnchange(value);  
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