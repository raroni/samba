part of samba;

class ComponentEvent extends Event {
  final Component component;
  ComponentEvent(this.component, String type) : super(type) { }
}
