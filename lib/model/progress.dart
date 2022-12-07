import 'package:objectbox/objectbox.dart';

/// 宿題の進捗モデルです。
@Entity()
class Progress {
  /// ID
  int id;

  /// 宿題ID
  int homeworkId;
  /// 宿題の総数
  int total;
  /// 現在完了した数
  int done;

  Progress(
      {this.id = 0,
      required this.homeworkId,
      required this.total,
      required this.done});
}
