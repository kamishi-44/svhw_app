import 'package:objectbox/objectbox.dart';

/// 夏休みの期間のモデルです。
@Entity()
class VacationPeriod {
  /// ID
  int id;

  /// 夏休みの開始日
  DateTime startDate;
  /// 夏休みの終了日
  DateTime endDate;

  VacationPeriod({this.id = 0, required this.startDate, required this.endDate});
}
