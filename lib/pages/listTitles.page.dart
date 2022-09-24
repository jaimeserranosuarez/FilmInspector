import 'package:film_inspector/widgets/titleListItem.widget.dart';
import 'package:flutter/material.dart';

import '../models/title.model.dart';

class ListTitles extends StatelessWidget {
  Future <List<TitleModel>> titulos;
  String pagina;

  ListTitles({super.key, required this.titulos, required this.pagina});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(pagina)),
        body: FutureBuilder(
          future: titulos,
          builder: ((context, snapshot) {
            List<Widget> lista = [];
            if (snapshot.hasData) {
              snapshot.data?.forEach(
                  (element) => lista.add(TitleListItem(title: element)));
              return ListView(
                children: lista,
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
        ));
  }
}
