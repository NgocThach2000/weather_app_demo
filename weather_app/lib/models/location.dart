import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longtitude;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Định vị tắt!!!');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Quyền truy cập bị từ chối!!!');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Quyền vị trí bị từ chối vĩnh viễn, chúng tôi không thể yêu cầu quyền!!!');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longtitude = position.longitude;
      print(latitude);
      print(longtitude);
    } catch (error) {
      print('Đã có lỗi: $error!!!');
    }
  }
}
