import 'package:flutter/material.dart';

/// Modular Widget: A padded container containing a descriptive paragraph.
class DescriptionWidget extends StatelessWidget {
  final String description;

  const DescriptionWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        description,
        softWrap: true,
        style: const TextStyle(
          fontSize: 14.0,
          height: 1.5,
        ),
      ),
    );
  }
}
