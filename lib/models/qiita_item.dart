
/// Qiita記事マッピングアイテム
class QiitaItem {
  final String id;
  final String title;
  final String url;
  final String userId;

  QiitaItem({
    required this.id,
    required this.title,
    required this.url,
    required this.userId,
  });

  /// Map<String, dynamic>で取得したJSONをマッピングする
  factory QiitaItem.fromJson(Map<String, dynamic> json) {
    return QiitaItem(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      userId: json['user']['id'],
    );
  }
}