import 'package:flutter/material.dart';
import 'package:go_movies/core/constants.dart';
import 'package:go_movies/core/widgets/primary_button.dart';
import 'package:go_movies/features/movie_flow/result/result_screen.dart';

class YearsBackScreen extends StatefulWidget {
  const YearsBackScreen(
      {super.key, required this.nextPage, required this.previousPage});

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  createState() => _YearsBackScreenState();
}

class _YearsBackScreenState extends State<YearsBackScreen> {
  double yearsBack = 10;
  @override
  Widget build(context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
        child: Column(children: [
          Text(
            'How many years back should we check for?',
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${yearsBack.ceil()}',
                style: theme.textTheme.displayMedium,
              ),
              Text(
                'Years back',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color:
                      theme.textTheme.headlineMedium?.color?.withOpacity(0.62),
                ),
              ),
            ],
          ),
          const Spacer(),
          Slider(
              value: yearsBack,
              min: 0,
              max: 70,
              divisions: 70,
              label: '${yearsBack.ceil()}',
              onChanged: (value) {
                setState(() {
                  yearsBack = value;
                });
              }),
          const Spacer(),
          PrimaryButton(
            onPressed: () => Navigator.of(context).push(ResultScreen.route()),
            text: 'Amazing',
          ),
          const SizedBox(height: kMediumSpacing),
        ]),
      ),
    );
  }
}
