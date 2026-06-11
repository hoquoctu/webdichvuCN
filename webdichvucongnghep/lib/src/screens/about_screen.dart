import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';
import '../widgets/footer.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companyAsync = ref.watch(companyControllerProvider);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 750;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Page Header Banner
          Container(
            height: 180,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE77409), Color(0xFFC85A00)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.center,
            child: Text(
              'GIỚI THIỆU VỀ THÀNH THẮNG',
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
          companyAsync.when(
            data: (company) => Padding(
              padding: EdgeInsets.symmetric(vertical: 48, horizontal: isMobile ? 24 : 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'CÔNG TY TNHH KỸ THUẬT VÀ VẬN TẢI THÀNH THẮNG',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF238419),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Divider(),
                            const SizedBox(height: 12),
                            Text(
                              company.description,
                              style: const TextStyle(fontSize: 16, height: 1.8, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    'GIÁ TRỊ CỐT LÕI',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFE77409)),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Định hướng hoạt động và phát triển của Thành Thắng',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  // Core values grid
                  _buildValuesGrid(isMobile),
                ],
              ),
            ),
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(64.0),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (e, st) => Padding(
              padding: const EdgeInsets.all(64.0),
              child: Text('Lỗi: $e'),
            ),
          ),
          // Footer
          const AppFooter(),
        ],
      ),
    );
  }

  Widget _buildValuesGrid(bool isMobile) {
    final values = [
      {'title': 'Chuyên Nghiệp', 'desc': 'Đội ngũ kỹ sư tay nghề cao, thiết bị chuyên dụng hiện đại.', 'icon': Icons.stars},
      {'title': 'An Toàn', 'desc': 'Tuyệt đối tuân thủ quy trình an toàn lao động và bảo hiểm hàng hóa.', 'icon': Icons.security},
      {'title': 'Kịp Thời', 'desc': 'Đảm bảo tiến độ công việc, sẵn sàng hỗ trợ kỹ thuật 24/7.', 'icon': Icons.speed},
      {'title': 'Tiết Kiệm', 'desc': 'Tối ưu hóa phương án thi công giúp khách hàng tiết kiệm chi phí.', 'icon': Icons.monetization_on},
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: values.map((v) {
        return Container(
          width: isMobile ? double.infinity : 220,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(v['icon'] as IconData, size: 36, color: const Color(0xFFE77409)),
              const SizedBox(height: 16),
              Text(
                v['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                v['desc'] as String,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
