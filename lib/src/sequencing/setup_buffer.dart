part of samba;

class SetupBuffer {
  List<Component> setups = new List<Component>();
  
  void schedule(Component component) {
    setups.add(component);
  }
  
  void commit() {
    for(Component component in setups) {
      component.setup();
    }
    setups.clear();
  }
}
