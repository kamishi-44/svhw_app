import 'package:objectbox/objectbox.dart';

/// 宿題の進捗モデルです。
@Entity()
class Progress {
  /// ID
  @Id()
  int id;

  /// 宿題ID
  int homeworkId;

  /// 宿題の総数
  int total;

  /// 現在完了した数
  int completed;

  // コンストラクタ
  /// 先に Homework オブジェクトを生成し、宿題IDが
  /// 裁判されてから呼び出すようにします。
  Progress(
      {this.id = 0,
      required this.homeworkId,
      required this.total,
      required this.completed});
}
