import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

/// Modular Widget: Displays location name, subtitle, and interactive star rating counter.
class TitleSectionWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const TitleSectionWidget({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.destination.name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  viewModel.destination.location,
                  style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: viewModel.toggleStar,
            borderRadius: BorderRadius.circular(24.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    viewModel.isStarred ? Icons.star : Icons.star_border,
                    color: Colors.red[500],
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '${viewModel.starCount}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
