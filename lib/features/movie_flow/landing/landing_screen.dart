import 'package:flutter/material.dart';
import 'package:go_movies/core/constants.dart';
import '../../../core/widgets/primary_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen(
      {Key? key, required this.nextPage, required this.previousPage})
      : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(context) {
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
            onPressed: nextPage,
            text: 'Get Started',
          ),
          const SizedBox(height: kMediumSpacing),
        ]),
      ),
    );
  }
}
