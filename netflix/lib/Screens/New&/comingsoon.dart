import 'package:flutter/material.dart';
import 'package:netflix/widgets/constants.dart';
import 'package:netflix/widgets/videowidget.dart';

class ComingSoonWidget extends StatelessWidget {
  final pictureUrl;
  final title;
  const ComingSoonWidget({super.key, required this.pictureUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'FEB',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                '11',
                style: TextStyle(fontSize: 30, letterSpacing: -2),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 70,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(image: pictureUrl,),
              kheight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Container(height: 70,width: 190,
                     child: Center(
                       child: Text(
                        title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
                                       ),
                     ),
                   ),
                  Spacer(),
                  Column(
                    children: const [
                      Icon(
                        Icons.notifications_none_outlined,
                        size: 20,
                      ),
                      Text('Remind Me',
                          style: TextStyle(fontSize: 10, color: Colors.grey))
                    ],
                  ),
                  kwidth10,
                  Column(
                    children: const [
                      Icon(
                        Icons.info_outline,
                        size: 20,
                      ),
                      Text('info',
                          style: TextStyle(fontSize: 10, color: Colors.grey))
                    ],
                  ),
                  kwidth10
                ],
              ),kheight10,
              const Text('Coming on Friday'),
              kheight10,
              const Text(
                'Black Adams',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              kheight5,
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        )
      ],
    );
  }
}
