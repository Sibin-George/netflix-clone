import 'package:flutter/material.dart';
import 'package:netflix/widgets/customicon.dart';

class HomeBgImage extends StatelessWidget {
  const HomeBgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/sadie sink.jpg',
                  ),
                  fit: BoxFit.fitHeight)),
        ),
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomIcon(
                    title: 'My List',
                    color: Colors.white,
                    bold: FontWeight.bold,
                    icon: Icons.add),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 30,
                  ),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    child: Text(
                      'Play',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: const Size(85, 30),
                      padding: const EdgeInsets.all(0)),
                ),
                const CustomIcon(
                    title: 'Info',
                    bold: FontWeight.bold,
                    color: Colors.white,
                    icon: Icons.info_outline),
              ],
            ),
          ),
        )
      ],
    );
  }
}
