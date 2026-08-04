import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../utils/responsive.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 100, horizontal: isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            "Get in Touch",
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          ).animate().fadeIn(),
          
          SizedBox(height: isMobile ? 40 : 60),
          
          Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Flex(
              direction: (isMobile || isTablet) ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Info Side
                Flexible(
                  flex: (isMobile || isTablet) ? 0 : 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's build something extraordinary together.",
                        style: TextStyle(
                          fontSize: isMobile ? 24 : 28,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildContactInfo(Icons.email_outlined, "Email", "ashifashif32129@gmail.com", isMobile),
                      const SizedBox(height: 24),
                      _buildContactInfo(Icons.phone_outlined, "Phone", "+91 7306238617", isMobile),
                      const SizedBox(height: 48),
                      const Text(
                        "Socials",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _buildSocialButton(FontAwesomeIcons.github),
                          const SizedBox(width: 16),
                          _buildSocialButton(FontAwesomeIcons.linkedin),
                          const SizedBox(width: 16),
                          _buildSocialButton(FontAwesomeIcons.instagram),
                        ],
                      ),
                    ],
                  ),
                ),
                
                SizedBox(width: (isMobile || isTablet) ? 0 : 60, height: (isMobile || isTablet) ? 60 : 0),
                
                // Form Side
                Flexible(
                  flex: (isMobile || isTablet) ? 0 : 3,
                  child: GlassCard(
                    padding: EdgeInsets.all(isMobile ? 20 : 32),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextField("Full Name", Icons.person_outline),
                          const SizedBox(height: 20),
                          _buildTextField("Email Address", Icons.email_outlined),
                          const SizedBox(height: 20),
                          _buildTextField("Message", Icons.message_outlined, maxLines: 5),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Submit
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                elevation: 0,
                              ),
                              child: const Text(
                                "SEND MESSAGE",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),
        ],
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String label, String value, bool isMobile) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary, size: isMobile ? 20 : 24),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
            Text(value, style: TextStyle(fontSize: isMobile ? 14 : 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(dynamic icon) {
    return IconButton(
      onPressed: () {},
      icon: FaIcon(icon, color: AppColors.textPrimary, size: 24),
      style: IconButton.styleFrom(
        backgroundColor: AppColors.border.withValues(alpha: 0.3),
        padding: const EdgeInsets.all(16),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, {int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
      ),
      validator: (value) => value!.isEmpty ? "Required" : null,
    );
  }
}
