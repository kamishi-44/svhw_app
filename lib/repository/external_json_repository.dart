/// 外部ファイルのJSONから値を取得するリポジトリインターフェースです。
abstract class ExternalJsonRepository {
  /// JSONファイルの内容を取得します。
  Future<List<dynamic>> fetchJsonFile();
  /// 指定したキーの値を取得します。
  /// 読み込むJSONが配列形式の場合はインデックスを指定して
  /// 指定行を読み込むこともできます。
  String getValue(String key, [int index = 0]);
}