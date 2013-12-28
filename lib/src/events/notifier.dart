part of samba;

abstract class Notifier {
  Map<String, List<Subscription>> notifierSubscriptions = new Map<String, List<Subscription>>(); 
  
  void notify(Event event) {
    var subscriptions = notifierSubscriptions[event.name];
    for(Subscription subscription in subscriptions) {
      subscription.subscriber.onEvent(event);
    }
  }
  
  void addSubscription(Subscription subscription) {
    if(!notifierSubscriptions.containsKey(subscription.eventName)) {
      notifierSubscriptions[subscription.eventName] = new List<Subscription>();
    }
    
    notifierSubscriptions[subscription.eventName].add(subscription);
  }
}
