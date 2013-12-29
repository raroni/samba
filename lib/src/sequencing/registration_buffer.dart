part of samba;

class RegistrationBuffer {
  List<Component> registrations = new List<Component>();
  ComponentRegistry components;
  
  void schedule(Component component) {
    registrations.add(component);
  }
  
  void commit() {
    for(Component component in registrations) {
      components.add(component);
    }
    registrations.clear();
  }
}
