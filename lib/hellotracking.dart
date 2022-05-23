library hellotracking;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

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
      name: name, parameters: extras,
    );
  }

  @override
  Future<void> trackEvent(String name) async {
    await _analytics.logEvent(
      name: name
    );
  }

  @override
  RouteObserver<Route> getNavigationRouteObserver() {
    return FirebaseAnalyticsObserver(analytics: _analytics);
  }
}

/// The tracking service.
abstract class HelloTrackingService {
  Future<void> setUserId(String id);
  Future<void> trackEventWith(String name, Map<String, String?> extras);
  Future<void> trackEvent(String name);
  RouteObserver getNavigationRouteObserver();
}
