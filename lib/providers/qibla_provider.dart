import 'package:flutter/foundation.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class QiblaProvider with ChangeNotifier {
  Stream<QiblahDirection>? get qiblaStream => FlutterQiblah.qiblahStream;

  bool _isAligned = false;
  double _distanceToMecca = 0;
  Position? _currentPosition;

  bool get isAligned => _isAligned;
  double get distanceToMecca => _distanceToMecca;
  Position? get currentPosition => _currentPosition;

  Future<bool> checkLocationStatus() async {
    final status = await FlutterQiblah.checkLocationStatus();
    return status.enabled;
  }

  Future<void> requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      _currentPosition = await Geolocator.getCurrentPosition();
      if (_currentPosition != null) {
        calculateDistance(_currentPosition!.latitude, _currentPosition!.longitude);
      }
    }
    notifyListeners();
  }

  void checkAlignment(double direction, double offset) {
    // If difference is less than 5 degrees, consider it aligned
    final double diff = (direction - offset).abs();
    final bool nowAligned = diff < 5 || diff > 355;

    if (nowAligned && !_isAligned) {
      _isAligned = true;
      Vibrate.feedback(FeedbackType.medium);
      notifyListeners();
    } else if (!nowAligned && _isAligned) {
      _isAligned = false;
      notifyListeners();
    }
  }

  Future<void> calculateDistance(double currentLat, double currentLong) async {
    const double meccaLat = 21.422487;
    const double meccaLng = 39.826206;

    _distanceToMecca = Geolocator.distanceBetween(
      currentLat,
      currentLong,
      meccaLat,
      meccaLng,
    ) / 1000; // Convert to km
    notifyListeners();
  }
}
