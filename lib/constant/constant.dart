import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

/// アプリ内で使用する定数を定義します。
class Constant {
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

  /// メッセージ：次へ
  static const String nextMessage = '次へ';

  /// メッセージ：登録
  static const String registerMessage = '登録';

  /// メッセージ：宿題の追加
  static const String addSubjectMessage = '宿題の追加';

  /// メッセージ：追加する宿題を選択します。
  static const String selectHomeworkMessage = '追加する宿題を選択します。';

  /// 本アプリで使用する日付のフォーマット
  static final DateFormat formatter = DateFormat('yyyy/MM/dd', 'ja-JP');

  /// 本アプリで選択できる宿題の教科
  static final List<String> subjects = [
    '国語',
    '算数',
    '英語',
    '理科',
    '社会',
  ];
}
