import 'package:flutter/material.dart';
import 'package:go_movies/features/movie_flow/movie_flow.dart';
import 'theme/custom_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Go Movies',
      darkTheme: CustomTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      home: const MovieFlow(),
    );
  }
}
