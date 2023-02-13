import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/constant/constant.dart';
import 'package:svhw_app/provider/provider.dart';
import 'package:svhw_app/view/page_util.dart';

import '../model/homework.dart';

/// 夏休みの宿題を登録する画面です。
/// 夏休みの情報を登録するときにだけ遷移できる画面で
/// 夏休みの期間登録画面から遷移します。
class RegisterHomeworkPage extends ConsumerWidget {
  const RegisterHomeworkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, HomeworkType>> homeworks =
        ref.watch(AppProvider.homeworkProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('夏休みの宿題登録画面'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Constant.vacationPeriodPageVerticalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 空のリストを用意(プロバイダーがいいか)
            // 宿題追加で追加された教科の名称を一覧で表示していく
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeworks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text('$homeworks[index]');
                }),
            const _SelectHomeworkDialogButton(),
            PageUtil.getSizedBox(),
            Container(
              margin: const EdgeInsets.only(left: 250.0),
              child: ElevatedButton(
                  // 登録タップ時に期間のデータ登録
                  onPressed: () {
                    print('夏休みの期間と宿題を登録するよー。');
                  },
                  child: const Text(Constant.registerMessage)),
            ),
          ],
        ),
      ),
    );
  }
}

/// 追加する宿題を選択するダイアログを開くボタンです。
class _SelectHomeworkDialogButton extends ConsumerWidget {
  const _SelectHomeworkDialogButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, HomeworkType>> homework =
        ref.watch(AppProvider.homeworkProvider);

    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(Constant.selectHomeworkMessage),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text(
        '${Constant.addSubjectMessage}  +',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
