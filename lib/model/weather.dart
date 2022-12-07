import 'package:objectbox/objectbox.dart';

/// 天気モデルです。
@Entity()
class Weather {
  /// ID
  int id;

  /// 天気
  WeatherType weather;
  /// 日付
  DateTime date;

  Weather({this.id = 0, required this.weather, required this.date});
}

/// 天気の enum です。
/// 晴れ、曇り、雨の３種類があります。
enum WeatherType { sunny, cloudy, rainy}