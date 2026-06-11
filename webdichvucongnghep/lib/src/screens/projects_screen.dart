import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';
import '../widgets/project_card.dart';
import '../widgets/footer.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectControllerProvider);
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
                colors: [Color(0xFFE77409), Color(0xFFC85A00)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.center,
            child: Text(
              'DỰ ÁN ĐÃ THỰC HIỆN',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 22 : 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // 2. Projects Grid Area
          Padding(
            padding: EdgeInsets.symmetric(vertical: 48, horizontal: isMobile ? 24 : 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'CÁC CÔNG TRÌNH TIÊU BIỂU',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF238419)),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Khám phá các công trình tháo dỡ, di dời và lắp đặt cơ điện công nghiệp do Thành Thắng triển khai',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                projectsAsync.when(
                  data: (projects) {
                    final int cols = isMobile ? 1 : (isTablet ? 2 : 3);
                    final double screenWidth = MediaQuery.of(context).size.width - (isMobile ? 48 : 128);
                    final double cardWidth = (screenWidth - (cols - 1) * 20) / cols;
                    final double cardHeight = 310;
                    final double aspect = cardWidth / cardHeight;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cols,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: aspect,
                      ),
                      itemCount: projects.length,
                      itemBuilder: (context, index) => ProjectCard(project: projects[index]),
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
