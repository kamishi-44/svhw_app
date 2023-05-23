import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/provider/provider.dart';

import '../../../../../constant/constant.dart';
import '../../model/homework.dart';

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
        }).toList());
  }
}

/// 宿題の種別を選択するプルダウンのWidgetです。
class HomeworkTypeDropdownButton extends ConsumerWidget {
  const HomeworkTypeDropdownButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeworkType selectType = ref.watch(AppProvider.selectTypeProvider);

    return DropdownButton<HomeworkType>(
      value: selectType,
      onChanged: (type) =>
          ref.read(AppProvider.selectTypeProvider.notifier).state = type!,
      items: HomeworkType.values.map<DropdownMenuItem<HomeworkType>>((type) {
        return DropdownMenuItem(
          value: type,
          child: Text(type.typeValue),
        );
      }).toList(),
    );
  }
}
