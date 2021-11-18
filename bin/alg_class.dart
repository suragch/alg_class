import 'package:alg_class/heap.dart';

void main() {
  final heap = Heap();
  heap.insert(10);
  heap.insert(5);
  heap.insert(7);
  heap.insert(2);
  heap.insert(1);
  print(heap);
  print(heap.peek);

  final value = heap.removeRoot();
  print(value);
  print(heap);
}
