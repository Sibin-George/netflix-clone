import 'package:flutter/material.dart';
import 'package:netflix/Screens/login/registerpage.dart';
import 'package:netflix/Screens/settingspage.dart';
import 'package:netflix/widgets/constants.dart';
import 'package:netflix/Screens/login/loginpage.dart';
import 'package:netflix/widgets/bottomnavigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:netflix/widgets/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

const SAVE_KEY_NAME='UserLoggedIn';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kbackgroundcolor,
        appBarTheme:
           const AppBarTheme(elevation: 0, backgroundColor: kbackgroundcolor),
        colorScheme: const ColorScheme.dark(
            primary: kwhite, secondary: Color.fromARGB(255, 8, 8, 8)),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/login': ((context) => const LoginScreen()),
        '/bottomnavbar': ((context) => const BottomNavbar()),
        '/mainscreen': ((context) =>  MainScreen()),
        '/settings': ((context) =>  Settings()),        
        '/registerpage': ((context) =>  RegisterPage()),
       
      },
    );
  }
}
