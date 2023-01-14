import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/constant/constant.dart';
import 'package:svhw_app/provider/provider.dart';

/// 夏休みの期間を登録するページです。
/// 夏休み情報が登録されていない場合のみ表示されます。
class VacationPeriodPage extends ConsumerWidget {
  /// コンストラクタ
  const VacationPeriodPage({super.key});

  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('夏休みの期間登録画面'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constant.vacationPeriodPageVerticalPadding, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(Constant.vacationStartDateMessage),
            TextField(
              controller: ref.watch(AppProvider.startDateControllerStateProvider),
              // タップ時にキーワードを表示しないよう制御
              focusNode: AlwaysDisabledFocusNode(),
              onTap: () => _selectDate(context, ref),
              style: const TextStyle(
                fontSize: 20.0,
                height: 1.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(Constant.vacationEndDateMessage),
            TextField(
              controller: ref.watch(AppProvider.endDateControllerStateProvider),
              // タップ時にキーワードを表示しないよう制御
              focusNode: AlwaysDisabledFocusNode(),
              style: const TextStyle(
                fontSize: 20.0,
                height: 1.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// テキストフィールドタップ時にキーボードを表示しないよう制御するクラスです。
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
