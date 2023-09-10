import 'package:cinemapedia/presentation/views/view.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({
    super.key,
    required this.pageIndex
  });

  final viewRoutes = const <Widget>[
    HomeView(),
    PopularesView(),
    FavoritesView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: pageIndex
      ),
    );
  }
}
