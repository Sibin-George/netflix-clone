import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:netflix/widgets/maincard.dart';
import 'package:netflix/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeCard extends StatefulWidget {
  final String title;
  final int index;
  HomeCard({super.key, required this.title, required this.index});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTitle(title: widget.title),
        LimitedBox(
            maxHeight: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => Padding(
                  padding: EdgeInsets.all(4),
                  child: MainCard(),
                ),
              ),
            )),
      ],
    );
  }
}
