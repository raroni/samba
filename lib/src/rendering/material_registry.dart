part of samba;

class MaterialRegistry {
  Map<String, Material> map = new Map<String, Material>();
  
  Material get(String name) {
    var material = map[name];
    if(material == null) throw new Exception("Material not found.");
    return material;
  }
  
  void set(String name, Material material) {
    if(map[name] != null) throw new Exception("Material name already taken.");
    map[name] = material;
  }
}
