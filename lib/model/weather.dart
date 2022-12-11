import 'package:objectbox/objectbox.dart';

/// 天気モデルです。
@Entity()
class Weather {
  /// ID
  int id;

  /// 天気
  int weatherType;

  /// 日付
  DateTime date;

  Weather({this.id = 0, required this.weatherType, required this.date});
}

/// 天気の enum です。
/// 晴れ、曇り、雨の３種類があります。
enum WeatherType { sunny, cloudy, rainy }

extension WeatherTypeExtension on Weather {
  /// 種別を表す数値
  static final intValues = {
    WeatherType.sunny: 1,
    WeatherType.cloudy: 2,
    WeatherType.rainy: 3,
  };

  /// 種別に対応する数値を取得します。
  int get statusInt => intValues[this]!;
}