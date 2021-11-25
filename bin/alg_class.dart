import 'package:alg_class/heap.dart';
import 'package:alg_class/queue.dart';

void main() {
  final queue = PriorityQueue(isMin: false);
  queue.enqueue(5);
  queue.enqueue(10);
  queue.enqueue(3);
  print(queue.dequeue());
}
