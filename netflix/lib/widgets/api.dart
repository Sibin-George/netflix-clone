/*
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

List pictures = [];
List titles = [];

netflixImages() async {
  for (var i = widget.index; i < widget.index + 10; i++) {
    final movieDb = Uri.parse(
        'https://api.themoviedb.org/3/movie/${i}?api_key=a2c30902b3482b0c344ee1ca606021c9#');
    final response1 = await http.get(movieDb,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    if (response1.statusCode == 200) {
      final decodedJson1 = jsonDecode(response1.body);
      final imageExtension = decodedJson1['poster_path'];
      final titleExtension = decodedJson1['title'];

      pictures.add('https://image.tmdb.org/t/p/w500${imageExtension}');
    } else {
      return CircularProgressIndicator();
    }
  }
}
// 'https://api.themoviedb.org/3/trending/all/day?api_key=df2d4149a82006984bf86eb4e36588d3
// df2d4149a82006984bf86eb4e36588d3

@override
void initState() {
  // TODO: implement initState
  super.initState();
  netflixImages();
}
*/
