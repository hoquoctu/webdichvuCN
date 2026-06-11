import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;

    return Container(
      color: const Color(0xFF1A252C), // Premium deep dark slate background
      padding: const EdgeInsets.only(top: 48, left: 24, right: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Multi-column row
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCompanyColumn(context),
                    const SizedBox(height: 32),
                    _buildLinksColumn(context),
                    const SizedBox(height: 32),
                    _buildServicesColumn(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildCompanyColumn(context)),
                    const SizedBox(width: 48),
                    Expanded(flex: 1, child: _buildLinksColumn(context)),
                    const SizedBox(width: 48),
                    Expanded(flex: 1, child: _buildServicesColumn(context)),
                  ],
                ),
          const SizedBox(height: 40),
          const Divider(color: Colors.white10),
          const SizedBox(height: 16),
          // Bottom Copyright & SNS Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Copyright © 2024 Thanh Thang. All Rights Reserved.',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                ),
              ),
              Row(
                children: [
                  _buildSNSButton(Icons.play_circle_fill, 'https://youtube.com'),
                  const SizedBox(width: 12),
                  _buildSNSButton(Icons.facebook, 'https://www.facebook.com/vantaithanhthang.vn'),
                  const SizedBox(width: 12),
                  _buildSNSButton(Icons.video_library, 'https://tiktok.com'),
                  const SizedBox(width: 24),
                  // Back to Top button
                  TextButton.icon(
                    onPressed: () {
                      Scrollable.ensureVisible(
                        context,
                        alignment: 0.0,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                    icon: const Icon(Icons.arrow_upward, size: 16, color: Color(0xFFE77409)),
                    label: const Text(
                      'Lên đầu trang',
                      style: TextStyle(color: Color(0xFFE77409), fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCompanyColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Fallback or styled company name as header
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFE77409),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.engineering, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    'CÔNG TY TNHH KỸ THUẬT VÀ VẬN TẢI THÀNH THẮNG',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54,
                      letterSpacing: 0.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        _buildInfoItem(Icons.phone, '096 653 35 44', isLink: true, url: 'tel:0966533544'),
        _buildInfoItem(Icons.language, 'kythuatthanhthang.vn', isLink: true, url: 'https://kythuatthanhthang.vn'),
        _buildInfoItem(Icons.email, 'kythuatthanhthangvn@gmail.com', isLink: true, url: 'mailto:kythuatthanhthangvn@gmail.com'),
        _buildInfoItem(Icons.location_on, 'Trụ sở chính: 6/23/4A đường số 10, Khu Phố 3, Phường Hiệp Bình, Thành Phố Hồ Chí Minh'),
        _buildInfoItem(Icons.store, 'CN1: KCN Sông Hậu - giai đoạn 1. X. Đông Phú, H. Châu Thành, T. Hậu Giang'),
        _buildInfoItem(Icons.store, 'CN2: KCN Hậu Cần cảng Tam Hiệp, X. Tam Hiệp, H. Núi Thành, T. Quảng Nam'),
        _buildInfoItem(Icons.store, 'CN3: KCN Thanh Liêm, P. Thanh Tuyền, TP. Phủ Lý, T. Hà Nam'),
        _buildInfoItem(Icons.receipt_long, 'Mã số thuế: 0310801994'),
      ],
    );
  }

  Widget _buildLinksColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CÔNG TY',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.8),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('Giới thiệu', () => context.go('/gioi-thieu')),
        _buildFooterLink('Khách hàng', () => context.go('/')),
        _buildFooterLink('Đối tác', () => context.go('/')),
        _buildFooterLink('Dự án tiêu biểu', () => context.go('/du-an')),
        _buildFooterLink('Liên hệ', () => context.go('/lien-he')),
      ],
    );
  }

  Widget _buildServicesColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DỊCH VỤ',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.8),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('Lắp đặt máy móc & thiết bị công nghiệp', () => context.go('/dich-vu')),
        _buildFooterLink('Tháo dỡ di dời & lắp đặt máy', () => context.go('/dich-vu')),
        _buildFooterLink('Bảo trì máy móc & thiết bị điện công nghiệp', () => context.go('/dich-vu')),
        _buildFooterLink('Thu mua & trao đổi máy móc thiết bị công nghiệp', () => context.go('/dich-vu')),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text, {bool isLink = false, String? url}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: const Color(0xFFE77409)),
          const SizedBox(width: 12),
          Expanded(
            child: isLink && url != null
                ? MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => launchUrl(Uri.parse(url)),
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  )
                : Text(
                    text,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSNSButton(IconData icon, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Icon(icon, color: Colors.grey.shade400, size: 20),
    );
  }
}
