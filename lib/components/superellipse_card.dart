import 'package:flutter/material.dart';
import 'package:corona/const.dart';
import 'package:superellipse_shape/superellipse_shape.dart';
import '../const.dart';

class SuperellipseCard extends StatelessWidget {
  SuperellipseCard({
    this.color = kPrimaryColor,
    this.radius = 28,
    this.size = 100,
    this.image,
    this.child,
  });

  final Color color;
  final double radius;
  final double size;
  final Widget child;
  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(

        color: color,
        shape: SuperellipseShape(
          borderRadius: BorderRadius.circular(radius),
        ),
        clipBehavior: Clip.hardEdge,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: image != null ? image : AssetImage('assets/images/logo-small.png'),
                  fit: BoxFit.cover)),
          width: size,
          height: size,
          child: child,
        ),
      ),
    );
  }
}
