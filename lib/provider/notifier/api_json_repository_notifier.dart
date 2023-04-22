import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/api_json_repository.dart';

///  api_key.json の読み込みを行うリポジトリの StateNotifier です。
class ApiJsonRepositoryNotifier
    extends StateNotifier<Provider<ApiJsonRepositoryImpl>> {
  ApiJsonRepositoryNotifier()
      : super(Provider<ApiJsonRepositoryImpl>((_) => ApiJsonRepositoryImpl()));

  /// JSON の読み込み処理の結果を AsyncValue で返します。
  FutureProvider<void> fetchJsonFile() {
    return FutureProvider<void>((ref) async {
      final apiJsonRepository = ref.read(state);
      apiJsonRepository.fetchJsonFile();
    });
  }

  /// 指定したAPI名のキーを取得します。
  String getKeyByApiName(WidgetRef ref, String apiName) {
    return ref.read(state).getKeyByApiName(apiName);
  }
}
