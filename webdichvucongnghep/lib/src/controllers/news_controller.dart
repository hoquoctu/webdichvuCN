import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/news.dart';
import '../services/api_service.dart';

class NewsController extends StateNotifier<AsyncValue<List<News>>> {
  final ApiService api;

  NewsController({required this.api}) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    try {
      state = const AsyncValue.loading();
      final list = await api.fetchNews();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
