import 'package:flutter/material.dart';
import '../constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isLoading = false,
      this.width = double.infinity});

  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final double width;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius / 2),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              )
            else
              Text(
                text,
                style: Theme.of(context).textTheme.labelLarge,
              ),
          ],
        ),
      ),
    );
  }
}
