import 'package:flutter/material.dart';
import 'package:netflix/widgets/bottomsheet/customiconwidget.dart';
import 'package:netflix/core/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BottomSheetCard extends StatelessWidget {
  final String image;
  final String title;
  final String overview;
  const BottomSheetCard(
      {super.key,
      required this.image,
      required this.title,
      required this.overview});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        )),
                    width: 80,
                    height: 120,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 255,
                        height: 120,
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: 220,
                                child: AutoSizeText(
                                  title,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                            kheight5,
                            Text(
                              '2023 U/A 16+ 2h 22m',
                              style: TextStyle(color: kgrey, fontSize: 11),
                            ),
                            kheight5,
                            Expanded(
                                child: AutoSizeText(
                              overview,
                              maxLines: 5,
                              style: TextStyle(color: Colors.grey[300]),
                            )),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 220,
                        bottom: 80,
                        child: IconButton(
                          color: kgrey,
                          splashColor: transp,
                          icon: Icon(Icons.highlight_remove_rounded),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
              kheight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomIconb(
                    icon: Icons.play_arrow,
                    title: 'Play',
                    color: kblack,
                    bg: kwhite,
                  ),
                  CustomIconb(
                    icon: Icons.add,
                    title: 'My List',
                    bg: kdark,
                    color: kwhite,
                  ),
                  CustomIconb(
                    icon: Icons.share_outlined,
                    title: 'Share',
                    bg: kdark,
                    color: kwhite,
                  )
                ],
              ),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: kgrey,
                ),
                title: Text(
                  'Details & More',
                  style: TextStyle(
                    fontSize: 15,
                    color: kgrey,
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: kgrey,
                    )),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
