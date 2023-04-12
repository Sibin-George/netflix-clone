import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Screens/Search/search_idle.dart';
import 'package:netflix/Screens/Search/search_result.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';

import '../../domain/core/debounce/debounce.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);
  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CupertinoSearchTextField(
                      suffixIcon: Icon(CupertinoIcons.xmark_circle_fill),
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          return;
                        }
                        _debouncer.run(() {
                          BlocProvider.of<SearchBloc>(context)
                              .add(SearchMovies(movieQuery: value));
                        });
                      },
                    ),
                    kheight10,
                    Expanded(child: BlocBuilder<SearchBloc, SearchState>(
                        builder: (context, state) {
                      if (state.searchResultList.isEmpty) {
                        return RefreshIndicator(
                            onRefresh: () async {
                              BlocProvider.of<SearchBloc>(context)
                                  .add(const Initialize());
                            },
                            child: SearchIdleWidget());
                      } else {
                        return SearchResultWidget();
                      }
                    }))
                  ],
                ))));
  }
}
