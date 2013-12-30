part of samba;

class Vector3 {
  final TypedData.Float32List components = new TypedData.Float32List(3);
  
  Vector3(double x, double y, double z) {
    components[0] = x;
    components[1] = y;
    components[2] = z;
  }
}
