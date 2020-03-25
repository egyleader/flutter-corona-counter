import 'package:easy_localization/public.dart';
import 'package:flutter/material.dart';
import 'package:corona/components/superellipse_card.dart';

class BigListItem extends StatelessWidget {
  BigListItem({this.image, @required this.title, @required this.subtitle ,  @required this.onpressed});

  final String image;
  final String title;
  final String subtitle;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Column(
        children: <Widget>[
          SuperellipseCard(
            image: NetworkImage(image),
            size: MediaQuery.of(context).size.width / 3,
            radius: 45,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20.0),
          ),
          Text(subtitle)
        ],
      ),
    );
  }
}
