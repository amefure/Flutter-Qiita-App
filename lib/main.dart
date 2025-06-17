import 'package:flutter/material.dart';
import 'package:qiita_demo_app/repository/QiitaRepository.dart';
import 'package:qiita_demo_app/services/api_service.dart';
import 'package:qiita_demo_app/views/qiita_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final repository = QiitaRepository(apiService: ApiService());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QiitaListScreen(repository: repository),
    );
  }
}