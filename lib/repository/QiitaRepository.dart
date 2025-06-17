import 'dart:async';
import 'dart:convert';
import '../services/api_service.dart';
import '../models/qiita_item.dart';

/// QiitaAPI リポジトリ
class QiitaRepository {

  /// APIサービス(DI)
  final ApiService apiService;

  QiitaRepository({required this.apiService});

  /// 最新の記事を取得する
  Future<List<QiitaItem>> fetchLatestItems(
      {int page = 1, int perPage = 10}) async {
    try {
      final response = await apiService.get(
          '/items?page=$page&per_page=$perPage');
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((e) => QiitaItem.fromJson(e)).toList();
      } else {
        throw Exception('通信失敗: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('例外: $e');
    }
  }
}