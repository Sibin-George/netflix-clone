import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class CustomIconb extends StatelessWidget {
  const CustomIconb({
    super.key,
    required this.icon,
    required this.title,
    required this.bg,
    required this.color,
  });
  final IconData icon;
  final String title;
  final Color bg;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: bg,
          radius: 15,
          child: Icon(
            icon,
            size: 20,
            color: color,
          ),
        ),
        kheight5,
        Text(title,
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.bold, color: kgrey))
      ],
    );
  }
}
