import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/provider/provider.dart';

import '../../constant/constant.dart';

/// 科目を選択するプルダウンのWidgetです。
class SubjectDropdownButton extends ConsumerWidget {
  const SubjectDropdownButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String selectSubject = ref.watch(AppProvider.selectSubjectProvider);

    return DropdownButton<String>(
      hint: const Text(Constant.dropDownHintMessage),
      value: selectSubject,
      onChanged: (value) =>
      ref.read(AppProvider.selectSubjectProvider.notifier).state = value!,
      items: Constant.subjects.map<DropdownMenuItem<String>>((subject) {
        return DropdownMenuItem(
          value: subject,
          child: Text(subject),
        );
      }).toList(),
    );
  }
}
