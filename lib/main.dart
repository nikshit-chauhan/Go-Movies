import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
  ));
});
