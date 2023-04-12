import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import '../../../../../core/Strings.dart';
import 'package:netflix/widgets/title.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight10,
        const SearchTitle(
          title: 'Top Searches',
        ),
        kheight20,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(child: Text('Error while getting data'));
              } else if (state.idleList.isEmpty) {
                return const Center(child: Text('List is empty'));
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    final movie = state.idleList[index];
                    return TopSearchItems(
                        title: movie.title ?? 'No title provided',
                        imageUrl: '$imageAppendUrl${movie.backdropPath}');
                  }),
                  separatorBuilder: ((context, index) => kheight20),
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItems extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItems(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: screenwidth * 0.37,
          height: 85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        Container(
            height: 85,
            alignment: Alignment.centerLeft,
            width: 150,
            child: AutoSizeText(
              title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        const CircleAvatar(
          backgroundColor: kwhite,
          radius: 20,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.black,
            child: Icon(
              CupertinoIcons.play_fill,
              size: 15,
              color: kwhite,
            ),
          ),
        )
      ],
    );
  }
}
