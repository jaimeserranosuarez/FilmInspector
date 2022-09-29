import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/utils/responsive.model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/title.model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.title, required this.trailer});
  final TitleModel title;
  final String trailer;
  // final String plotLocal;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.trailer).toString(),
      // ignore: prefer_const_constructors
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    super.initState();
  }
  // ignore: prefer_final_fields

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detalles de la pelicula"),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Row(children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      // ignore: sort_child_properties_last
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: CachedNetworkImage(
                              // height: responsive.height(18.09),
                              width: responsive.width(40),
                              fit: BoxFit.cover,
                              imageUrl: (widget.title.image == ''
                                  ? 'https://media.comicbook.com/files/img/default-movie.png'
                                  : widget.title.image),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(29,30,51,255),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      // ignore: sort_child_properties_last
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Top: ${widget.title.rank}",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left),
                            ],
                          ),
                          Container(
                            height: responsive.height(9),
                            padding: EdgeInsets.only(top: responsive.height(1)),
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                Text(
                                    "Titulo Completo: ${widget.title.fullTitle}",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Fecha de estreno: ${widget.title.year}",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("imDbRating: ${widget.title.imDbRating}",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(29,30,51,255),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )),
                ])),
            Expanded(
                flex: 2,
                child: Container(
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        // ignore: sort_child_properties_last
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: responsive.height(19),
                              padding:
                                  EdgeInsets.only(top: responsive.height(1)),
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  Text(
                                    widget.title.plotLocal,
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: responsive.height(2)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            // color: Color.fromARGB(29,30,51,255),
                            //color: Color.fromRGBO(29, 30,51, 1),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )),
                  ]),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        // ignore: sort_child_properties_last
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: YoutubePlayer(
                                  controller: _controller,
                                  showVideoProgressIndicator: true,
                                )),
                          ],
                        ),
                        decoration: BoxDecoration(

                            //color: Color.fromRGBO(29, 30,51, 1),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )),
                  ]),
                ))
          ],
        ));
  }
}
