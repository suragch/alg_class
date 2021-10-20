class RingBuffer<E> {
  RingBuffer(int length) : _list = List.filled(length, null, growable: false);
  // [null, null, null, null, null, null, null, null, ]

  final List<E?> _list;

  int _length = 0;

  int _readIndex = 0;
  int _writeIndex = 0;

  bool get isEmpty => _length == 0;
  bool get isFull => _length == _list.length;

  // return true if the write was successful.
  // returns false if the buffer is full
  bool write(E? value) {
    if (isFull) {
      return false;
    }
    _list[_writeIndex] = value;
    _moveWriteIndex();
    _length++;
    return true;
  }

  void _moveWriteIndex() {
    if (_writeIndex == _list.length - 1) {
      _writeIndex = 0;
    } else {
      _writeIndex = _writeIndex + 1;
    }
  }

  E? read() {
    if (isEmpty) {
      return null;
    }
    final value = _list[_readIndex];
    _length = _length - 1;
    _moveReadIndex();
    return value;
  }

  void _moveReadIndex() {
    if (_readIndex == _list.length - 1) {
      _readIndex = 0;
    } else {
      _readIndex++;
    }
  }

  @override
  String toString() => _list.toString();
}
