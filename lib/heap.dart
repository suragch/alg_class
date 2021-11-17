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
    _moveUp(_list.length - 1);
  }

  void _moveUp(int index) {
    var childIndex = index;
    var parentIndex = _parent(childIndex);
    var childValue = _list[childIndex];
    var parentValue = _list[parentIndex];

    while (childValue.compareTo(parentValue) > 0) {
      _swap(childIndex, parentIndex);
      childIndex = parentIndex;
      parentIndex = _parent(parentIndex);
      parentValue = _list[parentIndex];
      if (childIndex == 0) return;
    }
  }

  E? removeRoot() {
    // swap root and last value
    // move the root down
  }

  @override
  String toString() => _list.toString();
}
