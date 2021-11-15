class Heap<E extends Comparable> {
  List<E> _list = [];

  int _leftChild(int parentIndex) => 2 * parentIndex + 1;

  int _rightChild(int parentIndex) => 2 * parentIndex + 2;

  int _parent(int childIndex) => (childIndex - 1) ~/ 2;

  void _swap(int firstIndex, int secondIndex) {
    final save = _list[firstIndex];
    _list[firstIndex] = _list[secondIndex];
    _list[secondIndex] = save;
  }

  void insert(E value) {
    _list.add(value);
    final childIndex = _list.length - 1;
    final parentIndex = _parent(childIndex);
    final parentValue = _list[parentIndex];
    if (value.compareTo(parentIndex) > 0) {
      print('child is larger');
    }
  }
}
