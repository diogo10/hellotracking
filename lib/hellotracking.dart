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
    await _analytics.setCurrentScreen(screenName: name);
  }

  @override
  Future<void> disableTracking() async {
     await _analytics.setAnalyticsCollectionEnabled(false);
  }

  @override
  Future<void> enableTracking() async {
    await _analytics.setAnalyticsCollectionEnabled(true);
  }
}

/// The tracking service.
abstract class HelloTrackingService {
  Future<void> setUserId(String id);
  Future<void> disableTracking();
  Future<void> enableTracking();
  Future<void> trackEventWith(String name, Map<String, String?> extras);
  Future<void> trackEvent(String name);
  Future<void> trackScreen(String name);
}
