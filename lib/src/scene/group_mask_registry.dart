part of samba;

class GroupMaskRegistry {
  static const int DEFAULT_VALUE = 1;
  final Map<String, int> maskValues = { "default": DEFAULT_VALUE };
  
  GroupMask getSecure(String name) {
    if(!maskValues.containsKey(name)) throw new Exception("Group mask not defined.");
    return new GroupMask(maskValues[name]);
  }
  
  GroupMask get(String name1, [String name2]) {
    var groupMask = getSecure(name1);
    if(name2 != null) groupMask.include(getSecure(name2));
    return groupMask;
  }
  
  void set(int slot, String name) {
    if(maskValues.containsValue(slot)) throw new Exception("Group mask slot already set.");
    if(maskValues.containsKey(name)) throw new Exception("Group mask name already used.");
    int value = 1 << slot;
    maskValues[name] = value;
  }
  
  static GroupMask default_() {
    return new GroupMask(DEFAULT_VALUE);
  }
}
