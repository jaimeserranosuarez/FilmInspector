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
      padding:EdgeInsets.only(
        left: responsive.width(1),
        right: responsive.width(1)),
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
          width: responsive.width(38),
          height: responsive.height(34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  width: responsive.width(38),
                  height: responsive.height(30),
                  fit: BoxFit.cover,
                  imageUrl: title.image,
                ),
              ),
              Container(
                height: responsive.height(3.4),
                padding: EdgeInsets.only(top: responsive.height(1)),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Text(
                    title.title,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: kTextColorPrinc,
                        fontWeight: FontWeight.bold,
                        fontSize: responsive.height(1.7)),
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}