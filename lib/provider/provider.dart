import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/model/homework.dart';
import 'package:svhw_app/model/vacation_period.dart';
import 'package:svhw_app/provider/notifier/api_json_repository_notifier.dart';
import 'package:svhw_app/provider/notifier/homework_notifier.dart';
import 'package:svhw_app/provider/notifier/vacation_period_notifier.dart';
import 'package:svhw_app/repository/api_json_repository.dart';

import '../constant/constant.dart';

/// アプリ内で使用するプロバイダーを定義するクラスです。
class AppProvider {
  /// 夏休みの期間のプロバイダーです。
  /// 夏休みの開始日と終了日の状態を監視します。
  /// 夏休みの期間登録画面で使用します。
  static final periodProvider =
      StateNotifierProvider<VacationPeriodNotifier, VacationPeriod>((ref) {
    return VacationPeriodNotifier();
  });

  /// 夏休みの期間登録画面の入力フィールド
  /// 夏休みの開始日のプロバイダーです。
  static final startDateControllerStateProvider =
      StateProvider.autoDispose((ref) {
    return TextEditingController(
        text: Constant.formatter.format(DateTime.now()));
  });

  /// 夏休みの期間登録画面の入力フィールド
  /// 夏休みの終了日のプロバイダーです。
  static final endDateControllerStateProvider =
      StateProvider.autoDispose((ref) {
    return TextEditingController(
        text: Constant.formatter.format(DateTime(
            DateTime.now().year, DateTime.august, Constant.thirtyOneDays)));
  });

  /// 登録する宿題を管理するプロバイダーです。
  static final homeworksProvider =
      StateNotifierProvider<HomeworkNotifier, List<Homework>>(
          (ref) => HomeworkNotifier());

  /// 科目選択プルダウンの選択値を管理するプロバイダーです。
  static final selectSubjectProvider =
      StateProvider.autoDispose((ref) => Constant.dropDownItems[0]);

  static final selectTypeProvider =
      StateProvider.autoDispose((ref) => HomeworkType.text);

  /// api_key.json の読み込みを行うリポジトリのプロバイダーです。
  static final _apiJsonRepositoryProvider =
      Provider<ApiJsonRepositoryImpl>((ref) {
    return ApiJsonRepositoryImpl();
  });

  /// api_key.json の読み込みを管理するのプロバイダーです。
  static final apiJsonNotifierProvider = StateNotifierProvider<
          ApiJsonRepositoryNotifier, AsyncValue<List<dynamic>>>(
      (ref) =>
          ApiJsonRepositoryNotifier(ref.watch(_apiJsonRepositoryProvider)));
}
