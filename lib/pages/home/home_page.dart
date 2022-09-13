import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/widgets/carousel_widget.dart';

class HomePage extends StatelessWidget {
  static var routeName = "/";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Movies APP")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: CarouselWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
