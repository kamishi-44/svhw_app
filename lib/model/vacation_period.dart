import 'package:flutter/cupertino.dart';
import 'package:objectbox/objectbox.dart';

/// 夏休みの期間のモデルです。
@Entity()
@immutable
class VacationPeriod {
  /// ID
  final int id;

  /// 夏休みの開始日
  final DateTime startDate;
  /// 夏休みの終了日
  final DateTime endDate;

  /// コンストラクタ
  const VacationPeriod({this.id = 0, required this.startDate, required this.endDate});

  /// オブジェクトのコピーを行います。
  VacationPeriod copyWith({DateTime? startDate, DateTime? endDate}) {
    return VacationPeriod(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate);
  }
}
