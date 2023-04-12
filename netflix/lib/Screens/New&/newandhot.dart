import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/Screens/New&/comingsoon.dart';
import 'package:netflix/Screens/New&/everyoneswatching.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/core/Strings.dart';

import '../../application/hot_and_new/hotandnew_bloc.dart';

int index = 600;
int count = 30;
List pictures = [];
List titles = [];

class ScreenNewandhot extends StatefulWidget {
  const ScreenNewandhot({super.key});

  @override
  State<ScreenNewandhot> createState() => _ScreenNewandhotState();
}

class _ScreenNewandhotState extends State<ScreenNewandhot> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    netflixImages();
  }

  void netflixImages() async {
    for (var i = index; i < index + count; i++) {
      final movieDb = Uri.parse(
          'https://api.themoviedb.org/3/movie/${i}?api_key=a2c30902b3482b0c344ee1ca606021c9#');
      final response1 = await http.get(movieDb,
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      final decodedJson1 = jsonDecode(response1.body);
      final imageExtension = decodedJson1['poster_path'];
      // final titleExtension = 'title';
      final titleExtension = decodedJson1['title'];

      pictures.add('https://image.tmdb.org/t/p/w500${imageExtension}');
      titles.add(titleExtension);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            actions: const [Icon(Icons.cast, size: 25)],
            bottom: TabBar(
                padding: EdgeInsets.all(10),
                labelPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                indicatorWeight: 0,
                labelColor: Colors.black,
                isScrollable: true,
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(text: "👀 Everyone's Watching")
                ]),
          ),
          body: TabBarView(children: [
            ComingSoonList(key: Key('coming_soon')),
            EveryOneIsWatchingList(
              key: Key('everyones_watching'),
            )
          ]),
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotandnewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotandnewBloc, HotandnewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error while getting data'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          } else {
            return ListView.builder(
                itemCount: state.comingSoonList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  String date = '';
                  String month = '';
                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(_date!);
                    print(formatedDate.toString());
                    month = formatedDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    date = movie.releaseDate!.split('-')[1];
                  } catch (_) {
                    month = '';
                    date = '';
                  }

                  return ComingSoonWidget(
                      id: movie.id.toString(),
                      month: month,
                      day: date,
                      posterpath: '$imageAppendUrl${movie.backdropPath}',
                      moviename: movie.originalTitle ?? "No Title",
                      description: movie.overview ?? "No Description");
                });
          }
        },
      ),
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotandnewBloc>(context)
            .add(const LoadDataInEveryoneIsWatching());
      },
      child: BlocBuilder<HotandnewBloc, HotandnewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error while getting data'),
            );
          } else if (state.EveryOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          } else {
            return ListView.builder(
                itemCount: state.EveryOneIsWatchingList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.EveryOneIsWatchingList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }

                  final tv = state.EveryOneIsWatchingList[index];
                  return EveryonesWatching(
                    description: tv.overview ?? 'No Description',
                    backdropPath: '$imageAppendUrl${tv.backdropPath}',
                    moviename: tv.originalTitle ?? "No Title",
                  );
                });
          }
        },
      ),
    );
  }
}
