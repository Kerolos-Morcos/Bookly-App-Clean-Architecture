import 'package:flutter/material.dart';

class LoadingIndicatorFadingCustomBookImage extends StatelessWidget {
  const LoadingIndicatorFadingCustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70 / 2.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}
