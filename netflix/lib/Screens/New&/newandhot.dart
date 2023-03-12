import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix/Screens/New&/comingsoon.dart';
import 'package:netflix/Screens/New&/everyoneswatching.dart';
import 'package:http/http.dart' as http;
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
           void netflixImages() async{
          for (var i = index; i < index+count; i++) {
            
          
    final movieDb = Uri.parse('https://api.themoviedb.org/3/movie/${i}?api_key=a2c30902b3482b0c344ee1ca606021c9#');
    final response1 = await http.get(movieDb, headers: {'Content-Type': 'application/json; charset=UTF-8'});
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
          body: TabBarView(
              children: [_buildComingSoon(), _buildEveryonesWatching()]),
        ),
      ),
    );
  }
}

Widget _buildComingSoon() {
  return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, index) => ComingSoonWidget(pictureUrl: pictures[index], title: titles[index]));
}

Widget _buildEveryonesWatching() {
  return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, index) => EveryonesWatching());
}
