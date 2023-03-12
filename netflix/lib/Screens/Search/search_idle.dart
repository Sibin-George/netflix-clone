import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/widgets/constants.dart';
import 'package:netflix/widgets/title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight10,
        const SearchTitle(
          title: 'Top Searches',
        ),
        kheight20,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) =>const TopSearchItems()),
              separatorBuilder: ((context, index) => kheight20),
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItems extends StatelessWidget {
  const TopSearchItems({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: screenwidth * 0.37,
          height: 85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w250_and_h141_face/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg',
                  ))),
        ),
        const Text(
          'movie name',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 20,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.black,
            child: Icon(
              CupertinoIcons.play_fill,
              size: 15,
            ),
          ),
        )
      ],
    );
  }
}
