import 'package:objectbox/objectbox.dart';

import '../constant/constant.dart';

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

  /// 表示用(文字列)の開始日を返します。
  String get dispStartDate => Constant.formatter.format(startDate);

  /// 表示用(文字列)の終了日を返します。
  String get dispEndDate => Constant.formatter.format(endDate);

  /// オブジェクトのコピーを行います。
  VacationPeriod copyWith({DateTime? startDate, DateTime? endDate}) {
    return VacationPeriod(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate);
  }
}
