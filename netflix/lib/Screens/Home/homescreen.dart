import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/Screens/Home/homebgimage.dart';
import 'package:netflix/Screens/Home/homecard.dart';
import 'package:netflix/Screens/Home/numebercard.dart';
import 'package:netflix/widgets/constants.dart';
import 'package:netflix/widgets/title.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: SafeArea(
                    child: Stack(
                  children: [
                    ListView(
                      children: [
                        HomeBgImage(),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              kheight10,
                               HomeCard(
                                title: 'Released in the past year',
                                index: 100
                              ),
                              kheight10,
                               HomeCard(
                                title: 'Trending now',
                                index:120
                              ),
                              kheight10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SearchTitle(title: 'Top 10 TV Shows'),
                                  LimitedBox(
                                      maxHeight: 160,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: List.generate(
                                          10,
                                          (index) => Padding(
                                            padding: EdgeInsets.all(4),
                                            child: NumberCard(
                                             index: index,
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              kheight10,
                               HomeCard(
                                title: 'Tense Dramas',
                                index: 500
                              ),
                              kheight10,
                               HomeCard(
                                title: 'South Indian Cinemas',
                                index: 100
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            padding: EdgeInsets.all(0),
                            width: double.infinity,
                            height: 80,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/netflixlogo.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      icon: const Icon(Icons.menu),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .popAndPushNamed('/settings');
                                      },
                                    ),
                                    kwidth10
                                  ],
                                ),
                                kheight10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'TV Shows',
                                      style: titlehome,
                                    ),
                                    Text('Movies', style: titlehome),
                                    Text('Catergories', style: titlehome)
                                  ],
                                )
                              ],
                            ),
                          )
                        : kheight10,
                  ],
                )),
              );
            }));
  }
}
