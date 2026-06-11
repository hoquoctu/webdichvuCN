import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/service.dart';
import '../services/api_service.dart';

class ServiceController extends StateNotifier<AsyncValue<List<Service>>> {
  final ApiService api;

  ServiceController({required this.api}) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    try {
      state = const AsyncValue.loading();
      final list = await api.fetchServices();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
