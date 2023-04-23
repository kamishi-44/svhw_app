import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/api_json_repository.dart';

///  api_key.json の読み込みを行うリポジトリの StateNotifier です。
class ApiJsonRepositoryNotifier
    extends StateNotifier<AsyncValue<List<dynamic>>> {
  ApiJsonRepositoryNotifier(this._apiJsonRepository)
      : super(const AsyncValue.loading()) {
    _fetchJsonFile();
  }

  /// api_key.json を読み込むリポジトリー
  final ApiJsonRepositoryImpl _apiJsonRepository;

  /// JSON の読み込み処理の結果を AsyncValue で返します。
  Future<void> _fetchJsonFile() async {
    try {
      final jsonData = await _apiJsonRepository.fetchJsonFile();
      state = AsyncValue.data(jsonData);
    } catch (error) {
      state = AsyncValue.error(
          error, StackTrace.fromString('ファイルの読み込み中にエラーが発生しました。'));
    }
  }

  /// 指定したAPI名のキーを取得します。
  String getKeyByApiName(String apiName) {
    List<dynamic> jsonData = state.value ?? [];

    if (apiName.isEmpty) {
      return '';
    }
    if (jsonData.isEmpty) {
      return '';
    }

    for (Map<String, dynamic> element in jsonData) {
      if (apiName == element['name']) {
        return element['key'];
      }
    }
    return '';
  }
}
