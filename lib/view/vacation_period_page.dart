import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:svhw_app/constant/constant.dart';
import 'package:svhw_app/provider/provider.dart';

/// 夏休みの期間を登録するページです。
/// 夏休み情報が登録されていない場合のみ表示されます。
class VacationPeriodPage extends ConsumerWidget {
  /// コンストラクタ
  const VacationPeriodPage({super.key});

  Future<DateTime?> _selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2024),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('夏休みの期間登録画面'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Constant.vacationPeriodPageVerticalPadding,
            vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(Constant.vacationStartDateMessage),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  height: 60,
                  child: TextField(
                    controller:
                        ref.watch(AppProvider.startDateControllerStateProvider),
                    // タップ時にキーワードを表示しないよう制御
                    focusNode: AlwaysDisabledFocusNode(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      height: 1.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      Future<DateTime?> selectedDate = _selectDate(context);
                      await selectedDate.then((value) {
                        if (value != DateTime.now()) {
                          TextEditingController controller = ref.read(
                              AppProvider.startDateControllerStateProvider);
                          DateFormat formatter =
                          DateFormat('yyyy/MM/dd', 'ja-JP');
                          controller.text = formatter.format(value!);
                        }
                      });
                    },
                    child: const Icon(Icons.calendar_today)),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(Constant.vacationEndDateMessage),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  height: 60,
                  child: TextField(
                    controller:
                        ref.watch(AppProvider.endDateControllerStateProvider),
                    // タップ時にキーワードを表示しないよう制御
                    focusNode: AlwaysDisabledFocusNode(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      height: 1.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      Future<DateTime?> selectedDate = _selectDate(context);
                      await selectedDate.then((value) {
                        if (value != DateTime.now()) {
                          TextEditingController controller = ref.read(
                              AppProvider.endDateControllerStateProvider);
                          DateFormat formatter =
                          DateFormat('yyyy/MM/dd', 'ja-JP');
                          controller.text = formatter.format(value!);
                        }
                      });
                    },
                    child: const Icon(Icons.calendar_today)),
              ],
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
