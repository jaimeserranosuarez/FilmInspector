import 'package:film_inspector/models/utils/responsive.model.dart';
import 'package:film_inspector/widgets/titleListItem.widget.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/title.model.dart';
import '../widgets/textos.widget.dart';

class ListTitles extends StatelessWidget {
  Future<List<TitleModel>> titulos;
  String pagina;

  ListTitles({super.key, required this.titulos, required this.pagina});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
        appBar: AppBar(
            title: textos(context, pagina, kTextColorPrinc,
                FontWeight.w500, responsive.height(2.3))),
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
