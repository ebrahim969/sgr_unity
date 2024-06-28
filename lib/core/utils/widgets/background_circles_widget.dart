import 'package:flutter/material.dart';

class BackgroundCirclesWidget extends StatelessWidget {
  const BackgroundCirclesWidget({
    super.key,
    this.top,
    this.bottom,
    this.right,
    this.left,
    this.radius,
    required this.color,
  });
  final double? top, bottom, right, left, radius;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: CircleAvatar(radius: radius, backgroundColor: color),
    );
  }
}
