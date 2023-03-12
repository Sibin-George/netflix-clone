import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/widgets/bottomsheet/bottomsheet.dart';

class NumberCard extends StatelessWidget {
  final int index;
  NumberCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            context: context,
            builder: (BuildContext context) {
              return BottomSheetCard();
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
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://www.themoviedb.org/t/p/w220_and_h330_face/sv1xJUazXeYqALzczSZ3O6nkH75.jpg'))),
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
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )))
        ],
      ),
    );
  }
}
