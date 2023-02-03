import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 夏休みの宿題を登録する画面です。
/// 夏休みの情報を登録するときにだけ遷移できる画面で
/// 夏休みの期間登録画面から遷移します。
class RegisterHomeworkPage extends ConsumerWidget {
  const RegisterHomeworkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('夏休みの宿題登録画面'),
      ),
    );
  }
}
