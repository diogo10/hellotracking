library hellotracking;

import 'package:firebase_analytics/firebase_analytics.dart';

/// The tracking implementation.
class HelloTrackingServiceImp implements HelloTrackingService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  Future<void> setUserId(String id) async {
    await _analytics.setUserId(id: id);
  }

  @override
  Future<void> trackEvent(String name, dynamic extras) async {
    await FirebaseAnalytics.instance.logEvent(
      name: name, parameters: extras,
    );
  }
}

/// The tracking service.
abstract class HelloTrackingService {
  Future<void> setUserId(String id);
  Future<void> trackEvent(String name, dynamic extras);
}
