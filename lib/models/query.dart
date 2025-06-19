
/// familyの引数として渡す用のクラス
/// 比較できるように実装する
class Query {
  final int page;
  final int perPage;

  const Query({required this.page, required this.perPage});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Query &&
              runtimeType == other.runtimeType &&
              page == other.page &&
              perPage == other.perPage;

  @override
  int get hashCode => page.hashCode ^ perPage.hashCode;
}