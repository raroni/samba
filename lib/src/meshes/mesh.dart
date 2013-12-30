part of samba;

class Face {
  int index1;
  int index2;
  int index3;
  
  Face(this.index1, this.index2, this.index3);
}

class Mesh {
  List<Point3D> vertices = new List<Point3D>();
  List<Face> faces = new List<Face>();
  
  void addFace(Face face) {
    faces.add(face);
  }
  
  void addVertex(Point3D vertex) {
    vertices.add(vertex);
  }
}
