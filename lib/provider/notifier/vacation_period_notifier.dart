import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/constant/constant.dart';
import 'package:svhw_app/model/vacation_period.dart';

import '../../main.dart';

/// 夏休みの期間の StateNotifier です。
class VacationPeriodNotifier extends StateNotifier<VacationPeriod> {
  VacationPeriodNotifier()
      : super(VacationPeriod(
            startDate: DateTime.now(),
            // 夏休みの終了日は初期値として8/31とする。
            endDate: DateTime(
                DateTime.now().year, DateTime.august, Constant.thirtyOneDays)));

  ///夏休みの期間のBox
  final vacationPeriodBox = store.box<VacationPeriod>();

  /// 夏休みの期間を設定します。
  /// startDate に開始日、endDate に終了日を設定して呼び出します。
  /// 設定範囲は日までです。
  void setPeriod(DateTime startDate, DateTime endDate) {
    state = VacationPeriod(
        startDate: DateTime(startDate.year, startDate.month, startDate.day),
        endDate: DateTime(endDate.year, endDate.month, endDate.day));
  }

  /// 夏休みの期間を登録します。
  /// 登録内容は夏休みの期間登録画面で入力された内容です。
  void insertPeriod() {
    vacationPeriodBox.put(state);
  }
}
