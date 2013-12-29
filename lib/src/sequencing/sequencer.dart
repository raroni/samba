part of samba;

class Sequencer {
  ComponentRegistry components;
  AdditionBuffer additions = new AdditionBuffer();
  
  void scheduleComponentAddition(Component component, Node node) {
    additions.scheduleComponent(component, node);
  }
  
  void scheduleChildAddition(Entity child, Node parent) {
    additions.scheduleChild(child, parent);
  }
  
  void grow() {
    additions.commit();
  }
  
  void trim() {
    
  }
}
