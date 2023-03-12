import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/widgets/bottomsheet/bottomsheet.dart';

class MainCard extends StatelessWidget {
  MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12))),
              context: context,
              builder: (BuildContext context) {
                return BottomSheetCard();
              });
        },
        child: Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
                // image: NetworkImage(pictureUrl), fit: BoxFit.fitHeight)
                image: AssetImage('assets/wakanda.jpg')),
          ),
        ));
  }
}
