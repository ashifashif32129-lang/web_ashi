import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';


class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                icon: FontAwesomeIcons.github,
                onPressed: () => _launchURL(AppConstants.githubUrl),
              ),
              _SocialIcon(
                icon: FontAwesomeIcons.linkedin,
                onPressed: () => _launchURL(AppConstants.linkedinUrl),
              ),
              _SocialIcon(
                icon: FontAwesomeIcons.instagram,
                onPressed: () => _launchURL(AppConstants.instagramUrl),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "© 2026 Ashif",
            style: TextStyle(color: AppColors.secondaryText),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Built with Flutter ", style: TextStyle(color: AppColors.secondaryText)),
              Icon(Icons.favorite, color: Colors.red, size: 16),
            ],
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _SocialIcon extends StatelessWidget {
  final dynamic icon;
  final VoidCallback onPressed;

  const _SocialIcon({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon, color: AppColors.secondaryText),
      onPressed: onPressed,
      hoverColor: AppColors.primary.withValues(alpha: 0.1),
    );
  }
}
