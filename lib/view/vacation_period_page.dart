import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/constant/constant.dart';

/// 夏休みの期間を登録するページです。
/// 夏休み情報が登録されていない場合のみ表示されます。
class VacationPeriodPage extends ConsumerWidget {
  /// コンストラクタ
  const VacationPeriodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('夏休みの期間登録画面'),
      ),
      body: Column(
        children: [
          const Text(Constant.vacationStartDateMessage),
          TextField(
            focusNode: AlwaysDisabledFocusNode(),
            style: const TextStyle(
              fontSize: 20.0,
              height: 1.0,
              color: Colors.black,
            ),
          ),
          const Text(Constant.vacationEndDateMessage),
          TextField(
            focusNode: AlwaysDisabledFocusNode(),
            style: const TextStyle(
              fontSize: 20.0,
              height: 1.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

/// テキストフィールドタップ時にキーボードを表示しないよう制御するクラスです。
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
