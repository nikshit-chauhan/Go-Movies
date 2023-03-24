import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_movies/core/widgets/primary_button.dart';

void main() {
  testWidgets(
      'Given primary button When loading is true Then find progress Indicator',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PrimaryButton(
          onPressed: () {},
          text: '',
          isLoading: true,
        ),
      ),
    );
    final loadingIndicatorFinder = find.byType(CircularProgressIndicator);
    expect(loadingIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'When primary button When loading is false Then finds no progress Indicator',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PrimaryButton(
          onPressed: () {},
          text: '',
          isLoading: false,
        ),
      ),
    );
    final loadingIndicatorFinder = find.byType(CircularProgressIndicator);
    expect(loadingIndicatorFinder, findsNothing);
  });
}
