import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';
import '../widgets/service_card.dart';
import '../widgets/footer.dart';

class ServicesScreen extends ConsumerWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsync = ref.watch(serviceControllerProvider);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 750;
    final isTablet = width >= 750 && width < 1100;

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
              'DỊCH VỤ CỦA CHÚNG TÔI',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 22 : 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // 2. Services Grid Area
          Padding(
            padding: EdgeInsets.symmetric(vertical: 48, horizontal: isMobile ? 24 : 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'DANH MỤC DỊCH VỤ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFE77409)),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Chúng tôi cung cấp giải pháp vận chuyển lắp đặt cơ điện công nghiệp toàn diện trọn gói',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                servicesAsync.when(
                  data: (services) {
                    final int cols = isMobile ? 1 : (isTablet ? 2 : 4);
                    final double screenWidth = MediaQuery.of(context).size.width - (isMobile ? 48 : 128);
                    final double cardWidth = (screenWidth - (cols - 1) * 16) / cols;
                    final double cardHeight = 330;
                    final double aspect = cardWidth / cardHeight;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cols,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: aspect,
                      ),
                      itemCount: services.length,
                      itemBuilder: (context, index) => ServiceCard(service: services[index]),
                    );
                  },
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
              ],
            ),
          ),
          // Footer
          const AppFooter(),
        ],
      ),
    );
  }
}
