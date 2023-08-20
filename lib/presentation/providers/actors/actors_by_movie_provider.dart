// ignore: depend_on_referenced_packages
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  {
    '1111': <Actor>[],
    '1112': <Actor>[],
    '1113': <Actor>[]
  }
*/

final actorsByMovieProvider = StateNotifierProvider<ActorsMapNotifier, Map<String, List<Actor>>>((ref) {
  final actorRepository = ref.watch(actorsRepositoryProvider);

  return ActorsMapNotifier(getActors: actorRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorsMapNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsMapNotifier({
    required this.getActors
  }): super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);

    state = { ...state, movieId: actors };
  }
}
