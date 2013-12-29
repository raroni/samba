part of samba;

class Sequencer {
  ComponentRegistry components;
  final AdditionBuffer additions = new AdditionBuffer();
  final RegistrationBuffer registrations = new RegistrationBuffer();
  final SetupBuffer setups = new SetupBuffer();
  
  void initialize() {
    additions.registrations = registrations;
    additions.setups = setups;
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
    setups.commit();
    registrations.commit();
  }
  
  void trim() {
    
  }
}
