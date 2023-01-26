import 'package:flutter/cupertino.dart';

/// ビュー作成時の共通処理を実装するクラスです。
class PageUtil {
  /// SizedBox を返します。
  /// デフォルトのサイズは 100 でサイズを指定したい場合は引数に指定してください。
  static SizedBox getSizedBox({double height = 100}) {
    return SizedBox(
      height: height,
    );
  }
}
