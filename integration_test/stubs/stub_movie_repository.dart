import 'dart:async';

import 'package:go_movies/features/movie_flow/genre/genre_entity.dart';
import 'package:go_movies/features/movie_flow/movie_repository.dart';
import 'package:go_movies/features/movie_flow/result/movie_entity.dart';

class StubMovieRepository implements MovieRepository {
  @override
  Future<List<GenreEntity>> getMovieGenres() async {
    return Future.value([const GenreEntity(id: 1, name: 'Action')]);
  }

  @override
  Future<List<MovieEntity>> getRecommendedMovies(
      double rating, String date, String genreIds) {
    return Future.value([
      const MovieEntity(
          title: 'John Wick',
          overview: 'Hitman\'s revenge',
          voteAverage: 8.5,
          genreIds: [1, 2, 3],
          releaseDate: '2023-03-24')
    ]);
  }
}
