import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

/// 天気情報を取得するリポジトリインターフェースです。
abstract class WeatherRepository {
  /// 現在位置をもとに現在の天気情報を取得します。
  ///
  /// 現在位置は事前に [LocationRepositoryImpl#getCurrentPosition()] で
  /// 取得しておく必要があります。
  Weather getCurrentWeatherByLocation(Position currentPosition);
}

/// 天気情報を取得するリポジトリです。
class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Weather getCurrentWeatherByLocation(Position currentPosition) {
    // TODO: implement getCurrentWeatherByLocation
    throw UnimplementedError();
  }
}