import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/widgets/bottomsheet/bottomsheet.dart';

class NumberCard extends StatelessWidget {
  final int index;
  
  
  final List<String>title;
  
  final List<String>overview;
  
  final List<String>imageUrl;
  NumberCard({super.key, required this.index, required this.imageUrl, required this.title, required this.overview});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            context: context,
            builder: (BuildContext context) {
              return BottomSheetCard(image: imageUrl[index],overview: overview[index],title:title[index] ,);
            });
      },
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          20.0,
                          20.0,
                        ),
                        blurRadius: 20.0,
                        spreadRadius: 20.0,
                      ),
                    ],
                    image:  DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl[index]))),
              )
            ],
          ),
          Positioned(
              left: 0,
              top: 55,
              child: BorderedText(
                  strokeWidth: 5.0,
                  strokeColor: Colors.grey.shade400,
                  child: Text(
                    "${index + 1}",
                    style: const TextStyle(
                      fontSize: 100,letterSpacing: -15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )))
        ],
      ),
    );
  }
}
