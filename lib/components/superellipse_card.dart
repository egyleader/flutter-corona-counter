// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:corona/const.dart';
import 'package:superellipse_shape/superellipse_shape.dart';
import '../const.dart';

class SuperellipseCard extends StatelessWidget {
  const SuperellipseCard({
    this.color = kPrimaryColor,
    this.radius = 28,
    this.size = 100,
    this.image,
    this.child,
  });

  final Color color;
  final double radius;
  final double size;
  final Widget? child;
  final ImageProvider? image;
  @override
  Widget build(BuildContext context) {
    return Material(

      color: color,
      shape: SuperellipseShape(
        borderRadius: BorderRadius.circular(radius),
      ),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: size,
        height: size,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
