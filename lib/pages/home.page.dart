import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/title.model.dart';
import '../models/utils/responsive.model.dart';
import '../providers/titles.provider.dart';
import '../widgets/textos.widget.dart';
import '../widgets/titleCard.widget.dart';
import 'details.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TitleProvider titleProvider = TitleProvider();
  late Future<List<TitleModel>> top250Movies;

  @override
  void initState() {
    top250Movies = titleProvider.top250Movies();

    print(top250Movies);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = new Responsive(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("FilmInspector"),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    left: responsive.width(2),
                    top: responsive.height(2),
                    bottom: responsive.height(3)),
                child: textos(context, 'Top Mejores peliculas', kTextColorPrinc,
                    FontWeight.normal, responsive.height(2))),
            Padding(
              padding: EdgeInsets.only(bottom: responsive.height(2)),
              child: Container(
                // from: 40,
                // delay: Duration(milliseconds: 100),
                child: Container(
                    height: responsive.height(80),
                    width: responsive.width(30),
                    child: FutureBuilder(
                      future: top250Movies,
                      builder: ((context, snapshot) {
                        List<Widget> lista = [];
                        if (snapshot.hasData) {
                          snapshot.data
                              ?.forEach((element) => lista.add(TitleCard(
                                  title: element,
                                  onTap: () {
                                    print("detalle");
                                  })));
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            children: lista,
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                    )),
              ),
            )
          ],
        ));
  }
}
