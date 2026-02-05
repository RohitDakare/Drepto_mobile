import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: const Text('Privacy Policy', style: AppTextStyles.h4),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Last Updated: February 2026',
              style: AppTextStyles.caption,
            ),
            const SizedBox(height: 24),
            _Section(
              title: '1. Information We Collect',
              content: 'We collect personal information such as your name, email address, phone number, and health data when you register and use our services. This data is essential for providing you with personalized healthcare management.',
            ),
            _Section(
              title: '2. How We Use Your Information',
              content: 'Your information is used to facilitate appointments, manage your health records, and improve our services. We do not sell your personal data to third parties.',
            ),
             _Section(
              title: '3. Data Security',
              content: 'We implement industry-standard security measures to protect your data. All sensitive information is encrypted and stored securely.',
            ),
             _Section(
              title: '4. Sharing of Information',
              content: 'We may share your information with healthcare providers involved in your care. We may also disclose information if required by law.',
            ),
             _Section(
              title: '5. Your Rights',
              content: 'You have the right to access, correct, or delete your personal information. You can manage your privacy settings within the app.',
            ),
            const SizedBox(height: 24),
            const Text(
              'Contact Us',
              style: AppTextStyles.h4,
            ),
            const SizedBox(height: 8),
            Text(
              'If you have any questions about this Privacy Policy, please contact us at support@drepto.com.',
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String content;

  const _Section({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.h5),
          const SizedBox(height: 8),
          Text(
            content,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
