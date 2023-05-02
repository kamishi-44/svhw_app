import 'package:flutter/material.dart';

import '../my_flutter_app_icons.dart';

/// 天気の種類の Enum です。
enum WeatherType {
  /// 晴れ
  clear(Icon(Icons.wb_sunny, color: Colors.redAccent)),
  /// 曇り
  clouds(Icon(Icons.wb_cloudy, color: Colors.black12)),
  /// 雨
  rain(Icon(MyFlutterApp.umbrella, color: Colors.blue)),
  /// 不正
  invalid(Icon(Icons.error, color: Colors.red));

  /// 天気のアイコン
  final Icon _icon;

  /// コンストラクタ
  const WeatherType(this._icon);

  @override
  String toString() {
    return name.capitalize();
  }

  /// アイコンを返します。
  Icon get icon => _icon;
}

/// String の拡張メソッドです。
/// WeatherType 内で使用する関数のみを実装します。
extension on String {
  /// 最初の文字を大文字にして返します。
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}
