library hellotracking;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'dart:io' show Platform;

/// The tracking implementation.
class HelloTrackingServiceImp implements HelloTrackingService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  Future<void> setUserId(String id) async {
    await _analytics.setUserId(id: id);
  }

  @override
  Future<void> trackEventWith(String name, Map<String, String?> extras) async {
    await _analytics.logEvent(
      name: name,
      parameters: extras,
    );
  }

  @override
  Future<void> trackEvent(String name) async {
    await _analytics.logEvent(name: name);
  }

  @override
  Future<void> trackScreen(String name) async {
    await _analytics.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': name,
        'firebase_screen_class': _platformName,
      },
    );
  }

  String _platformName() {
    if (Platform.isAndroid) {
      return "MainActivity";
    } else {
      return "MainViewController";
    }
  }
}

/// The tracking service.
abstract class HelloTrackingService {
  Future<void> setUserId(String id);

  Future<void> trackEventWith(String name, Map<String, String?> extras);

  Future<void> trackEvent(String name);

  Future<void> trackScreen(String name);
}
