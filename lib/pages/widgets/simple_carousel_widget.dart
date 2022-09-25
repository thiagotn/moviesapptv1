import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/widgets/title_widget.dart';

enum CarouselType {
  series,
  movies,
  popular,
  mylist,
  family,
}

class SimpleCarouselWidget extends StatelessWidget {
  final String name;
  final CarouselType type;
  const SimpleCarouselWidget({
    Key? key,
    required this.name,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: getImages(type)
                .map(
                  (item) => TitleWidget(imageUrl: item),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  List<String> getImages(CarouselType type) {
    switch (type) {
      case CarouselType.movies:
        return getMoviesImages();
      case CarouselType.series:
        return getSeriesImages();
      case CarouselType.popular:
        return getPopularImages(shuffle: true);
      case CarouselType.mylist:
        return getPopularImages(shuffle: true);
      default:
        return getTitleImages();
    }
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

  List<String> getSeriesImages({bool shuffle = false}) {
    List<String> images = [
      "https://thumb.mais.uol.com.br/collectionThumb/1078-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1077-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/705-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/704-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/703-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/701-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/700-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/699-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/698-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/697-50.jpg",
    ];
    if (shuffle) images.shuffle();
    return images;
  }

  List<String> getMoviesImages({bool shuffle = false}) {
    List<String> images = [
      "https://thumb.mais.uol.com.br/collectionThumb/1217-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1216-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1213-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1211-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1210-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1209-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1208-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1207-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1206-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1204-50.jpg",
    ];
    if (shuffle) images.shuffle();
    return images;
  }

  List<String> getPopularImages({bool shuffle = false}) {
    List<String> images = [
      "https://thumb.mais.uol.com.br/collectionThumb/1217-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1216-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1213-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1211-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1210-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1209-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1208-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1207-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1206-50.jpg",
      "https://thumb.mais.uol.com.br/collectionThumb/1204-50.jpg",
    ];
    if (shuffle) images.shuffle();
    return images;
  }
}
