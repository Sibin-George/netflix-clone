import 'package:flutter/material.dart';
import 'package:netflix/Screens/New&/newandhot.dart';
import 'package:netflix/widgets/constants.dart';
import 'package:netflix/Screens/fastlaugh.dart';
import 'package:netflix/Screens/Home/homescreen.dart';
import 'package:netflix/Screens/Search/search.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
          currentIndex: newIndex,
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          backgroundColor: kbackgroundcolor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kwhite,
          unselectedItemColor: kgrey,
          unselectedIconTheme:const IconThemeData(color: kgrey),
          selectedIconTheme:const IconThemeData(color: kwhite),unselectedFontSize: 9,selectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home',),
            BottomNavigationBarItem(
                icon: Icon(Icons.smart_display_outlined), label: 'New & Hot'),
            BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions_outlined), label: 'Fast Laugh'),
            BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: 'Search'),
           
          ],
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
 const MainScreen({super.key});

  final _screens = const[
    ScreenHome(),
    ScreenNewandhot(),
    ScreenFastlaugh(),
    ScreenSearch(),
   
  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, child) {
          return _screens[index];
        },
      ),bottomNavigationBar:const BottomNavbar(),
    );
  }
}
