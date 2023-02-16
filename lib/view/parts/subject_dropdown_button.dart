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
      value: selectSubject,
      onChanged: (value) =>
      ref.read(AppProvider.selectSubjectProvider.notifier).state = value!,
      items: Constant.dropDownItems.map<DropdownMenuItem<String>>((subject) {
        return DropdownMenuItem(
          value: subject,
          child: Text(subject),
        );
      }).toList(),
    );
  }

  /// ドロップダウンに表示するアイテムを取得します。
  List<String> _getDropDownItems() {
    List<String> items = Constant.subjects;
    items.insert(0, Constant.dropDownHintMessage);
    return items;
  }
}
