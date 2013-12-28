part of samba;

abstract class Subscriber {
  List<Subscription> subscriberSubscriptions = new List<Subscription>();
  
  void onEvent(Event event);
  
  void subscribe(Notifier notifier, String eventName) {
    var subscription = new Subscription(eventName, this, notifier);
    subscriberSubscriptions.add(subscription);
    notifier.addSubscription(subscription);
  }
}
