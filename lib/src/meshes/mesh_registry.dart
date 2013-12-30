part of samba;

class MeshRegistry {
  Map<String, Mesh> map = new Map<String, Mesh>();
  
  Mesh get(String name) {
    var mesh = map[name];
    if(mesh == null) throw new Exception("Mesh not found.");
    return mesh;
  }
  
  void set(String name, Mesh mesh) {
    if(map[name] != null) throw new Exception("Mesh name already taken.");
    map[name] = mesh;
  }
}
