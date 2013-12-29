part of samba;

class ComponentTypeRegistry<T> extends Object with Subscriber {
  List<T> components = new List<T>();
  
  void initialize(ComponentRegistry components) {
    subscribe(components, "added");
    subscribe(components, "removed");
  }
  
  void onEvent(ComponentEvent event) {
    print("component event!");
  }
}
