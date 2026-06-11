import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const AppHeader({this.height = 110, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 950;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // 1. Language Top Bar (40px)
          Container(
            height: 40,
            color: const Color(0xFFE77409), // Main orange color
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Select Language: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(width: 8),
                _buildLanguageItem('🇻🇳 Vietnamese', () {}),
                _buildLanguageDivider(),
                _buildLanguageItem('🇬🇧 English', () {}),
                _buildLanguageDivider(),
                _buildLanguageItem('🇨🇳 Chinese', () {}),
                _buildLanguageDivider(),
                _buildLanguageItem('🇰🇷 Korea', () {}),
                _buildLanguageDivider(),
                _buildLanguageItem('🇯🇵 Japan', () {}),
              ],
            ),
          ),
          // 2. Main Navigation Bar (70px)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  // Logo area
                  GestureDetector(
                    onTap: () => context.go('/'),
                    behavior: HitTestBehavior.opaque,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: _buildFallbackLogo(),
                    ),
                  ),
                  const Spacer(),
                  if (!isMobile) ...[
                    // Navigation links
                    Row(
                      children: [
                        HeaderNavButton(title: 'Trang chủ', onTap: () => context.go('/')),
                        HeaderNavButton(title: 'Giới thiệu', onTap: () => context.go('/gioi-thieu')),
                        HeaderNavButton(title: 'Dịch vụ', onTap: () => context.go('/dich-vu')),
                        HeaderNavButton(title: 'Dự án', onTap: () => context.go('/du-an')),
                        HeaderNavButton(title: 'Tin tức', onTap: () => context.go('/tin-tuc')),
                        HeaderNavButton(title: 'Tuyển dụng', onTap: () => context.go('/tuyen-dung')),
                        HeaderNavButton(title: 'Liên hệ', onTap: () => context.go('/lien-he')),
                      ],
                    ),
                    const SizedBox(width: 16),
                    // Hotline Action
                    ElevatedButton.icon(
                      onPressed: () => launchUrl(Uri.parse('tel:0966533544')),
                      icon: const Icon(Icons.phone_in_talk, size: 16, color: Colors.white),
                      label: const Text(
                        '0966 533 544',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF238419), // Green sub-color
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ] else ...[
                    // Hamburger button for mobile
                    IconButton(
                      icon: const Icon(Icons.menu, size: 28, color: Color(0xFFE77409)),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageItem(String label, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageDivider() {
    return Container(
      width: 1,
      height: 12,
      color: Colors.white.withOpacity(0.5),
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Widget _buildFallbackLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFE77409),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.engineering, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 6),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'THÀNH THẮNG',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xFF238419),
                letterSpacing: 1.0,
                height: 1.1,
              ),
            ),
            Text(
              'KỸ THUẬT & VẬN TẢI',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE77409),
                letterSpacing: 0.8,
                height: 1.1,
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class HeaderNavButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const HeaderNavButton({required this.title, required this.onTap, super.key});

  @override
  State<HeaderNavButton> createState() => _HeaderNavButtonState();
}

class _HeaderNavButtonState extends State<HeaderNavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _isHovered ? const Color(0xFFE77409) : const Color(0xFF333333),
            ),
          ),
        ),
      ),
    );
  }
}

class AppMobileDrawer extends StatelessWidget {
  const AppMobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFE77409),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.engineering, color: Color(0xFFE77409), size: 24),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'THÀNH THẮNG',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                      Text(
                        'KỸ THUẬT & VẬN TẢI',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          _buildDrawerItem(context, 'Trang chủ', '/', Icons.home),
          _buildDrawerItem(context, 'Giới thiệu', '/gioi-thieu', Icons.info),
          _buildDrawerItem(context, 'Dịch vụ', '/dich-vu', Icons.build),
          _buildDrawerItem(context, 'Dự án', '/du-an', Icons.work),
          _buildDrawerItem(context, 'Tin tức', '/tin-tuc', Icons.article),
          _buildDrawerItem(context, 'Tuyển dụng', '/tuyen-dung', Icons.people),
          _buildDrawerItem(context, 'Liên hệ', '/lien-he', Icons.contact_mail),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () => launchUrl(Uri.parse('tel:0966533544')),
              icon: const Icon(Icons.phone_in_talk, color: Colors.white),
              label: const Text(
                '0966 533 544',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF238419),
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, String path, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFE77409)),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF333333)),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer
        context.go(path);
      },
    );
  }
}
