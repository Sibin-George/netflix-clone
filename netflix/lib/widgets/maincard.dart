import 'package:flutter/material.dart';
import 'package:netflix/widgets/bottomsheet/bottomsheet.dart';

class MainCard extends StatelessWidget {
  final String imageUrl;
  final String movieTitle;
  final String about;
  const MainCard({
    Key? key,
    required this.imageUrl,
    required this.movieTitle,
    required this.about,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12))),
              context: context,
              builder: (BuildContext context) {
                return BottomSheetCard(
                  image: imageUrl,
                  title: movieTitle,
                  overview: about,
                );
              });
        },
        child: Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.fitHeight)),
        ));
  }
}
