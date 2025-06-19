import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qiita_demo_app/services/api_service.dart';

class MockApiService extends ApiService {
  @override
  Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    /// ダミーJSON データ（Qiita の記事リスト形式）
    /// titleに日本語を入れるとエラーになるので注意
    final mockItems = [
      {
        "id": "1",
        "title": "HTTP",
        "url": "https://appdev-room.com/",
        "user": {"id": "user_123"},
      },
      {
        "id": "2",
        "title": "Riverpod",
        "url": "https://appdev-room.com/",
        "user": {"id": "user_456"},
      },
    ];

    // JSON文字列に変換
   final json = jsonEncode(mockItems);

    // モックレスポンスを返す
    return http.Response(json, 200);
  }
}
