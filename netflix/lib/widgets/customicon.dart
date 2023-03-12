import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, required this.title, required this.color, required this.bold});
  final IconData icon;
  final String title;
  final Color color;
 final FontWeight bold;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 25,
        ),
        Text(title,
            style: TextStyle(fontSize: 10,
                fontWeight: bold, color: color))
      ],
    );
  }
}
