import 'package:easy_localization/public.dart';
import 'package:flutter/material.dart';
import 'package:corona/components/superellipse_card.dart';

class SmallListItem extends StatelessWidget {
  SmallListItem({this.image, @required this.title, @required this.onpressed});

  final String image;
  final String title;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Column(
        children: <Widget>[
          SuperellipseCard(
            image: NetworkImage(image),
            size: MediaQuery.of(context).size.width / 6,
            radius: 45,
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
