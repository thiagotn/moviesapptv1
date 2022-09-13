import 'package:flutter/material.dart';
import 'package:moviesapptv1/config/theme.dart';
import 'package:moviesapptv1/pages/details/details_page.dart';
import 'package:moviesapptv1/pages/home/home_page.dart';
import 'package:moviesapptv1/pages/player/player_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: defaultTheme(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        DetailsPage.routeName: (context) => const DetailsPage(),
        PlayerPage.routeName: (context) => const PlayerPage(),
      },
    );
  }
}
