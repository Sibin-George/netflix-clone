import 'package:flutter/material.dart';
import 'package:netflix/Screens/login/registerpage.dart';
import 'package:netflix/Screens/settings/settingspage.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/Screens/login/loginpage.dart';
import 'package:netflix/domain/core/di/injectable.dart';
import 'package:netflix/widgets/bottomnavigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:netflix/widgets/splashscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/hot_and_new/hotandnew_bloc.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HotandnewBloc>(),
        ),BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: kbackgroundcolor,
          appBarTheme: const AppBarTheme(
              elevation: 0, backgroundColor: kbackgroundcolor),
          colorScheme: const ColorScheme.dark(
              primary: kwhite, secondary: Color.fromARGB(255, 8, 8, 8)),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          '/login': ((context) => const LoginScreen()),
          '/bottomnavbar': ((context) => const BottomNavbar()),
          '/mainscreen': ((context) => MainScreen()),
          '/settings': ((context) => Settings()),
          '/registerpage': ((context) => RegisterPage()),
        },
      ),
    );
  }
}
