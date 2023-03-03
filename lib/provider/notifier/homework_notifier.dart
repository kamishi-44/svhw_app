import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../../model/homework.dart';

/// 登録予定の宿題の StateNotifier です。
class HomeworkNotifier extends StateNotifier<List<Homework>> {
  HomeworkNotifier(): super([]);

  /// 宿題のBox
  final homeworkBox = store.box<Homework>();

  /// 宿題を追加します。
  /// DBへの登録は行わないません。
  /// DBへ登録する場合はinsertHomeworks()を呼び出してください。
  void addHomeWork(Homework homework) {
    state = [...state, homework];
  }

  /// IDを指定して宿題を削除します。
  void removeHomeWork(int homeworkId) {
    state = [
      for (final homework in state)
        if (homework.id != homeworkId) homework,
    ];
  }

  /// HomeworkNotifier で管理している宿題を登録します。
  /// 夏休みの宿題登録画面で選択された宿題です。
  void insertHomeworks() {
    for (var homework in state) {
      homeworkBox.put(homework);
    }
  }
}