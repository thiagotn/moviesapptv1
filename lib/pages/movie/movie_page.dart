import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/movie/movie_bloc.dart';
import 'package:moviesapptv1/pages/player/player_mob_page.dart';
import 'package:moviesapptv1/pages/widgets/button_widget.dart';
import 'package:moviesapptv1/pages/widgets/details_widget.dart';
import 'package:moviesapptv1/pages/widgets/simple_carousel_widget.dart';
import 'package:moviesapptv1/repository/mocks.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatefulWidget {
  static String routeName = "/movie";

  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 960x540 -
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // 1920x1080
    double realWidth = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double realHeight = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;

    var args = ModalRoute.of(context)!.settings.arguments as Map;
    String imgUrl = args['imgUrl'];

    return Scaffold(
      body: Consumer<MovieBloc>(
        builder: (context, bloc, child) {
          return NestedScrollView(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                  child: Stack(
                    // clipBehavior: Clip.none,
                    // fit: StackFit.passthrough,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Focus(
                          child: Container(
                            foregroundDecoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.black
                                ],
                                begin: Alignment.bottomRight,
                                end: Alignment.bottomLeft,
                                stops: [0, 0.2, 0.2, 0.9],
                              ),
                            ),
                            child: Image.network(
                                imgUrl.replaceAll('50.jpg', '52.jpg')),
                          ),
                        ),
                      ),
                      Positioned(
                        top: width * 0.2, //220,
                        left: 30,
                        child: const Text(
                          "O Vampiro de Niterói",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: width * 0.2 + 50,
                        left: 30,
                        child: const Text(
                          "Um menino sobrevive a um ataque brutal e leva à caçada \na um dos maiores serial killers do Brasil",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: width * 0.2 + 120,
                        left: 30,
                        child: Row(
                          children: [
                            ButtonWidget(
                              actionName: "Assistir",
                              buttonColor: Colors.orangeAccent,
                              textColor: Colors.black,
                              onTap: () => Navigator.pushNamed(
                                context,
                                PlayerMobPage.routeName,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabs: const [
                      Tab(child: Text("Detalhes")),
                      Tab(child: Text("Assista também")),
                    ],
                    onTap: (index) {
                      debugPrint('$index');
                    },
                  ),
                )
              ];
            },
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: const [
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Focus(
                        child: DetailsWidget(
                          title: "O Vampiro de Niterói",
                          description:
                              "Um menino sobrevive a um ataque brutal e leva à caçada \na um dos maiores serial killers do Brasil",
                          genre: "Documentário",
                          year: 2020,
                          rating: "16",
                        ),
                      ),
                    )

                    // ListView.builder(
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemCount: getItems().length,
                    //   itemBuilder: (ctx, i) {
                    //     return Text(getItems()[i]);
                    //   },
                    // ),
                    ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: SimpleCarouselWidget(
                      type: CarouselType.movies,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<String> getItems() {
    return [
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
      "Testando",
    ];
  }
}
