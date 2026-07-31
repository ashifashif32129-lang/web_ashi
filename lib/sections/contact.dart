import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/section_heading.dart';
import '../widgets/custom_button.dart';
import '../firebase/firestore_service.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        await FirestoreService().saveContactMessage(
          name: _nameController.text,
          email: _emailController.text,
          message: _messageController.text,
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Message sent successfully!')),
          );
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to send message: $e')),
          );
        }
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: "Contact"),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField(_nameController, "Name", Icons.person),
                      const SizedBox(height: 20),
                      _buildTextField(_emailController, "Email", Icons.email),
                      const SizedBox(height: 20),
                      _buildTextField(_messageController, "Message", Icons.message, maxLines: 5),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _isLoading 
                          ? const CircularProgressIndicator()
                          : CustomButton(text: "Send Message", onPressed: _submitForm),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 50),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ContactInfo(icon: Icons.person, label: "Name", value: "Ashif"),
                    SizedBox(height: 20),
                    _ContactInfo(icon: Icons.email, label: "Email", value: "ashifashif32129@gmail.com"),
                    SizedBox(height: 20),
                    _ContactInfo(icon: Icons.phone, label: "Phone", value: "7306238617"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: AppColors.text),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.secondaryText),
        prefixIcon: Icon(icon, color: AppColors.primary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
        filled: true,
        fillColor: AppColors.card.withValues(alpha: 0.5),
      ),
      validator: (value) => value!.isEmpty ? "Required" : null,
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ContactInfo({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.accent, size: 20),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(color: AppColors.secondaryText, fontSize: 14)),
          ],
        ),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(color: AppColors.text, fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
