import 'dart:math';

getRandomVideoUrl() => mockData["items"][generateRandom(0, 3)]["trailer_url"];

int generateRandom(int min, int max) {
  return min + Random().nextInt(max - min);
}

Map<String, dynamic> mockData = {
  "items": [
    {
      "title": "Trailer ",
      "image": "images/rio_from_above_poster.jpg",
      "trailer_url":
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    },
    {
      "title": "Rio from Above",
      "image": "images/rio_from_above_poster.jpg",
      "trailer_url":
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/rio_from_above_compressed.mp4?raw=true",
    },
    {
      "title": "The Valley",
      "image": "images/the_valley_poster.jpg",
      "trailer_url":
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/the_valley_compressed.mp4?raw=true",
    },
    {
      "title": "Iceland",
      "image": "images/iceland_poster.jpg",
      "trailer_url":
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/iceland_compressed.mp4?raw=true",
    },
    {
      "title": "9th May & Fireworks",
      "image": "images/9th_may_poster.jpg",
      "trailer_url":
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
    },
  ]
};
