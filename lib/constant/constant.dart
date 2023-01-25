import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

/// アプリ内で使用する定数を定義します。
class Constant {
  /// 現在の西暦
  static final int currentYear = DateTime.now().year;

  /// 31日
  static const int thirtyOneDays = 31;

  /// 期間登録画面の横の余白
  static const double vacationPeriodPageVerticalPadding = 50;

  /// メッセージ：夏休みの始まり
  static const String vacationStartDateMessage = '夏休みのはじまり';

  /// メッセージ：夏休みの終わり
  static const String vacationEndDateMessage = '夏休みのおわり';

  /// 本アプリで使用する日付のフォーマット
  static final DateFormat formatter = DateFormat('yyyy/MM/dd', 'ja-JP');

  /// 多言語対応
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// 本アプリで対応する言語
  static const List<Locale> supportedLocales = [
    Locale('ja', ''),
    Locale('en', ''),
  ];
}
