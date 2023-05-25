import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../../model/progress.dart';
import '../../objectbox.g.dart';

/// 登録予定宿題の量の StateNotifier です。
class ProgressNotifier extends StateNotifier<List<Progress>> {
  ProgressNotifier(): super([]);

  final Box<Progress> progressBox = store.box<Progress>();

  /// 宿題の量を追加します。
  /// DBへの登録は行いません。
  void addProgress(Progress progress) {
    state = [...state, progress];
  }

  /// IDを指定して宿題の量を削除します。
  void removeProgress(int progressId) {
    state = [
      for (final progress in state)
        if (progress.id != progressId) progress,
    ];
  }

  /// ProgressNotifier で管理している宿題の量を登録します。
  /// 夏休みの宿題登録画面で選択された宿題の量です。
  void insertProgress() {
    for (var progress in state) {
      progressBox.put(progress);
    }
  }
}