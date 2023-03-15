import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_movies/core/constants.dart';
import 'package:go_movies/features/movie_flow/movie_flow_controller.dart';
import '../../../core/widgets/primary_button.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          Text(
            'Let\'s find a movie for you',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Image.asset('assets/images/undraw_horror_movie.png'),
          const Spacer(),
          PrimaryButton(
            onPressed: ref.read(movieFlowControllerProvider.notifier).nextPage,
            text: 'Get Started',
          ),
          const SizedBox(height: kMediumSpacing),
        ]),
      ),
    );
  }
}
