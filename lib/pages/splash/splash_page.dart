import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/pages/movies/movies_page.dart';

class SplashPage extends StatelessWidget {
  static var routeName = "/";

  const SplashPage({super.key});

  Future delay(context) async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () {
        Navigator.pushReplacementNamed(
          context,
          MoviesPage.routeName,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    delay(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
