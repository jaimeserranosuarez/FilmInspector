import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_inspector/models/title.model.dart';
import 'package:flutter/material.dart';

import '../models/utils/responsive.model.dart';
import '../pages/details.page.dart';
import '../providers/titles.provider.dart';

class TitleListItem extends StatefulWidget {
  const TitleListItem({super.key, required this.title});
  final TitleModel title;

  @override
  State<TitleListItem> createState() => _TitleListItem();
}

class _TitleListItem extends State<TitleListItem> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = new Responsive(context);
    String firstLabel = '';
    final TitleProvider titleProvider = TitleProvider();
    String trailer = '';
    String plotLocal = '';
    if (widget.title.rank != '') {
      firstLabel = "Top: " + widget.title.rank;
    } else {
      firstLabel = "Imdb Rate: " + widget.title.imDbRating;
    }
    return Padding(
      padding: EdgeInsets.only(
          top: responsive.height(1.5),
          bottom: responsive.height(1.5),
          left: responsive.width(3),
          right: responsive.width(3)),
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.0)),
        onTap: () async {
          if (trailer == '' && plotLocal == '') {
            trailer = await titleProvider.trailerMovie(widget.title.id);
            plotLocal = await titleProvider.plotMovie(widget.title.id);
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => DetailsPage(
                      title: widget.title,
                      trailer: trailer,
                      plotLocal: plotLocal))));
        },
        child: Container(
            width: responsive.width(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: responsive.width(2)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(responsive.height(1.5)),
                    child: CachedNetworkImage(
                      height: responsive.height(22),
                      width: responsive.width(26),
                      fit: BoxFit.cover,
                      imageUrl: widget.title.image,
                    ),
                  ),
                ),
                Container(
                  // height: responsive.height(20.29),
                  padding: EdgeInsets.only(top: responsive.height(2)),
                  width: responsive.width(64),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: responsive.height(1),
                            bottom: responsive.height(1)),
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(bottom: responsive.height(1)),
                              width: responsive.width(68),
                              child: Text(
                                firstLabel,
                                maxLines: 3,
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: responsive.height(2),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(bottom: responsive.height(1)),
                              width: responsive.width(68),
                              child: Text(
                                widget.title.title,
                                style: TextStyle(
                                    fontSize: responsive.height(2.2),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(bottom: responsive.height(1)),
                              width: responsive.width(68),
                              child: Text(
                                widget.title.year,
                                style: TextStyle(
                                    fontSize: responsive.height(2),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
