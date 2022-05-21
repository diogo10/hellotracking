library hellotracking;

/// The tracking implementation.
class HelloTrackingServiceImp implements HelloTrackingService {
  @override
  void init() {
    // TODO: implement init
  }

  @override
  void setUserId() {
    // TODO: implement setUserId
  }

  @override
  void trackEvent(String name) {
    // TODO: implement trackEvent
  }
 
  
}

/// The tracking service.
abstract class HelloTrackingService {
  void init();
  void setUserId();
  void trackEvent(String name);
}
