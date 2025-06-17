import 'package:flutter/material.dart';
import 'package:qiita_demo_app/models/qiita_item.dart';
import 'package:qiita_demo_app/repository/QiitaRepository.dart';

class QiitaListScreen extends StatelessWidget {
  final QiitaRepository repository;

  const QiitaListScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Qiita記事一覧')),
      body: FutureBuilder<List<QiitaItem>>(
        future: repository.fetchLatestItems(),
        builder: (context, snapshot) {

          // 通信中
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // エラーが出たら表示
          if (snapshot.hasError) {
            return Center(child: Text('エラー: ${snapshot.error}'));
          }

          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.title),
                subtitle: Text('投稿者: ${item.userId}'),
                onTap: () {
                  // WebViewやブラウザで開くなど
                },
              );
            },
          );
        },
      ),
    );
  }
}
