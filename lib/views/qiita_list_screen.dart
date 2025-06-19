import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiita_demo_app/models/qiita_item.dart';
import 'package:qiita_demo_app/models/query.dart';
import 'package:qiita_demo_app/providers/qiita_provider.dart';

/// 記事取得 Provider
final qiitaItemsProvider = FutureProvider.autoDispose.family<List<QiitaItem>, Query>((ref, query) async {
  final repository = ref.watch(qiitaProvider);
  return repository.fetchLatestItems(page: query.page, perPage: query.perPage);
});

class QiitaListScreen extends ConsumerWidget {
  const QiitaListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = Query(page: 1, perPage: 10);
    final asyncItems = ref.watch(qiitaItemsProvider(query));

    return Scaffold(
      appBar: AppBar(title: const Text('Qiita記事一覧')),
      body: asyncItems.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('エラー: $e')),
        data: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, index) {
            final item = items[index];
            return ListTile(
              title: Text(item.title),
              subtitle: Text('投稿者: ${item.userId}'),
            );
          },
        ),
      ),
    );
  }
}
