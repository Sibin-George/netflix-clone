import 'package:flutter/material.dart';

class ScreenFastlaugh extends StatefulWidget {
  const ScreenFastlaugh({super.key});

  @override
  State<ScreenFastlaugh> createState() => _ScreenFastlaughState();
}

class _ScreenFastlaughState extends State<ScreenFastlaugh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
      scrollDirection: Axis.vertical,
      children: List.generate(
          20,
          (index) => VideoList(
                index: index,
              )),
    )));
  }
}

class VideoList extends StatelessWidget {
  final int index;
  const VideoList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// left side
              CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.volume_off,
                    color: Colors.white,
                  ),
                ),
              ),

              /// Right side
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://www.themoviedb.org/t/p/w250_and_h141_face/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg',
                        ),
                        radius: 25),
                  ),
                  VideoActionButton(icon: Icons.emoji_emotions, title: 'LOL'),
                  VideoActionButton(icon: Icons.add, title: 'My List'),
                  VideoActionButton(icon: Icons.share, title: 'Share'),
                  VideoActionButton(icon: Icons.play_arrow, title: 'Play'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class VideoActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionButton({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
