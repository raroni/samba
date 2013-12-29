part of samba;

class ComponentTypeRegistry<T> extends Object with Subscriber, Notifier {
  List<T> components = new List<T>();
  
  void initialize(ComponentRegistry components) {
    subscribe(components, "added");
    subscribe(components, "removed");
  }
  
  void onEvent(ComponentEvent event) {
    if(!(event.component is T)) return;
    
    if(event.name == "added") {
      components.add(event.component);
    } else {
      components.remove(event.component);
    }
    
    var newEvent = new ComponentEvent(event.component, event.name);
    notify(newEvent);
  }
}
