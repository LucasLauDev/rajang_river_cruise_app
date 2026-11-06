import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// Modular Widget: Action Bar with 3 action buttons (CALL, ROUTE, SHARE) evenly spaced.
class ActionBarWidget extends StatelessWidget {
  const ActionBarWidget({super.key});

  static const String phoneNumber = '084318005';
  static const String mapUrl = 'https://maps.app.goo.gl/CAMqotQbHxpvadzbA';

  Future<void> _makePhoneCall(BuildContext context) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        await launchUrl(launchUri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Calling 084318005...')),
        );
      }
    }
  }

  Future<void> _openDirections(BuildContext context) async {
    final Uri url = Uri.parse(mapUrl);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch Google Maps')),
          );
        }
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Opening Google Maps...')),
        );
      }
    }
  }

  Future<void> _shareCruise(BuildContext context) async {
    try {
      // ignore: deprecated_member_use
      await Share.share(
        'Explore Sibu with Rajang River Cruise!\nLocation & Directions: $mapUrl\nFor inquiries/booking, call $phoneNumber.',
        subject: 'Sibu Rajang River Cruise & Heritage',
      );
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sharing Rajang River Cruise...')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(
          context: context,
          color: color,
          icon: Icons.call,
          label: 'CALL',
          onTap: () => _makePhoneCall(context),
        ),
        _buildButtonColumn(
          context: context,
          color: color,
          icon: Icons.near_me,
          label: 'ROUTE',
          onTap: () => _openDirections(context),
        ),
        _buildButtonColumn(
          context: context,
          color: color,
          icon: Icons.share,
          label: 'SHARE',
          onTap: () => _shareCruise(context),
        ),
      ],
    );
  }

  Widget _buildButtonColumn({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 8.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
