part of samba;

class LensManager extends Subscriber {
  LensDepthSorting perspectiveLenses = new LensDepthSorting();
  
  void initialize(ComponentTypeRegistry<Lens> lenses) {
    subscribe(lenses, "added");
    subscribe(lenses, "removed");
  }
  
  void onEvent(ComponentEvent event) {
    LensDepthSorting sorting;
    
    if(event.component is PerspectiveLens) {
      sorting = perspectiveLenses;
    } else {
      // handle 2d lenses
    }
    
    if(event.name == "added") sorting.add(event.component);
    else sorting.remove(event.component);
  }
}
