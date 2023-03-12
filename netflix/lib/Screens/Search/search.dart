import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Screens/Search/search_result.dart';
import 'package:netflix/widgets/constants.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10,10,10,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CupertinoSearchTextField(
                      suffixIcon: Icon(CupertinoIcons.xmark_circle_fill),
                      style: TextStyle(color: Colors.white),
                    ),
                    kheight10,
                    Expanded(
                        child:
                            //  SearchIdleWidget()
                            SearchResultWidget()
                            )
                  ],
                ))));
  }
}
