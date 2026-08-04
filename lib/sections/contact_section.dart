import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../utils/constants.dart';
import '../firebase/firestore_service.dart';
import '../widgets/glass_card.dart';
import '../utils/responsive.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      
      final name = _nameController.text;
      final email = _emailController.text;
      final phone = _phoneController.text;
      final message = _messageController.text;

      // Prepare WhatsApp URL - Using api.whatsapp.com for better web compatibility
      final whatsappMessage = "Name: $name\nEmail: $email\nPhone: $phone\nMessage:\n$message";
      final url = "https://api.whatsapp.com/send?phone=${AppConstants.whatsappNumber}&text=${Uri.encodeFull(whatsappMessage)}";

      try {
        // OPEN WHATSAPP IMMEDIATELY
        // Using platformDefault which is more reliable for opening new tabs on web
        final uri = Uri.parse(url);
        await launchUrl(uri, mode: LaunchMode.platformDefault);

        // Then save to Firestore in the background
        if (Firebase.apps.isNotEmpty) {
          FirestoreService().saveContactMessage(
            name: name,
            email: email,
            phone: phone,
            message: message,
          ).catchError((e) => debugPrint("Firestore background save failed: $e"));
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Redirecting to WhatsApp...'),
              backgroundColor: Colors.green,
            ),
          );
          
          _nameController.clear();
          _emailController.clear();
          _phoneController.clear();
          _messageController.clear();
        }
      } catch (e) {
        debugPrint("Error in submit: $e");
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not open WhatsApp. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

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
            child: (isMobile || isTablet)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoSide(isMobile),
                      const SizedBox(height: 60),
                      _buildFormSide(isMobile),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildInfoSide(isMobile),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        flex: 3,
                        child: _buildFormSide(isMobile),
                      ),
                    ],
                  ),
          ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),
        ],
      ),
    );
  }

  Widget _buildInfoSide(bool isMobile) {
    return Column(
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
        _buildContactInfo(Icons.email_outlined, "Email", AppConstants.email, isMobile),
        const SizedBox(height: 24),
        _buildContactInfo(Icons.phone_outlined, "Phone", AppConstants.phone, isMobile),
        const SizedBox(height: 48),
        const Text(
          "Socials",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildSocialButton(FontAwesomeIcons.github, () => _launchURL(AppConstants.githubUrl)),
            const SizedBox(width: 16),
            _buildSocialButton(FontAwesomeIcons.linkedin, () => _launchURL(AppConstants.linkedinUrl)),
            const SizedBox(width: 16),
            _buildSocialButton(FontAwesomeIcons.instagram, () => _launchURL(AppConstants.instagramUrl)),
          ],
        ),
      ],
    );
  }

  Widget _buildFormSide(bool isMobile) {
    return GlassCard(
      padding: EdgeInsets.all(isMobile ? 20 : 32),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildTextField("Full Name", Icons.person_outline, _nameController),
            const SizedBox(height: 20),
            _buildTextField("Email Address", Icons.email_outlined, _emailController),
            const SizedBox(height: 20),
            _buildTextField("Phone Number", Icons.phone_outlined, _phoneController),
            const SizedBox(height: 20),
            _buildTextField("Message", Icons.message_outlined, _messageController, maxLines: 5),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      )
                    : const Text(
                        "SEND MESSAGE",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
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

  Widget _buildSocialButton(dynamic icon, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: FaIcon(icon, color: AppColors.textPrimary, size: 24),
      style: IconButton.styleFrom(
        backgroundColor: AppColors.border.withValues(alpha: 0.3),
        padding: const EdgeInsets.all(16),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, TextEditingController controller, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
      ),
      validator: (value) => value!.isEmpty ? "Required" : null,
    );
  }
}
