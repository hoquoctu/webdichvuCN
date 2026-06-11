import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/company.dart';
import '../models/service.dart';
import '../models/project.dart';
import '../models/news.dart';
import '../models/recruitment.dart';
import '../services/api_service.dart';
import '../controllers/service_controller.dart';
import '../controllers/project_controller.dart';
import '../controllers/news_controller.dart';
import '../controllers/recruitment_controller.dart';
import '../controllers/company_controller.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

// Controllers (StateNotifiers)
final companyControllerProvider = StateNotifierProvider<CompanyController, AsyncValue<CompanyInfo>>(
  (ref) => CompanyController(api: ref.read(apiServiceProvider)),
);

final serviceControllerProvider = StateNotifierProvider<ServiceController, AsyncValue<List<Service>>>(
  (ref) => ServiceController(api: ref.read(apiServiceProvider)),
);

final projectControllerProvider = StateNotifierProvider<ProjectController, AsyncValue<List<Project>>>(
  (ref) => ProjectController(api: ref.read(apiServiceProvider)),
);

final newsControllerProvider = StateNotifierProvider<NewsController, AsyncValue<List<News>>>(
  (ref) => NewsController(api: ref.read(apiServiceProvider)),
);

final recruitmentControllerProvider = StateNotifierProvider<RecruitmentController, AsyncValue<List<Recruitment>>>(
  (ref) => RecruitmentController(api: ref.read(apiServiceProvider)),
);
