import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Column(
        children: [
          const Text(
            "ASHIF",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Flutter Developer • UI/UX Enthusiast • Open Source Contributor",
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFooterLink("GitHub"),
              const SizedBox(width: 32),
              _buildFooterLink("LinkedIn"),
              const SizedBox(width: 32),
              _buildFooterLink("Twitter"),
              const SizedBox(width: 32),
              _buildFooterLink("Instagram"),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            "© ${DateTime.now().year} Ashif. All rights reserved.",
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Built with ", style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              Icon(Icons.favorite, color: Colors.red, size: 12),
              Text(" using Flutter", style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
