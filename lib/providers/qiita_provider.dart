import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_demo_app/repository/qiita_repository.dart';
import 'package:qiita_demo_app/services/api_service.dart';
import 'package:qiita_demo_app/services/mock_api_service.dart';

/// ApiService Provider
final apiServiceProvider = Provider((ref) => ApiService());
/// ApiService Provider
final mockApiServiceProvider = Provider((ref) => MockApiService());

/// QiitaRepository Provider
final qiitaProvider = Provider((ref) {
  final api = ref.watch(mockApiServiceProvider);
  return QiitaRepository(apiService: api);
});