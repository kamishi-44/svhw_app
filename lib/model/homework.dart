import 'package:objectbox/objectbox.dart';

/// 宿題の内容モデルです。
@Entity()
class Homework {
  /// ID
  @Id()
  int id;

  /// 科目
  String subject;
  /// 宿題の種別(テキスト or プリント)
  int homeworkType;

  Homework({this.id = 0, required this.subject, required this.homeworkType});
}

/// 宿題の種別を表す enum です。
/// テキスト と プリント の２種類があります。
enum HomeworkType { text, print }

extension HomeworkTypeExtension on HomeworkType {
  /// 種別を表す数値
  static final intValues = {
    HomeworkType.text: 1,
    HomeworkType.print: 2,
  };

  /// 種別に対応する数値を取得します。
  int get statusInt => intValues[this]!;
}
