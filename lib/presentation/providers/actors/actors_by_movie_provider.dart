


import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/actor.dart';

final actorsByMovieProvidder = StateNotifierProvider<ActorByMovieNotifier,Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch(actorRepositoryProvider);

  return ActorByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    

    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
