import 'package:objectbox/objectbox.dart';

/// 宿題の内容モデルです。
@Entity()
class Homework {
  /// ID
  int id;

  /// 科目
  String subject;
  /// 宿題の種別(テキスト or プリント)
  HomeworkType type;

  Homework({this.id = 0, required this.subject, required this.type});
}

/// 宿題の種別を表す enum です。
/// テキスト と プリント の２種類があります。
enum HomeworkType { text, print }
