import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/homework.dart';

/// 登録予定の宿題の StateNotifier です。
class HomeworkNotifier extends StateNotifier<List<Map<String, HomeworkType>>> {
  HomeworkNotifier(): super([]);
}