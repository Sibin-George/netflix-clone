import 'package:flutter/material.dart';
import 'package:netflix/widgets/constants.dart';
import 'package:netflix/widgets/customicon.dart';
import 'package:netflix/widgets/videowidget.dart';

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight10,
        const Text(
          'Black Adams',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        kheight5,
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
          style: TextStyle(color: Colors.grey),
        ),
        kheight20,
        VideoWidget(image: "",),
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
        )
      ],
    );
  }
}
