import 'package:flutter/material.dart';

/// アプリ内で使用する共通の定数を保持するクラスです。
/// アプリ内のどこからでもアクセスできます。
class Const {
  /// アプリ全体に適用するテーマを生成します。
  static ThemeData createTheme() {
    return ThemeData(
      primarySwatch: Colors.cyan,
    );
  }
}
