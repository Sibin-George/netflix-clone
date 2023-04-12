import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/widgets/videowidget_new&hot.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterpath;
  final String moviename;
  final String description;
  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterpath,
    required this.moviename,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                day,
                style: TextStyle(fontSize: 30, letterSpacing: -2),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 70,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                image: posterpath,
              ),
              kheight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50,
                      width: 190,
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: AutoSizeText(
                        moviename,
                        style: TextStyle(
                            fontSize: 25,
                            overflow: TextOverflow.clip,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ShadowsIntoLight'),
                      )),
                  Column(
                    children: const [
                      Icon(
                        Icons.notifications_none_outlined,
                        size: 20,
                      ),
                      Text('Remind Me',
                          style: TextStyle(fontSize: 10, color: Colors.grey))
                    ],
                  ),
                  kwidth10,
                  Column(
                    children: const [
                      Icon(
                        Icons.info_outline,
                        size: 20,
                      ),
                      Text('info',
                          style: TextStyle(fontSize: 10, color: Colors.grey))
                    ],
                  ),
                  kwidth10
                ],
              ),
              kheight10,
              Text(
                'Coming on $day $month',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              kheight5,
              Text(
                moviename,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              kheight5,
              Expanded(
                  child: AutoSizeText(
                description,
                style: TextStyle(color: Colors.grey[300]),
              )),
              kheight20
            ],
          ),
        )
      ],
    );
  }
}
