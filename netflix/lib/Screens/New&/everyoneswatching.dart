import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/widgets/customicon.dart';
import 'package:netflix/widgets/videowidget_new&hot.dart';

class EveryonesWatching extends StatelessWidget {
  final String backdropPath;
  final String moviename;
  final String description;
  const EveryonesWatching(
      {super.key,
      required this.backdropPath,
      required this.moviename,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight10,
         Text(
         moviename,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
        ),
        kheight5,
         Text(description,
          style: TextStyle(color: Colors.grey),
        ),
        kheight20,
        VideoWidget(
          image:backdropPath,
        ),
        kheight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomIcon(
                title: 'Share',
                bold: FontWeight.normal,
                color: Colors.grey,
                icon: Icons.near_me_outlined),
            kwidth10,
            CustomIcon(
                title: 'My List',
                bold: FontWeight.normal,
                color: Colors.grey,
                icon: Icons.add),
            kwidth10,
            CustomIcon(
                title: 'Play',
                bold: FontWeight.normal,
                color: Colors.grey,
                icon: Icons.play_arrow),
            kwidth10
          ],
        ),kheight30
      ],
    );
  }
}
