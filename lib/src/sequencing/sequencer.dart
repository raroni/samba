part of samba;

class Sequencer {
  ComponentRegistry components;
  final AdditionBuffer additions = new AdditionBuffer();
  final RegistrationBuffer registrations = new RegistrationBuffer();
  
  void initialize() {
    additions.registrations = registrations;
    registrations.components = components;
  }
  
  void scheduleComponentAddition(Component component, Node node) {
    additions.scheduleComponent(component, node);
  }
  
  void scheduleChildAddition(Entity child, Node parent) {
    additions.scheduleChild(child, parent);
  }
  
  void grow() {
    additions.commit();
    registrations.commit();
  }
  
  void trim() {
    
  }
}
