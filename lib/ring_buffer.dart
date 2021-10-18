class RingBuffer<E> {
  RingBuffer(int length) : _list = List.filled(length, null, growable: false);
  // [null, null, null, null, null, null, null, null, ]

  final List<E?> _list;

  int _length = 0;

  int _readIndex = 0;
  int _writeIndex = 0;

  bool get isEmpty => _length == 0;
  bool get isFull => _length == _list.length;

  bool write(E? value) {
    _list[_writeIndex] = value;
    _moveWriteIndex();
    return true;
  }

  void _moveWriteIndex() {
    if (_writeIndex == _list.length - 1) {
      _writeIndex = 0;
    } else {
      _writeIndex = _writeIndex + 1;
    }
  }

  @override
  String toString() => _list.toString();
}
