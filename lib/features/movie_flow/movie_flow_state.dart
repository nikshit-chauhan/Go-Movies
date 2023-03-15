import 'package:flutter/material.dart';
import 'package:go_movies/features/movie_flow/genre/genre.dart';
import 'package:go_movies/features/movie_flow/result/movie.dart';

const genresMock = [
  Genre(name: 'Action'),
  Genre(name: 'Comedy'),
  Genre(name: 'Horror'),
  Genre(name: 'Anime'),
  Genre(name: 'Drama'),
  Genre(name: 'Family'),
  Genre(name: 'Romance'),
];
const movieMock = Movie(
  title: 'John Wick',
  overview:
      'An ex-hit-man comes out of retirement to track down the gangsters that killed his dog and took his car.',
  voteAverage: 7.4,
  genres: [
    Genre(name: 'Action'),
    Genre(name: 'Crime'),
    Genre(name: 'Thriller')
  ],
  releaseDate: '2014-05-24',
  backdropPath: '',
  posterPath: '',
);

@immutable
class MovieFlowState {
  final PageController pageController;
  final int rating;
  final int yearsBack;
  final List<Genre> genres;
  final Movie movie;

  const MovieFlowState({
    required this.pageController,
    this.movie = movieMock,
    this.genres = genresMock,
    this.rating = 5,
    this.yearsBack = 10,
  });

  MovieFlowState copyWith(
      {PageController? pageController,
      int? rating,
      int? yearsBack,
      List<Genre>? genres,
      Movie? movie}) {
    return MovieFlowState(
      pageController: pageController ?? this.pageController,
      rating: rating ?? this.rating,
      yearsBack: yearsBack ?? this.rating,
      genres: genres ?? this.genres,
      movie: movie ?? this.movie,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieFlowState &&
        other.pageController == pageController &&
        other.rating == rating &&
        other.yearsBack == yearsBack &&
        other.genres == genres &&
        other.movie == movie;
  }

  @override
  int get hashCode {
    return pageController.hashCode ^
        rating.hashCode ^
        yearsBack.hashCode ^
        genres.hashCode ^
        movie.hashCode;
  }
}
