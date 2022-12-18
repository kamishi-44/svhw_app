import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/model/vacation_period.dart';
import 'package:svhw_app/provider/notifier/vacation_period_notifier.dart';

/// アプリ内で使用するプロバイダーを定義するクラスです。
class AppProvider {
  /// 夏休みの期間のプロバイダーです。
  /// 夏休みの開始日と終了日の状態を監視します。
  /// 夏休みの期間登録画面で使用します。
  static final StateNotifierProvider periodProvider =
      StateNotifierProvider<VacationPeriodNotifier, VacationPeriod>(
          (_) => VacationPeriodNotifier());
}
