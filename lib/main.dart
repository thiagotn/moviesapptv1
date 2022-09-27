import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviesapptv1/config/theme.dart';
import 'package:moviesapptv1/pages/details/details_page.dart';
import 'package:moviesapptv1/pages/home/home_page.dart';
import 'package:moviesapptv1/pages/movie/movie_page.dart';
import 'package:moviesapptv1/pages/player/player_mob_page.dart';
import 'package:moviesapptv1/pages/series/serie_bloc.dart';
import 'package:moviesapptv1/pages/series/serie_page.dart';
import 'package:moviesapptv1/pages/splash/splash_page.dart';
import 'package:provider/provider.dart';

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
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<SerieBloc>.value(
            value: SerieBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movies APP',
          theme: defaultTheme(),
          initialRoute: SplashPage.routeName,
          routes: {
            SplashPage.routeName: (context) => const SplashPage(),
            HomePage.routeName: (context) => const HomePage(),
            SeriePage.routeName: (context) => const SeriePage(),
            MoviePage.routeName: (context) => const MoviePage(),
            DetailsPage.routeName: (context) => const DetailsPage(),
            PlayerMobPage.routeName: (context) => const PlayerMobPage(),
          },
        ),
      ),
    );
  }
}
