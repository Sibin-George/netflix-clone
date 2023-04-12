import 'package:flutter/cupertino.dart';
import 'package:netflix/widgets/maincard.dart';
import 'package:netflix/widgets/title.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  HomeCard({super.key, required this.title, required this.posterList, required this.overview, required this.movieList});

  final String title;
  final List<String>posterList;
  
  final List<String>movieList;
  final  List<String>overview;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTitle(title: title),
        LimitedBox(
            maxHeight: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
              posterList.length,
                (index) => Padding(
                  padding: EdgeInsets.all(4),
                  child: MainCard(imageUrl: posterList[index], about:overview[index], movieTitle:movieList[index],),
                ),
              ),
            )),
      ],
    );
  }
}
