import 'package:flutter/cupertino.dart';
import 'package:objectbox/objectbox.dart';

/// 夏休みの期間のモデルです
@Entity()
class VacationPeriod {
  /// ID
  @Id()
  int id;

  /// 夏休みの開始日
  DateTime startDate;

  /// 夏休みの終了日
  DateTime endDate;

  /// コンストラクタ
  VacationPeriod({this.id = 0, required this.startDate, required this.endDate});

  /// オブジェクトのコピーを行います。
  VacationPeriod copyWith({DateTime? startDate, DateTime? endDate}) {
    return VacationPeriod(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate);
  }
}
