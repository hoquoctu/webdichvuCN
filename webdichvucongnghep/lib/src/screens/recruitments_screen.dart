import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';
import '../widgets/footer.dart';

class RecruitmentsScreen extends ConsumerWidget {
  const RecruitmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recAsync = ref.watch(recruitmentControllerProvider);
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
              'CƠ HỘI NGHỀ NGHIỆP',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 22 : 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // 2. Openings list
          Padding(
            padding: EdgeInsets.symmetric(vertical: 48, horizontal: isMobile ? 24 : 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'TUYỂN DỤNG NHÂN SỰ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF238419)),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Gia nhập đội ngũ kỹ thuật Thành Thắng để cùng đồng hành kiến tạo những công trình chất lượng',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                recAsync.when(
                  data: (list) => ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 24),
                      itemBuilder: (context, index) {
                        final r = list[index];
                        return Card(
                          elevation: 2,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.grey.shade200),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        r.title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF333333),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE77409).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        r.salaryRange,
                                        style: const TextStyle(
                                          color: Color(0xFFE77409),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                                    const SizedBox(width: 6),
                                    Text(r.location, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                                    const SizedBox(width: 20),
                                    const Icon(Icons.work_history, size: 14, color: Colors.grey),
                                    const SizedBox(width: 6),
                                    Text(r.experienceLevel, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                const Divider(),
                                const SizedBox(height: 12),
                                const Text('Mô tả công việc:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                const SizedBox(height: 4),
                                Text(r.description, style: TextStyle(color: Colors.grey.shade700, fontSize: 14, height: 1.5)),
                                const SizedBox(height: 16),
                                const Text('Yêu cầu ứng viên:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                const SizedBox(height: 4),
                                Text(r.requirements, style: TextStyle(color: Colors.grey.shade700, fontSize: 14, height: 1.5)),
                                const SizedBox(height: 16),
                                const Text('Quyền lợi được hưởng:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                const SizedBox(height: 4),
                                Text(r.benefits, style: TextStyle(color: Colors.grey.shade700, fontSize: 14, height: 1.5)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Text('Lỗi: $e'),
                ),
                const SizedBox(height: 48),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'ỨNG TUYỂN NGAY',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF238419)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Gửi hồ sơ/CV của bạn về địa chỉ Email: kythuatthanhthangvn@gmail.com\nHoặc liên hệ Hotline tuyển dụng: 0966 533 544 để nộp hồ sơ trực tiếp.',
                        textAlign: TextAlign.center,
                        style: TextStyle(height: 1.6, fontSize: 14),
                      ),
                    ],
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
