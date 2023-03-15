import 'package:svhw_app/main.dart';
import 'package:svhw_app/model/vacation_period.dart';

import '../model/homework.dart';
import '../objectbox.g.dart';

/// 宿題の進捗確認画面で必要なデータを取得する
/// リポジトリインターフェースです。
abstract class HomePageRepository {
  /// 登録されている夏休みの期間を返します。
  /// 1件しか登録されない想定なのでListではなく
  /// VacationPeriod そのものを返します。
  VacationPeriod vacationPeriod();

  /// 登録されている夏休みの宿題一覧を返します。
  List<Homework> registeredHomework();
}

class HomePageRepositoryImpl implements HomePageRepository {
  @override
  VacationPeriod vacationPeriod() {
    final Box<VacationPeriod> vacationPeriodBox = store.box<VacationPeriod>();
    final List<VacationPeriod> vacationPeriods = vacationPeriodBox.getAll();
    return vacationPeriods.first;
  }

  @override
  List<Homework> registeredHomework() {
    final Box<Homework> homeworkBox = store.box<Homework>();
    final List<Homework> homeworks = homeworkBox.getAll();
    return homeworks;
  }
}
