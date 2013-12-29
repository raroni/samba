part of samba;

class Entity extends Node {
  Node parent;
  
  Sequencer get sequencer {
    if(parent == null) return null;
    return parent.sequencer;
  }
}
