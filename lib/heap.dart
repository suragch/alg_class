enum HeapType { max, min }

class Heap<E extends Comparable> {
  Heap({
    List<E>? values,
    HeapType type = HeapType.max,
  }) : _type = type {
    if (values == null) return;
    for (final value in values) {
      insert(value);
    }
  }

  List<E> _list = [];
  HeapType _type;

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

  bool _firstHasPriority(E valueA, E valueB) {
    if (_type == HeapType.max) {
      return valueA.compareTo(valueB) > 0;
    } else {
      return valueA.compareTo(valueB) < 0;
    }
  }

  void _moveUp(int index) {
    var childIndex = index;
    var parentIndex = _parent(childIndex);
    var childValue = _list[childIndex];
    var parentValue = _list[parentIndex];

    while (_firstHasPriority(childValue, parentValue)) {
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
      var theChosenOne = parentIndex;

      // check left
      if (_firstHasPriority(_list[leftIndex], _list[parentIndex])) {
        theChosenOne = leftIndex;
      }

      // check right
      if (rightIndex < _list.length &&
          _firstHasPriority(_list[rightIndex], _list[parentIndex])) {
        theChosenOne = rightIndex;
      }

      if (parentIndex == theChosenOne) {
        return;
      }

      _swap(parentIndex, theChosenOne);
      parentIndex = theChosenOne;
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
  String toString() {
    final out = StringBuffer();

    if (_rightChild(0) < _list.length) {
      _buildTree(_rightChild(0), out, true, '');
    }
    out.writeln(_list[0]);
    if (_leftChild(0) < _list.length) {
      _buildTree(_leftChild(0), out, false, '');
    }

    return out.toString();
  }

  void _buildTree(int index, StringBuffer out, bool isRight, String indent) {
    if (_rightChild(index) < _list.length) {
      _buildTree(_rightChild(index), out, true,
          indent + (isRight ? '     ' : '│    '));
    }

    out
      ..write(indent)
      ..write(isRight ? '┌─── ' : '└─── ')
      ..writeln(_list[index]);

    if (_leftChild(index) < _list.length) {
      _buildTree(_leftChild(index), out, false,
          indent + (isRight ? '│    ' : '     '));
    }
  }
}
