import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:netflix/widgets/constants.dart';
import 'package:netflix/widgets/maincard.dart';
import 'package:netflix/widgets/title.dart';
import 'package:http/http.dart' as http;

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight10,
        const SearchTitle(title: 'Movies & TV'),
        kheight20,
        Expanded(
            child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.5,
                children: List.generate(20, (index) =>  MainCard())))
      ],
    );
  }
}
