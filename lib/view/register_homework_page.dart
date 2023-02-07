import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/constant/constant.dart';
import 'package:svhw_app/view/page_util.dart';

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
            TextButton(
                onPressed: () {
                  print('科目選択のポップアップを開くよー。');
                },
                child: const Text('${Constant.addSubjectMessage}  +')),
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
