import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({super.key, required this.message});

  final String message;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: FailureBody(message: message),
    );
  }
}

class FailureBody extends StatelessWidget {
  const FailureBody({super.key, required this.message});

  final String message;

  @override
  Widget build(context) {
    return Center(
      child: Text(message),
    );
  }
}
