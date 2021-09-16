import 'package:corona/components/superellipse_card.dart';
import 'package:corona/const.dart';
import 'package:flutter/material.dart';

class SuperellipseDataCard extends StatelessWidget {
  
  const SuperellipseDataCard({Key? key ,
   required this.title,
    required this.subtitle,
    required this.image,
    required this.color,
    required this.width}) : super(key: key);

  final String title;
  final String subtitle;
  final String image;
  final Color color;
  final double width;


  @override
  Widget build(BuildContext context) {
    return SuperellipseCard(
      color: color,
      size: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(
            image,
            height: MediaQuery.of(context).size.height / 11,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(title, style: kCardNumberStyle),
        ],
      ),
    );
  }
}
