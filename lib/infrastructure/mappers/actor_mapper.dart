import 'package:cinemapedia/domain/entities/actor.dart';

import '../models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://gazettereview.com/wp-content/uploads/2016/03/facebook-avatar-700x441.jpg.webp',
      character: cast.character);
}
