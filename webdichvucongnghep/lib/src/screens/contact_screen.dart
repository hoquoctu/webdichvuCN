import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/footer.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitContact() {
    if (_nameController.text.isEmpty || _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập đầy đủ Họ tên và Số điện thoại!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tin nhắn của ${_nameController.text} đã được gửi thành công!'),
        backgroundColor: const Color(0xFF238419),
      ),
    );

    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Page Header Banner
          Container(
            height: 180,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF238419), Color(0xFF14580F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.center,
            child: Text(
              'LIÊN HỆ VỚI CHÚNG TÔI',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 22 : 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // 2. Main content
          Padding(
            padding: EdgeInsets.symmetric(vertical: 48, horizontal: isMobile ? 24 : 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'THÔNG TIN LIÊN HỆ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFE77409)),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Gửi yêu cầu hỗ trợ hoặc ghé thăm các chi nhánh của Thành Thắng trên toàn quốc',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                // Layout
                isMobile
                    ? Column(
                        children: [
                          _buildOfficeInfoSection(),
                          const SizedBox(height: 40),
                          _buildContactFormCard(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildOfficeInfoSection()),
                          const SizedBox(width: 48),
                          Expanded(child: _buildContactFormCard()),
                        ],
                      ),
              ],
            ),
          ),
          // Footer
          const AppFooter(),
        ],
      ),
    );
  }

  Widget _buildOfficeInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'VĂN PHÒNG & CHI NHÁNH',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
        ),
        const SizedBox(height: 20),
        _buildInfoItem(Icons.location_on, 'Trụ sở chính', '6/23/4A đường số 10, Khu Phố 3, Phường Hiệp Bình, Thành Phố Hồ Chí Minh'),
        _buildInfoItem(Icons.store, 'Chi nhánh Hậu Giang', 'KCN Sông Hậu - giai đoạn 1. X. Đông Phú, H. Châu Thành, T. Hậu Giang'),
        _buildInfoItem(Icons.store, 'Chi nhánh Quảng Nam', 'KCN Hậu Cần cảng Tam Hiệp, X. Tam Hiệp, H. Núi Thành, T. Quảng Nam'),
        _buildInfoItem(Icons.store, 'Chi nhánh Hà Nam', 'KCN Thanh Liêm, P. Thanh Tuyền, TP. Phủ Lý, T. Hà Nam'),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        _buildInfoItem(Icons.phone, 'Số điện thoại', '0966 533 544', isLink: true, url: 'tel:0966533544'),
        _buildInfoItem(Icons.email, 'Địa chỉ Email', 'kythuatthanhthangvn@gmail.com', isLink: true, url: 'mailto:kythuatthanhthangvn@gmail.com'),
        _buildInfoItem(Icons.language, 'Trang web', 'kythuatthanhthang.vn', isLink: true, url: 'https://kythuatthanhthang.vn'),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String detail, {bool isLink = false, String? url}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: const Color(0xFFE77409)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF333333))),
                const SizedBox(height: 2),
                isLink && url != null
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => launchUrl(Uri.parse(url)),
                          child: Text(
                            detail,
                            style: const TextStyle(color: Color(0xFF238419), fontSize: 13, decoration: TextDecoration.underline),
                          ),
                        ),
                      )
                    : Text(detail, style: TextStyle(color: Colors.grey.shade600, fontSize: 13, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactFormCard() {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'GỬI TIN NHẮN CHO CHÚNG TÔI',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF238419)),
            ),
            const SizedBox(height: 24),
            _buildTextField(controller: _nameController, label: 'Họ và tên *', icon: Icons.person),
            const SizedBox(height: 16),
            _buildTextField(controller: _phoneController, label: 'Số điện thoại *', icon: Icons.phone),
            const SizedBox(height: 16),
            _buildTextField(controller: _emailController, label: 'Email', icon: Icons.email),
            const SizedBox(height: 16),
            _buildTextField(controller: _messageController, label: 'Nội dung tin nhắn', icon: Icons.message, maxLines: 4),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: _submitContact,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE77409),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              ),
              child: const Text(
                'GỬI LIÊN HỆ',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        prefixIcon: Icon(icon, color: const Color(0xFFE77409), size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }
}
