import 'package:alg_class/ring_buffer.dart';

import 'heap.dart';
import 'linked_list.dart';

abstract class Queue<E> {
  void enqueue(E value);
  E? dequeue();
  bool get isEmpty;
  //E? peek();
}

class QueueList<E> implements Queue<E> {
  final List<E> _list = [];

  @override
  E? dequeue() => (isEmpty) ? null : _list.removeAt(0);

  @override
  void enqueue(E value) => _list.add(value);

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  String toString() => _list.toString();
}

class QueueLinkedList<E> implements Queue<E> {
  final _list = LinkedList<E>();

  @override
  E? dequeue() => _list.pop();

  @override
  void enqueue(E value) => _list.append(value);

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  String toString() {
    return _list.toString();
  }
}

class QueueRingBuffer<E> implements Queue<E> {
  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);

  final RingBuffer<E> _ringBuffer;

  @override
  E? dequeue() => _ringBuffer.read();

  @override
  void enqueue(E value) {
    final isSuccessful = _ringBuffer.write(value);
    if (!isSuccessful) throw Exception('Buffer is full');
  }

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  String toString() => _ringBuffer.toString();
}

class PriorityQueue<E extends Comparable> implements Queue<E> {
  PriorityQueue({bool isMin = false}) {
    if (isMin) {
      _heap = Heap<E>(type: HeapType.min);
    } else {
      _heap = Heap<E>(type: HeapType.max);
    }
  }

  late Heap<E> _heap;

  @override
  E? dequeue() => _heap.removeRoot();

  @override
  void enqueue(E value) => _heap.insert(value);

  @override
  bool get isEmpty => _heap.isEmpty;
}
