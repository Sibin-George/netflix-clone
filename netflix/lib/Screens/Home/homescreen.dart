import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Screens/Home/homebgimage.dart';
import 'package:netflix/Screens/Home/homecard.dart';
import 'package:netflix/Screens/Home/numebercard.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/Strings.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/widgets/title.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key,});
  @override
  Widget build(BuildContext context ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomescreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index,_) {
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
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if(state.isLoading){
                          return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
                        }else if(state.hasError){
                          return Center(child: const Text('Error while getting data'));
                        }
                        final _releasesPastYear=state.pastYearMovieList.map((m){
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                         final _trending=state.trendingMovieList.map((m){
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                        
                         final _Top10=state.Top10TvList.map((m){
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                         final _tensedrama=state.tenseDramasMovieList.map((m){
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                         final _southindian=state.southIndianMovieList.map((m){
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                        
                            final _title=state.pastYearMovieList.map((l){
                              return '${l.originalTitle}';
                            }).toList();
                            
                            final _overview=state.pastYearMovieList.map((l){
                              return '${l.overview}';
                            }).toList();
                        
                        return ListView(
                          children: [
                            HomeBgImage(),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  kheight10,
                                  HomeCard(movieList:_title,
                                    title:'Released in the past year',
                                    overview:_overview,
                                    posterList: _releasesPastYear,
                                  ),
                                  kheight10,
                                  HomeCard(movieList:_title,
                                    title: 'Trending now',
                                    overview:_overview,
                                    posterList: _trending,
                                  ),
                                  kheight10,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                child: NumberCard(imageUrl:_Top10 ,overview:_overview,title:_title,
                                                  index: index,
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  kheight10,
                                  HomeCard(movieList:_title,
                                    title: 'Tense Dramas',
                                    overview: _overview,
                                    posterList: _tensedrama,
                                  ),
                                  kheight10,
                                  HomeCard(movieList:_title,
                                    title: 'South Indian Cinemas',
                                    overview: _overview,
                                    posterList: _southindian,
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
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
