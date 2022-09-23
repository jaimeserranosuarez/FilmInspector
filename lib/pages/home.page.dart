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
  late Future<List<TitleModel>> top250Series;
  late Future<List<TitleModel>> estrenos;

  @override
  void initState() {
    top250Movies = titleProvider.homeProvider(tipo: "Top250Movies");
    top250Series = titleProvider.homeProvider(tipo: "Top250TVs");
    estrenos = titleProvider.homeProvider(tipo: "InTheaters");

    List<TitleCard> topMoviesPrev = [];
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: responsive.width(4),
                        top: responsive.height(3),
                        bottom: responsive.height(2)),
                    child: textos(context, 'En cines ahora', kTextColorPrinc,
                        FontWeight.w500, responsive.height(2.3))),
                Padding(
                    padding: EdgeInsets.only(
                        left: responsive.width(4),
                        right: responsive.width(4),
                        top: responsive.height(3),
                        bottom: responsive.height(2)),
                    child: GestureDetector(
                      onTap: () {
                        print("Listado");
                      },
                      child: textos(context, 'Ver más', kTextColorPrinc,
                          FontWeight.w400, responsive.height(1.7)),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: responsive.height(2),
                  left: responsive.width(2),
                  right: responsive.width(2)),
              child: SizedBox(
                  // width: responsive.width(30),
                  height: responsive.height(34),
                  child: FutureBuilder(
                    future: estrenos,
                    builder: ((context, snapshot) {
                      List<Widget> lista = [];
                      if (snapshot.hasData) {
                        snapshot.data?.take(5).forEach((element) => lista.add(TitleCard(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: responsive.width(4),
                        top: responsive.height(3),
                        bottom: responsive.height(2)),
                    child: textos(context, 'Top Mejores películas', kTextColorPrinc,
                        FontWeight.w500, responsive.height(2.3))),
                Padding(
                    padding: EdgeInsets.only(
                        left: responsive.width(4),
                        right: responsive.width(4),
                        top: responsive.height(3),
                        bottom: responsive.height(2)),
                    child: GestureDetector(
                      onTap: () {
                        print("Listado");
                      },
                      child: textos(context, 'Ver más', kTextColorPrinc,
                          FontWeight.w400, responsive.height(1.7)),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: responsive.height(2),
                  left: responsive.width(2),
                  right: responsive.width(2)),
              child: SizedBox(
                  // width: responsive.width(30),
                  height: responsive.height(34),
                  child: FutureBuilder(
                    future: top250Movies,
                    builder: ((context, snapshot) {
                      List<Widget> lista = [];
                      if (snapshot.hasData) {
                        snapshot.data?.take(10).forEach((element) => lista.add(TitleCard(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: responsive.width(4),
                        top: responsive.height(3),
                        bottom: responsive.height(2)),
                    child: textos(context, 'Top Mejores series', kTextColorPrinc,
                        FontWeight.w500, responsive.height(2.3))),
                Padding(
                    padding: EdgeInsets.only(
                        left: responsive.width(4),
                        right: responsive.width(4),
                        top: responsive.height(3),
                        bottom: responsive.height(2)),
                    child: GestureDetector(
                      onTap: () {
                        print("Listado");
                      },
                      child: textos(context, 'Ver más', kTextColorPrinc,
                          FontWeight.w400, responsive.height(1.7)),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: responsive.height(2),
                  left: responsive.width(2),
                  right: responsive.width(2)),
              child: SizedBox(
                  // width: responsive.width(30),
                  height: responsive.height(34),
                  child: FutureBuilder(
                    future: top250Series,
                    builder: ((context, snapshot) {
                      List<Widget> lista = [];
                      if (snapshot.hasData) {
                        snapshot.data?.take(10).forEach((element) => lista.add(TitleCard(
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
          ],
        ));
  }
}
