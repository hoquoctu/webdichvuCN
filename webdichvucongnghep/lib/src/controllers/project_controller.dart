import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/project.dart';
import '../services/api_service.dart';

class ProjectController extends StateNotifier<AsyncValue<List<Project>>> {
  final ApiService api;

  ProjectController({required this.api}) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    try {
      state = const AsyncValue.loading();
      final list = await api.fetchProjects();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
