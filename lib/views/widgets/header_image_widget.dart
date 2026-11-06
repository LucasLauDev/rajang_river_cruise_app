import 'package:flutter/material.dart';

/// Modular Widget: Displays the hero banner image for the cruise destination.
class HeaderImageWidget extends StatelessWidget {
  final String imagePath;
  final double? height;

  const HeaderImageWidget({
    super.key,
    required this.imagePath,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: double.infinity,
      height: height ?? 240.0,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: height ?? 240.0,
          color: Colors.grey[300],
          child: const Center(
            child: Icon(
              Icons.directions_boat_rounded,
              size: 64.0,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
