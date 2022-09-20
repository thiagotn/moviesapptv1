import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/widgets/title_widget.dart';

class SimpleCarouselWidget extends StatelessWidget {
  const SimpleCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Filmes em destaque"),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: getTitleImages()
                .map((item) => TitleWidget(imageUrl: item))
                .toList(),
          ),
        ),
      ],
    );
  }

  List<String> getTitleImages() {
    List<String> images = [
      "https://www.themoviedb.org/t/p/w220_and_h330_face/yw6H4C64tjBWlyKFG1pzmq5zOQh.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/rqeYMLryjcawh2JeRpCVUDXYM5b.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/l2ezB41chGDjXcKo24lseuXYtKP.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/ruHPkmmAwBTCzNXtHot18rs6ctN.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/sQN9v8dIkEYtrGhLULweNNKONHg.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/hdKxcoV5CFc3sGOmbGXDXbx1cTZ.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/eeRVmLGrijHpoyz5737eX40e5o0.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/AaI4egyV9dCMzOYoumyLMZrmRPg.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/30erzlzIOtOK3k3T3BAl1GiVMP1.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/fVzXp3NwovUlLe7fvoRynCmBPNc.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/eO0QV5qJaEngP1Ax9w3eV6bJG2f.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/ixgnqO8xhFMb1zr8RRFsyeZ9CdD.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/mGPFbEmWdaDVxO5V64xYwv6v8j.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/2pxKwxMbd5l3BxK5fBgVCWYweH2.jpg",
    ];
    images.shuffle();
    return images;
  }
}
