import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';
import '../widgets/news_card.dart';
import '../widgets/footer.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(newsControllerProvider);
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
              'TIN TỨC KỸ THUẬT',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 22 : 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // 2. News Grid Area
          Padding(
            padding: EdgeInsets.symmetric(vertical: 48, horizontal: isMobile ? 24 : 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'BÀI VIẾT MỚI NHẤT',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFE77409)),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Chia sẻ kinh nghiệm lắp máy, sửa chữa cơ điện và tin tức hoạt động tại Thành Thắng',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                newsAsync.when(
                  data: (newsList) {
                    if (isMobile || isTablet) {
                      return Column(
                        children: [
                          for (int i = 0; i < newsList.length; i++) ...[
                            NewsCard(news: newsList[i]),
                            if (i < newsList.length - 1) const SizedBox(height: 20),
                          ]
                        ],
                      );
                    } else {
                      // 2 columns
                      final rows = <Widget>[];
                      for (int i = 0; i < newsList.length; i += 2) {
                        final rowChildren = <Widget>[];
                        rowChildren.add(Expanded(child: NewsCard(news: newsList[i])));
                        if (i + 1 < newsList.length) {
                          rowChildren.add(const SizedBox(width: 20));
                          rowChildren.add(Expanded(child: NewsCard(news: newsList[i + 1])));
                        } else {
                          rowChildren.add(const SizedBox(width: 20));
                          rowChildren.add(const Expanded(child: SizedBox()));
                        }
                        rows.add(Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: rowChildren,
                        ));
                        if (i + 2 < newsList.length) {
                          rows.add(const SizedBox(height: 20));
                        }
                      }
                      return Column(children: rows);
                    }
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
