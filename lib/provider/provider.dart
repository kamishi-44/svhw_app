import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:svhw_app/model/homework.dart';
import 'package:svhw_app/model/vacation_period.dart';
import 'package:svhw_app/provider/notifier/homework_notifier.dart';
import 'package:svhw_app/provider/notifier/progress_notifier.dart';
import 'package:svhw_app/provider/notifier/vacation_period_notifier.dart';
import 'package:svhw_app/repository/api_json_repository.dart';
import 'package:svhw_app/repository/location_repository.dart';
import 'package:svhw_app/repository/weather_repository.dart';

import '../constant/constant.dart';
import '../constant/enum/weather_type.dart';
import '../model/progress.dart';

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
        text: Constant.slashSeparateFormat.format(DateTime.now()));
  });

  /// 夏休みの期間登録画面の入力フィールド
  /// 夏休みの終了日のプロバイダーです。
  static final endDateControllerStateProvider =
      StateProvider.autoDispose((ref) {
    return TextEditingController(
        text: Constant.slashSeparateFormat.format(DateTime(
            DateTime.now().year, DateTime.august, Constant.thirtyOneDays)));
  });

  /// 登録する宿題を管理するプロバイダーです。
  static final homeworksProvider =
      StateNotifierProvider<HomeworkNotifier, List<Homework>>(
          (ref) => HomeworkNotifier());

  /// 登録する宿題の量を管理するプロバイダーです。
  /// 宿題の内容登録画面でのみ使用します。
  /// 宿題登録後の日々の進捗登録では使用しないでください。
  static final progressProvider =
      StateNotifierProvider<ProgressNotifier, List<Progress>>(
          (ref) => ProgressNotifier());

  /// 夏休みの期間登録画面の入力フィールド
  /// 夏休みの開始日のプロバイダーです。
  static final amountHomeworkControllerStateProvider =
      StateProvider.autoDispose((ref) {
    return TextEditingController(text: '');
  });

  /// 科目選択プルダウンの選択値を管理するプロバイダーです。
  static final selectSubjectProvider =
      StateProvider.autoDispose((ref) => Constant.dropDownItems[0]);

  /// 宿題の種類を管理するプロバイダーです。
  static final selectTypeProvider =
      StateProvider.autoDispose((ref) => HomeworkType.text);

  /// 現在地の天気情報を監視するプロバイダーです。
  static final weatherProvider = FutureProvider<WeatherType>((ref) async {
    LocationRepositoryImpl locationRepository = LocationRepositoryImpl();
    final Position currentPosition =
        await locationRepository.getCurrentPosition();
    currentPosition.longitude;

    final ApiJsonRepositoryImpl apiJsonRepository = ApiJsonRepositoryImpl();
    await apiJsonRepository.fetchJsonFile();
    String apiKey = apiJsonRepository.getKeyByApiName('Weather');

    WeatherRepository weatherRepository = WeatherRepositoryImpl(apiKey);
    return weatherRepository.getCurrentWeatherByLocation(currentPosition);
  });

  /// ホーム画面での表示ページを監視するプロバイダーです。
  static final selectPageProvider = StateProvider<int>((_) => 0);
}
