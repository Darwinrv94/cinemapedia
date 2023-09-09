import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/providers/movies_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider = StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return StorageMoviesNotifier(localStoraRepository: localStorageRepository);
});

/* {
  1234: Movie,
  5678: Movie,
  2234: Movie
} */

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStoraRepository localStoraRepository;

  StorageMoviesNotifier({
    required this.localStoraRepository
  }): super({});

  Future<List<Movie>> loadNextPage() async {
    final movies = await localStoraRepository.loadMovies(
      offset: page * 10,
      limit: 20
    );

    page++;

    final tempMovieMap = <int, Movie>{};

    for (final movie in movies) {
      tempMovieMap[movie.id] = movie;
    }

    state = { ...state, ...tempMovieMap };

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStoraRepository.toggleFavorite(movie);

    final bool isMovieInFavorites = state[movie.id] != null;

    if (isMovieInFavorites) {
      state.remove(movie.id);
      state = { ...state };
    } else {
      state = { ...state, movie.id: movie };
    }
  }
}
