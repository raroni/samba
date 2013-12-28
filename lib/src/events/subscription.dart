part of samba;

class Subscription {
  final String eventName;
  final Subscriber subscriber;
  final Notifier notifier;
  
  Subscription(this.eventName, this.subscriber, this.notifier) { }
}
