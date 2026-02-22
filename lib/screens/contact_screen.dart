import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/company_data.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company info card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF264653), Color(0xFF2A5364)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  'TGV',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC8A951),
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'TIMES GARDEN VIETNAM',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  CompanyData.slogan,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Liên hệ với chúng tôi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF264653),
            ),
          ),
          const SizedBox(height: 16),

          // Address
          _contactCard(
            icon: Icons.location_on_rounded,
            title: 'Trụ sở chính',
            content: CompanyData.address,
            onTap: null,
          ),
          const SizedBox(height: 12),

          // Phone
          _contactCard(
            icon: Icons.phone_rounded,
            title: 'Số điện thoại',
            content: CompanyData.phone,
            onTap: () => _launchUrl('tel:+84024628212006'),
          ),
          const SizedBox(height: 12),

          // Email
          _contactCard(
            icon: Icons.email_rounded,
            title: 'Email',
            content: CompanyData.email,
            onTap: () => _launchUrl('mailto:${CompanyData.email}'),
          ),
          const SizedBox(height: 12),

          // Website
          _contactCard(
            icon: Icons.language_rounded,
            title: 'Website',
            content: 'tgv.com.vn',
            onTap: () => _launchUrl(CompanyData.website),
          ),
          const SizedBox(height: 24),

          // Mission & Vision
          const Text(
            'Tầm nhìn & Sứ mệnh',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF264653),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFC8A951).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFC8A951).withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.visibility_rounded,
                        size: 18, color: Color(0xFFC8A951)),
                    SizedBox(width: 8),
                    Text(
                      'Tầm nhìn',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF264653),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  CompanyData.vision,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF264653).withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF264653).withValues(alpha: 0.1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.flag_rounded,
                        size: 18, color: Color(0xFF264653)),
                    SizedBox(width: 8),
                    Text(
                      'Sứ mệnh',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF264653),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  CompanyData.mission,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _contactCard({
    required IconData icon,
    required String title,
    required String content,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF264653).withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF264653), size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF264653),
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              const Icon(Icons.open_in_new_rounded,
                  size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
