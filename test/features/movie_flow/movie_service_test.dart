import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_movies/core/failure.dart';
import 'package:go_movies/features/movie_flow/genre/genre.dart';
import 'package:go_movies/features/movie_flow/genre/genre_entity.dart';
import 'package:go_movies/features/movie_flow/movie_repository.dart';
import 'package:go_movies/features/movie_flow/movie_service.dart';
import 'package:go_movies/features/movie_flow/result/movie.dart';
import 'package:go_movies/features/movie_flow/result/movie_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late MovieRepository mockedMovieRepository;

  setUp(() => mockedMovieRepository = MockMovieRepository());

  test(
      'Given successful call When getting GenreEntities Then map to correct genres ',
      () async {
    when(() => mockedMovieRepository.getMovieGenres())
        .thenAnswer((invocation) => Future.value([
              const GenreEntity(id: 0, name: 'Animation'),
            ]));

    final movieService = TMDBMovieService(mockedMovieRepository);

    final result = await movieService.getGenres();

    expect(result.tryGetSuccess(), [const Genre(name: 'Animation')]);
  });

  test('Given failed call When getting GenreEntities Then return failure',
      () async {
    when(() => mockedMovieRepository.getMovieGenres()).thenThrow(
      Failure(message: 'No Internet', exception: const SocketException('')),
    );

    final movieService = TMDBMovieService(mockedMovieRepository);

    final result = await movieService.getGenres();

    expect(result.tryGetError()?.exception, isA<SocketException>());
  });

  test(
      'Given successful call When getting MovieEntity Then map to correct Movie',
      () async {
    const genre = Genre(name: 'Animation', id: 1, isSelected: true);
    const movieEntity = MovieEntity(
      title: 'tender Coconut',
      overview: 'intresting as well as boring',
      voteAverage: 6.8,
      genreIds: [1],
      releaseDate: '2012-12-20',
    );
    when(() => mockedMovieRepository.getRecommendedMovies(any(), any(), any()))
        .thenAnswer((invocation) {
      return Future.value([
        movieEntity,
      ]);
    });
    final movieService = TMDBMovieService(mockedMovieRepository);

    final result =
        await movieService.getRecommendedMovie(5, 20, [genre], DateTime(2021));
    final movie = result.tryGetSuccess();

    expect(
      movie,
      Movie(
          title: movieEntity.title,
          overview: movieEntity.overview,
          voteAverage: movieEntity.voteAverage,
          genres: const [genre],
          releaseDate: movieEntity.releaseDate),
    );
  });

  test('Given failed call When getting MovieEntities Then throw failure',
      () async {
    const genre = Genre(name: 'Animation', id: 1, isSelected: true);
    when(() => mockedMovieRepository.getRecommendedMovies(any(), any(), any()))
        .thenThrow(
            Failure(message: 'message', exception: const SocketException('')));
    final movieService = TMDBMovieService(mockedMovieRepository);

    final result =
        await movieService.getRecommendedMovie(5, 20, [genre], DateTime(2021));

    expect(
      result.tryGetError()?.exception,
      isA<SocketException>(),
    );
  });
}
