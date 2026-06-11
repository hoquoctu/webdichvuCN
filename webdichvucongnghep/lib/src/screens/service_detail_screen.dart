import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/providers.dart';
import '../models/service.dart';
import '../widgets/footer.dart';

class ServiceDetailScreen extends ConsumerWidget {
  final String slug;

  const ServiceDetailScreen({required this.slug, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsync = ref.watch(serviceControllerProvider);

    return servicesAsync.when(
      data: (services) {
        final service = services.where((s) => s.slug == slug).firstOrNull;
        if (service == null) {
          return const Center(child: Text('Dịch vụ không tồn tại'));
        }
        return _ServiceDetailBody(service: service);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Lỗi: $e')),
    );
  }
}

class _ServiceDetailBody extends StatelessWidget {
  final Service service;

  const _ServiceDetailBody({required this.service});

  IconData _getServiceIcon(String id) {
    switch (id) {
      case '1': return Icons.precision_manufacturing;
      case '2': return Icons.local_shipping;
      case '3': return Icons.electrical_services;
      case '4': return Icons.storefront;
      default: return Icons.engineering;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 750;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Banner
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE77409), Color(0xFFCC6600)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.center,
            child: Text(
              service.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 22 : 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.symmetric(vertical: 48, horizontal: isMobile ? 24 : 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon + Title
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE77409).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(_getServiceIcon(service.id), size: 40, color: const Color(0xFFE77409)),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        service.name,
                        style: TextStyle(
                          fontSize: isMobile ? 20 : 28,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Full Description
                const Text(
                  'MÔ TẢ CHI TIẾT',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF238419)),
                ),
                const SizedBox(height: 12),
                Text(
                  service.description,
                  style: TextStyle(fontSize: 15, height: 1.7, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 40),
                // Sub-services
                if (service.subServices.isNotEmpty) ...[
                  const Text(
                    'DỊCH VỤ LIÊN QUAN',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF238419)),
                  ),
                  const SizedBox(height: 16),
                  ...service.subServices.map((sub) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check_circle, color: Color(0xFF238419), size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            sub.name,
                            style: const TextStyle(fontSize: 15, color: Color(0xFF333333)),
                          ),
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(height: 32),
                ],
                // CTA buttons
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => context.go('/lien-he'),
                      icon: const Icon(Icons.contact_mail, color: Colors.white),
                      label: const Text('Liên hệ ngay', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE77409),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton.icon(
                      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tính năng đang phát triển')),
                      ),
                      icon: const Icon(Icons.download, color: Color(0xFF238419)),
                      label: const Text('Tải bảng báo giá', style: TextStyle(color: Color(0xFF238419), fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF238419)),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}
