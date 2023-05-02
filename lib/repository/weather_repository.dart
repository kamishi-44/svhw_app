import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:svhw_app/constant/enum/weather_type.dart';
import 'package:weather/weather.dart';

/// 天気情報を取得するリポジトリインターフェースです。
abstract class WeatherRepository {
  /// 現在位置をもとに現在の天気情報を取得します。
  /// 返す天気は晴れ(Clear), 曇り(Clouds), 雨(Rain)のいずれかです。
  ///
  /// 現在位置は事前に [LocationRepositoryImpl#getCurrentPosition()] で
  /// 取得しておく必要があります。
  Future<WeatherType> getCurrentWeatherByLocation(Position currentPosition);
}

/// 天気情報を取得するリポジトリです。
class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(this._apiKey);

  /// API キー
  final String _apiKey;

  @override
  Future<WeatherType> getCurrentWeatherByLocation(Position currentPosition) async {
    // 現在地の取得
    WeatherFactory weatherFactory = WeatherFactory(_apiKey);
    Weather weather = await weatherFactory.currentWeatherByLocation(
        currentPosition.latitude, currentPosition.longitude);
    // メインの天気が取れる(Clear, .Rain, Clouds など)
    String main = weather.weatherMain ?? '';
    return main.toWeatherType();
  }
}

/// String の拡張関数です。
/// WeatherRepositoryImpl 内で使用する関数のみを実装します。
extension on String {
  /// WeatherType に変換します。
  WeatherType toWeatherType() {
    if (isEmpty) {
      return WeatherType.invalid;
    }
    for (WeatherType type in WeatherType.values) {
      if (this == type.toString()) {
        return type;
      }
    }
    /// 晴れ、曇り、雨 以外は一旦不正とする
    /// 雷や強風(台風)を表す天気が返ってくるならEnumを追加して対応する
    return WeatherType.invalid;
  }
}
