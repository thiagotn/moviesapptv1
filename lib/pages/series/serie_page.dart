import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/player/player_mob_page.dart';
import 'package:moviesapptv1/pages/series/serie_bloc.dart';
import 'package:moviesapptv1/pages/widgets/carousel_widget.dart';
import 'package:moviesapptv1/pages/widgets/flat_button_gradient_widget.dart';
import 'package:moviesapptv1/repository/mocks.dart';
import 'package:provider/provider.dart';

class SeriePage extends StatefulWidget {
  static String routeName = "/serie";

  const SeriePage({Key? key}) : super(key: key);

  @override
  State<SeriePage> createState() => _SeriePageState();
}

class _SeriePageState extends State<SeriePage>
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
      body: Consumer<SerieBloc>(
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
                        child: FlatButtonGradient(
                          width: 200,
                          text: "Assistir",
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              PlayerMobPage.routeName,
                            );
                          },
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
                      Tab(child: Text("Episódios")),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Container(
                        width: 200,
                        decoration: const BoxDecoration(
                          color: Colors.greenAccent, //<-- SEE HERE
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Center(
                            child: DropdownButton(
                              isExpanded: true,
                              value: bloc.currentTabIndex,
                              items: const [
                                DropdownMenuItem(
                                    value: 0, child: Text("1ª Temporada")),
                                DropdownMenuItem(
                                    value: 1, child: Text("2ª Temporada")),
                                DropdownMenuItem(
                                    value: 2, child: Text("3ª Temporada")),
                                DropdownMenuItem(
                                    value: 3, child: Text("4ª Temporada")),
                                DropdownMenuItem(
                                    value: 4, child: Text("5ª Temporada")),
                              ],
                              onChanged: (int? index) {
                                bloc.setCurrentTabIndex(index);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: getItems().length,
                  itemBuilder: (ctx, i) {
                    return Text(getItems()[i]);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CarouselWidget(
                          items: getImages(CarouselType.series),
                        ),
                      ),
                    ],
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
