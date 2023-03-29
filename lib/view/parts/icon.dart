import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// その日の天気予報を取得し、天気に合ったアイコンを
/// 取得できるクラスです。
class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

/// 天気の種類の Enum です。
enum Weather { sunny, cloudy, rainy }

/// Weather のエクステンションです。
extension WeatherExtension on Weather {
  static final icons = {
    Weather.sunny: const Icon(Icons.wb_sunny, color: Colors.redAccent),
    Weather.cloudy: const Icon(Icons.wb_cloudy, color: Colors.white38),
    Weather.rainy: const Icon(Icons.beach_access, color: Colors.blue)
  };
}