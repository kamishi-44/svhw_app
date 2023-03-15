import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 現在の宿題の状況を確認できるページです。
/// 宿題が既に登録されている場合は最初に表示されるページになります。
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('宿題の進捗確認画面'),
      ),
      body: const Center(
        child: Text('ホーム画面だよー。'),
      ),
    );
  }
}
