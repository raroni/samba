part of samba;

class GroupMask {
  int _value;
  
  GroupMask(value) {
    _value = value;
  }
  
  int get value => _value; 
  
  void include(GroupMask groupMask) {
    _value = _value | groupMask.value;
  }
  
  bool matches(GroupMask groupMask) {
    return (_value & groupMask.value) != 0;
  }
}
