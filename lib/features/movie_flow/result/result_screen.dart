import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_movies/core/constants.dart';
import 'package:go_movies/core/failure.dart';
import 'package:go_movies/core/widgets/failure_screen.dart';
import 'package:go_movies/core/widgets/primary_button.dart';
import 'package:go_movies/features/movie_flow/movie_flow_controller.dart';

import 'movie.dart';

class ResultScreen extends ConsumerWidget {
  static route({bool fullscreenDialog = true}) => MaterialPageRoute(
        builder: (context) => const ResultScreen(),
        fullscreenDialog: fullscreenDialog,
      );
  const ResultScreen({super.key});

  final double movieHeight = 150;

  @override
  Widget build(context, WidgetRef ref) {
    return ref.watch(movieFlowControllerProvider).movie.when(
          data: (movie) {
            return Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CoverImage(movie: movie),
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              bottom: -(movieHeight / 2),
                              child: MovieImageDetails(
                                movie: movie,
                                movieHeight: movieHeight,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: movieHeight / 2),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            movie.overview,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PrimaryButton(
                    onPressed: () => Navigator.of(context).pop(),
                    text: 'Find another movie',
                  ),
                  const SizedBox(
                    height: kMediumSpacing,
                  ),
                ],
              ),
            );
          },
          error: (e, s) {
            if (e is Failure) {
              return FailureScreen(message: e.message);
            }
            return const FailureScreen(
                message: 'Something went wrong on our end');
          },
          loading: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
  }
}

class MovieImageDetails extends ConsumerWidget {
  const MovieImageDetails({
    super.key,
    required this.movie,
    required this.movieHeight,
  });

  final Movie movie;
  final double movieHeight;

  @override
  Widget build(context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: movieHeight,
            child: Image.network(
              movie.posterPath ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, e, s) {
                return const SizedBox();
              },
            ),
          ),
          const SizedBox(width: kMediumSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: theme.textTheme.headlineMedium,
                ),
                Text(
                  movie.genresCommaSeperated,
                  style: theme.textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    Text(
                      movie.voteAverage.toString(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodyMedium?.color
                            ?.withOpacity(0.62),
                      ),
                    ),
                    const Icon(
                      Icons.star_rounded,
                      size: 20,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CoverImage extends ConsumerWidget {
  const CoverImage({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(context, WidgetRef ref) {
    return Container(
      constraints: const BoxConstraints(minHeight: 298),
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Colors.transparent,
            ],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: Image.network(
          movie.backdropPath ?? '',
          fit: BoxFit.cover,
          errorBuilder: (context, e, s) {
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
