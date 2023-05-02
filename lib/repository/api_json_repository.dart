import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:svhw_app/repository/external_json_repository.dart';

/// api_key.json の読み込みを行うリポジトリです。
class ApiJsonRepositoryImpl implements ExternalJsonRepository {
  /// 読み込むJSONのファイルパス
  static const String _filePath = 'json/api_keys.json';

  /// 読み込んだJSONのリスト
  List<dynamic> _jsonData = [];

  @override
  String getValue(String key, [int index = 0]) {
    if (key.isEmpty) {
      return '';
    }

    if (_jsonData.isEmpty) {
      return '';
    }
    return _jsonData[index][key];
  }

  @override
  Future<List<dynamic>> fetchJsonFile() async {
      String jsonString = await rootBundle.loadString(_filePath);
      _jsonData = json.decode(jsonString);
      return _jsonData;
  }

  /// 指定したAPI名のキーを取得します。
  String getKeyByApiName(String apiName) {
    if (apiName.isEmpty) {
      return '';
    }

    if (_jsonData.isEmpty) {
      return '';
    }

    for (Map<String, dynamic> element in _jsonData) {
      if (apiName == element['name']) {
        return element['key'];
      }
    }
    return '';
  }
}
