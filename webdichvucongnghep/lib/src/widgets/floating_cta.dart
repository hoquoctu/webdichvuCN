import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingCTA extends StatelessWidget {
  const FloatingCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Phone CTA
        _buildCTAButton(
          icon: Icons.phone,
          color: Colors.green.shade600,
          url: 'tel:0966533544',
          tooltip: 'Gọi điện',
        ),
        const SizedBox(height: 12),
        // Zalo CTA
        _buildCTAButton(
          icon: Icons.chat_bubble_outline,
          color: Colors.blue.shade600,
          url: 'https://zalo.me/0966533544',
          tooltip: 'Zalo Chat',
          textLogo: 'Zalo',
        ),
        const SizedBox(height: 12),
        // Facebook Messenger CTA
        _buildCTAButton(
          icon: Icons.facebook,
          color: const Color(0xFF0084FF), // Messenger blue
          url: 'https://www.facebook.com/vantaithanhthang.vn',
          tooltip: 'Facebook Messenger',
        ),
      ],
    );
  }

  Widget _buildCTAButton({
    required IconData icon,
    required Color color,
    required String url,
    required String tooltip,
    String? textLogo,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.35),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: textLogo != null
              ? Text(
                  textLogo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                )
              : Icon(icon, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}
