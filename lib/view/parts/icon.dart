import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svhw_app/provider/provider.dart';

import '../../constant//my_flutter_app_icons.dart';

/// その日の天気予報を取得し、天気に合ったアイコンを
/// 取得できるクラスです。
class WeatherIcon extends ConsumerWidget {
  const WeatherIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(AppProvider.locationProvider).when(
        data: (position) {
          final apiJsonNotifier =
              ref.watch(AppProvider.apiJsonNotifierProvider.notifier);

          return ref.watch(AppProvider.apiJsonNotifierProvider).when(
              data: (_) {
                String apiKey = apiJsonNotifier.getKeyByApiName('Weather');
                return const Icon(Icons.wb_sunny, color: Colors.redAccent);
              },
              error: (_, __) => const Icon(Icons.error),
              loading: () => const CircularProgressIndicator());
        },
        error: (_, __) => const Icon(Icons.error),
        loading: () => const CircularProgressIndicator());
  }
}

/// 天気の種類の Enum です。
enum _Weather { sunny, cloudy, rainy }

/// Weather のエクステンションです。
extension on _Weather {
  static final icons = {
    _Weather.sunny: const Icon(Icons.wb_sunny, color: Colors.redAccent),
    _Weather.cloudy: const Icon(Icons.wb_cloudy, color: Colors.white38),
    _Weather.rainy: const Icon(MyFlutterApp.umbrella, color: Colors.blue)
  };

  /// 天気に対応するアイコンを返します。
  Icon get icon => icons[this]!;
}
