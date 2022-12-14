# moviesapptv1

POC of AndroidTV APP:

https://thiagotn.github.io/moviesapptv1

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. 

## Required

Flutter >= 3.3.1

    flutter get packages

## Run

### Web Local

    flutter run -d chrome --web-renderer html


### Build Web Release

    flutter build web --web-renderer html --release --base-href /moviesapptv1/

### Android TV

Create an emulator of Android TV, via Android Studio, and target then when run app:

List emulators:

    ~/Desktop » flutter emulators                                                        
    1 available emulators:

    Android_TV_1080p_API_Tiramisu • Android TV (1080p) API Tiramisu • Google  • android
    ...

Run

    flutter emulators --launch Android_TV_1080p_API_Tiramisu

## Features

|Status | Feature     | Where | Description |
| :---        | :---        |:---   |:---   |
| :heavy_check_mark: | Carousel Navigation through Keyboard | HomePage | Carousel Navigation through Keyboard  |
| :heavy_check_mark: | Basic DetailsPage | DetailsPage | Basic DetailsPage  |
| :heavy_check_mark: | Basic VideoPage | VideoPage | Basic VideoPage with play of an example content  |
| :heavy_check_mark: | Add Back Button FocusNode | DetailsPage | Add FocusNode behavior for BackButton and PlayVideo  |
| :heavy_minus_sign: | Add FocusNode for Player Controlls | VideoPage | Add FocusNode behavior for PlayerControlls  |
| :heavy_minus_sign: | Play Different Videos | VideoPage | Play different Videos per Video Navigation  |
| :heavy_minus_sign: | Add More CarouselItems | HomePage | Add More CarouselItems to simulate navigation between them |
