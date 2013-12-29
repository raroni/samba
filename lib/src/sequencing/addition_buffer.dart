part of samba;

class ComponentAddition {
  Component component;
  Node node;
  ComponentAddition(this.component, this.node);
}

class ChildAddition {
  Entity child;
  Node parent;
  ChildAddition(this.child, this.parent);
}

class AdditionBuffer {
  List<ComponentAddition> componentAdditions = new List<ComponentAddition>();
  List<ChildAddition> childAdditions = new List<ChildAddition>();
  RegistrationBuffer registrations;
  SetupBuffer setups;
  
  void scheduleComponent(Component component, Node node) {
    var addition = new ComponentAddition(component, node);
    componentAdditions.add(addition);
  }
  
  void scheduleChild(Entity child, Node parent) {
    var addition = new ChildAddition(child, parent);
    childAdditions.add(addition);
  }
  
  void onChildAttached(Entity child) {
    for(Component component in child.components) {
      onComponentAttached(component);
    }
    
    for(Entity grandChild in child.children) {
      onChildAttached(grandChild);
    }
  }
  
  void onComponentAttached(Component component) {
    setups.schedule(component);
    registrations.schedule(component);
  }
  
  void commit() {
    for(ComponentAddition addition in componentAdditions) {
      addition.node.addComponentNow(addition.component);
      onComponentAttached(addition.component);
    }
    componentAdditions.clear();
    
    for(ChildAddition addition in childAdditions) {
      addition.parent.addChildNow(addition.child);
      onChildAttached(addition.child);
    }
    childAdditions.clear();
  }
}
