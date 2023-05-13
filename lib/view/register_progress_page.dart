import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constant/constant.dart';

/// その日の宿題の進捗を登録する画面です。
class RegisterProgressPage extends ConsumerWidget {
  const RegisterProgressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Constant.registerProgressPageTitle),
        ),
        body: const Text('進捗の登録画面です'));
  }
}
