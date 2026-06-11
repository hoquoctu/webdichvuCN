import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/company.dart';
import '../services/api_service.dart';

class CompanyController extends StateNotifier<AsyncValue<CompanyInfo>> {
  final ApiService api;

  CompanyController({required this.api}) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    try {
      state = const AsyncValue.loading();
      final info = await api.fetchCompanyInfo();
      state = AsyncValue.data(info);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
