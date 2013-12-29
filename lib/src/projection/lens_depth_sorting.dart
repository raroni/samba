part of samba;

class LensDepthSorting extends Collection.IterableBase<Lens> {
  List<Lens> list = new List<Lens>();
  
  Iterator<Lens> get iterator => list.iterator;
  
  void add(Lens lens) {
    list.add(lens);
    list.sort((a, b) => a.depth <= b.depth);
  }
  
  void remove(Lens lens) {
    list.remove(lens);
  }
}
