import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_movies/app.dart';
import 'package:go_movies/core/widgets/primary_button.dart';
import 'package:go_movies/features/movie_flow/movie_repository.dart';
import 'package:integration_test/integration_test.dart';
import 'stubs/stub_movie_repository.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('test basic flow and see the fake generated movie in the end',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          movieRepositoryProvider.overrideWithValue(StubMovieRepository()),
        ],
        child: const App(),
      ),
    );
    await tester.tap(find.byType(PrimaryButton));

    await tester.pumpAndSettle();
    await tester.tap(find.text('Action'));
    await tester.tap(find.byType(PrimaryButton));

    await tester.pumpAndSettle();
    await tester.tap(find.byType(PrimaryButton));

    await tester.pumpAndSettle();
    await tester.tap(find.byType(PrimaryButton));

    await tester.pumpAndSettle();
    expect(find.text('John Wick'), findsOneWidget);
  });
}
