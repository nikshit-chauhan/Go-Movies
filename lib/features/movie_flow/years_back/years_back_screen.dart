import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_movies/core/constants.dart';
import 'package:go_movies/core/widgets/primary_button.dart';
import 'package:go_movies/features/movie_flow/result/result_screen.dart';

import '../movie_flow_controller.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({super.key});
  @override
  Widget build(context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
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
                '${ref.watch(movieFlowControllerProvider).yearsBack}',
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
              value:
                  ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
              min: 0,
              max: 70,
              divisions: 70,
              label: '${ref.watch(movieFlowControllerProvider).yearsBack}',
              onChanged: (value) {
                ref
                    .read(movieFlowControllerProvider.notifier)
                    .updateYearsBack(value.toInt());
              }),
          const Spacer(),
          PrimaryButton(
            onPressed: () async {
              await ref
                  .read(movieFlowControllerProvider.notifier)
                  .getRecommendedMovie();
              Navigator.of(context).push(ResultScreen.route());
            },
            isLoading:
                ref.watch(movieFlowControllerProvider).movie is AsyncLoading,
            text: 'Amazing',
          ),
          const SizedBox(height: kMediumSpacing),
        ]),
      ),
    );
  }
}
