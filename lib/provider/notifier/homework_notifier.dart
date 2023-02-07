import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 登録予定の宿題の StateNotifier です。
class HomeworkNotifier extends StateNotifier<List<Map<String, String>>> {
  HomeworkNotifier(super.state);
}
