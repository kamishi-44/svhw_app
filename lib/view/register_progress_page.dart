import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// その日の宿題の進捗を登録する画面です。
class RegisterProgressPage extends ConsumerWidget {
  const RegisterProgressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('宿題の進捗登録画面'),
        ),
        body: const Text('進捗の登録画面です'));
  }
}
