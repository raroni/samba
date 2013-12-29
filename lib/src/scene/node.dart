part of samba;

abstract class Node {
  GroupMask groupMask = GroupMaskRegistry.default_();
  List<Component> components = new List<Component>();
  List<Entity> children = new List<Entity>();
  
  SceneSequencer get sequencer;
  
  void addChild(Entity child) {
    if(sequencer != null)
      sequencer.scheduleChildAddition(child, this);
    else
      addChildNow(child);
  }
  
  void addComponent(Component component) {
    if(sequencer != null)
      sequencer.scheduleComponentAddition(component, this);
    else
      addComponentNow(component);
  }
  
  void addComponentNow(Component component) {
    components.add(component);
  }
  
  void addChildNow(Entity child) {
    children.add(child);
    child.parent = this;
  }
  
  void destroy() {
    
  }
}
