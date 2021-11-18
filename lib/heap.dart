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

  bool get isEmpty => _list.isEmpty;

  E? get peek => (isEmpty) ? null : _list[0];

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

  void _moveDown(int index) {
    var parentIndex = index;
    var leftIndex = _leftChild(parentIndex);
    var rightIndex = _rightChild(parentIndex);

    while (true) {
      var possible = parentIndex;

      // check left
      if (_list[parentIndex].compareTo(_list[leftIndex]) < 0) {
        possible = leftIndex;
      }

      // check right
      if (rightIndex < _list.length &&
          _list[possible].compareTo(_list[rightIndex]) < 0) {
        possible = rightIndex;
      }

      if (parentIndex == possible) {
        return;
      }

      _swap(parentIndex, possible);
      parentIndex = possible;
      leftIndex = _leftChild(parentIndex);
      rightIndex = _rightChild(parentIndex);

      final length = _list.length;
      if (leftIndex >= length) {
        return;
      }
    }
  }

  E? removeRoot() {
    if (_list.isEmpty) return null;

    // swap root and last value
    const root = 0;
    final last = _list.length - 1;
    _swap(root, last);

    // move the root down
    final value = _list.removeLast();
    _moveDown(0);
    return value;
  }

  @override
  String toString() => _list.toString();
}
