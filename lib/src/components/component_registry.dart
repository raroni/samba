part of samba;

class ComponentRegistry extends Object with Notifier {
  final List<Component> components = new List<Component>();
  final ComponentTypeRegistry<Layer> layers = new ComponentTypeRegistry<Layer>();
  final ComponentTypeRegistry<Lens> lenses = new ComponentTypeRegistry<Lens>();
  
  ComponentRegistry() {
    layers.initialize(this);
    lenses.initialize(this);
  }
  
  void add(Component component) {
    components.add(component);
    var event = new ComponentEvent(component, 'added');
    notify(event);
  }
  
  void update(num timeDelta) {
    for(var component in components) {
      component.update(timeDelta);
    }
  }
  
  void remove(Component component) {
    if(!components.contains(component)) throw new Exception("Component not found.");
    components.remove(component);
    var event = new ComponentEvent(component, 'removed');
    notify(event);
  }
}
