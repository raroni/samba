part of samba;

abstract class Node {
  GroupMask groupMask = GroupMaskRegistry.default_();
  
  void destroy() {
    
  }
}
