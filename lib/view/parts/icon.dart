import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/constant/enum/weather_type.dart';
import 'package:svhw_app/provider/provider.dart';

/// その日の天気予報を取得し、天気に合ったアイコンを
/// 取得できるクラスです。
class WeatherIcon extends ConsumerWidget {
  const WeatherIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(AppProvider.weatherProvider).when(
        data: (mainWeather) {
          Icon weatherIcon = WeatherType.invalid.icon;
          switch (mainWeather) {
            case WeatherType.clear:
              weatherIcon = WeatherType.clear.icon;
              break;
            case WeatherType.clouds:
              weatherIcon = WeatherType.clouds.icon;
              break;
            case WeatherType.rain:
              weatherIcon = WeatherType.rain.icon;
              break;
            default:
              weatherIcon = WeatherType.invalid.icon;
              break;
          }
          return weatherIcon;
        },
        error: (_, __) => const Icon(Icons.error),
        loading: () => const SizedBox(
            height: 16, width: 16, child: CircularProgressIndicator()));
  }
}
