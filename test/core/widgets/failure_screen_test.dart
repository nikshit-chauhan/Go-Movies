import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_movies/core/widgets/failure_screen.dart';

void main() {
  testWidgets(
      'Given message when rendering failure screen Then finds that message',
      (tester) async {
    const message = 'no';
    await tester.pumpWidget(
      const MaterialApp(
        home: FailureScreen(message: message),
      ),
    );
    expect(find.text(message), findsOneWidget);
  });
}
