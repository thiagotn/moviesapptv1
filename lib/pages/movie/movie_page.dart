import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/movie/movie_bloc.dart';
import 'package:moviesapptv1/pages/player/player_mob_page.dart';
import 'package:moviesapptv1/pages/widgets/carousel_widget.dart';
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
    _tabController = TabController(length: 3, vsync: this);
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
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height * 0.4;

    var args = ModalRoute.of(context)!.settings.arguments as Map;
    String imgUrl = args['imgUrl'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Page"),
        centerTitle: true,
      ),
      body: Consumer<MovieBloc>(
        builder: (context, bloc, child) {
          return NestedScrollView(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width,
                        height: height,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(
                              imgUrl.replaceAll('50.jpg', '52.jpg'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          autofocus: true,
                          focusColor: Colors.orangeAccent,
                          highlightColor: Colors.orangeAccent,
                          hoverColor: Colors.orangeAccent,
                          onTap: () {
                            Navigator.pushNamed(
                                context, PlayerMobPage.routeName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.orangeAccent,
                              width: 200,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  Text(
                                    "Assistir",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  )
                                ],
                              ),
                            ),
                          ),
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
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: getItems().length,
                  itemBuilder: (ctx, i) {
                    return Text(getItems()[i]);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselWidget(
                    items: getImages(CarouselType.movies),
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
