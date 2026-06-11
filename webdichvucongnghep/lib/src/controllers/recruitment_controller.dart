import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/recruitment.dart';
import '../services/api_service.dart';

class RecruitmentController extends StateNotifier<AsyncValue<List<Recruitment>>> {
  final ApiService api;

  RecruitmentController({required this.api}) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    try {
      state = const AsyncValue.loading();
      final list = await api.fetchRecruitments();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
