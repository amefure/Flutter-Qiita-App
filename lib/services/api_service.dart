import 'package:http/http.dart' as http;

/// Qiitaサービスクラス
class ApiService {
  /// Qiitaベース
  final String baseUrl = 'https://qiita.com/api/v2';

  /// 取得
  Future<http.Response> get(String endpoint, {Map<String, String>? headers}) {
    final url = Uri.parse('$baseUrl$endpoint');
    return http
        .get(url, headers: headers)
        .timeout(Duration(seconds: 5));
  }
}
