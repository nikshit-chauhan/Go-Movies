import 'package:flutter/material.dart';
import 'package:go_movies/core/constants.dart';
import 'package:go_movies/core/widgets/primary_button.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen(
      {super.key, required this.nextPage, required this.previousPage});

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 5;

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
        child: Column(
          children: [
            Text(
              'Select a minimum rating\nranging from 1-10',
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${rating.ceil()}',
                  style: theme.textTheme.displayMedium,
                ),
                const Icon(Icons.star_rounded, color: Colors.amber, size: 62),
              ],
            ),
            const Spacer(),
            Slider(
              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
              value: rating,
              min: 1,
              max: 10,
              divisions: 10,
              label: '${rating.ceil()}',
            ),
            const Spacer(),
            PrimaryButton(onPressed: widget.nextPage, text: 'Yes Please'),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
