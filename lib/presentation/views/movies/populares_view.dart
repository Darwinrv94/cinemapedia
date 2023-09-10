import 'package:cinemapedia/presentation/providers/movies_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularesView extends ConsumerStatefulWidget {
  const PopularesView({super.key});

  @override
  PopularesViewState createState() => PopularesViewState();
}

class PopularesViewState extends ConsumerState<PopularesView> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final popularMovies = ref.watch( popularMoviesProvider );

    if ( popularMovies.isEmpty ) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    return Scaffold(
      body: MovieMasonry(
        loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
        movies: popularMovies
      ),
    );
  }
}
