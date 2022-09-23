import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_inspector/models/title.model.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/utils/responsive.model.dart';
import '../pages/details.page.dart';
import '../providers/titles.provider.dart';

class TitleCard extends StatelessWidget {
  final TitleModel title;
  final VoidCallback onTap;

  

  const TitleCard({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = new Responsive(context);

    return Padding(
      padding:EdgeInsets.only(left: responsive.width(3.64)),
          //EdgeInsets.only(left: responsive.width(3.64), right: responsive.width(3.64)),
      child: GestureDetector(
        onTap: () async{
          final TitleProvider titleProvider = TitleProvider();
          late String trailer;
          trailer = await titleProvider.trailerMovie(title.id); 
          late String plotLocal;
          plotLocal = await titleProvider.plotMovie(title.id);
          Navigator.push(context, MaterialPageRoute(builder: ((context) => DetailsPage(title: title,trailer: trailer,plotLocal: plotLocal))));
        },
        child: Container(
          width: responsive.width(30),
          // height: responsive.height(29.95),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  // height: responsive.height(18.09),
                  width: responsive.width(30),
                  fit: BoxFit.cover,
                  imageUrl: title.image,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: responsive.height(1.19)),
                child: Text(
                  title.title,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      color: kTextColorPrinc,
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.height(1.8)),
                ),
              ),
              Container(
                width: responsive.width(49.5),
                height: responsive.height(2.92),
                child: Text(
                  title.plotLocal,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      color: kTextColorPrinc,
                      fontWeight: FontWeight.w200,
                      fontSize: responsive.height(1.7)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}