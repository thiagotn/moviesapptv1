import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviesapptv1/config/theme.dart';
import 'package:moviesapptv1/pages/details/details_page.dart';
import 'package:moviesapptv1/pages/home/home_page.dart';
import 'package:moviesapptv1/pages/pages/movies/movies_page.dart';
import 'package:moviesapptv1/pages/player/player_page.dart';
import 'package:moviesapptv1/pages/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
        LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies APP',
        theme: defaultTheme(),
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (context) => const SplashPage(),
          HomePage.routeName: (context) => const HomePage(),
          MoviesPage.routeName: (context) => const MoviesPage(),
          DetailsPage.routeName: (context) => const DetailsPage(),
          PlayerPage.routeName: (context) => const PlayerPage(),
        },
      ),
    );
  }
}
