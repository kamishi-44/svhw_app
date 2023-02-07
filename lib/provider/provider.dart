import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/model/vacation_period.dart';
import 'package:svhw_app/provider/notifier/homework_notifier.dart';
import 'package:svhw_app/provider/notifier/vacation_period_notifier.dart';

import '../constant/constant.dart';

/// アプリ内で使用するプロバイダーを定義するクラスです。
class AppProvider {
  /// 夏休みの期間のプロバイダーです。
  /// 夏休みの開始日と終了日の状態を監視します。
  /// 夏休みの期間登録画面で使用します。
  static final StateNotifierProvider<VacationPeriodNotifier, VacationPeriod>
      periodProvider =
      StateNotifierProvider<VacationPeriodNotifier, VacationPeriod>((ref) {
    return VacationPeriodNotifier();
  });

  /// 夏休みの期間登録画面の入力フィールド
  /// 夏休みの開始日のプロバイダーです。
  static final AutoDisposeStateProvider<TextEditingController>
      startDateControllerStateProvider = StateProvider.autoDispose((ref) {
    return TextEditingController(
        text: Constant.formatter.format(DateTime.now()));
  });

  /// 夏休みの期間登録画面の入力フィールド
  /// 夏休みの終了日のプロバイダーです。
  static final AutoDisposeStateProvider<TextEditingController>
      endDateControllerStateProvider = StateProvider.autoDispose((ref) {
    return TextEditingController(
        text: Constant.formatter.format(DateTime(
            DateTime.now().year, DateTime.august, Constant.thirtyOneDays)));
  });

  /// 登録する宿題を管理するプロバイダーです。
  static final StateNotifierProvider homeworkProvider =
      StateNotifierProvider((ref) => HomeworkNotifier());
}
