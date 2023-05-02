import 'package:geolocator/geolocator.dart';

/// 位置情報を取得するリポジトリインターフェース
/// 取得する位置情報は軽度と緯度を指します。
abstract class LocationRepository {
  /// 現在位置を取得します。
  /// 端末の現在位置取得が許可されなかった場合はエラーを返します。
  Future<Position> getCurrentPosition();
}

/// 位置情報を取得するリポジトリです。
/// Geolocator を使用して現在位置(緯度経度)を取得します。
class LocationRepositoryImpl implements LocationRepository {
  /// 位置情報が有効でなかった場合に設定される Future
  late final Future<Position> _errorFuture;

  @override
  Future<Position> getCurrentPosition() async {
    if(!await _isEnabledLocationService()) {
      return _errorFuture;
    }
    return await Geolocator.getCurrentPosition();
  }

  /// 端末の位置情報サービスが有効の場合 true を返します。
  /// 有効でない場合は _errorFuture に有効でないメッセージを
  /// 設定した Future を設定します。
  Future<bool> _isEnabledLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _errorFuture = Future.error('Location services are disabled.');
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    // ユーザーに位置情報を許可してもらうよう促す
    permission = await Geolocator.requestPermission();
    switch (permission) {
      case LocationPermission.denied:
        _errorFuture = Future.error('Location permissions are denied');
        return false;
      case LocationPermission.deniedForever:
        _errorFuture = Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
        return false;
      default:
        return true;
    }
  }
}