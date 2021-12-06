import 'package:alg_class/heap.dart';
import 'package:alg_class/heap_sort.dart';

void main() {
  final list = [12, 7, 15, 9, 1, 3];
  final heap = Heap(type: HeapType.min, values: list);
  print(heap);
  // print(heap.removeRoot());
  // print(heap.removeRoot());
  // print(heap.removeRoot());
  // print(heap.removeRoot());
  // print(heap.removeRoot());
  // print(heap.removeRoot());
  final sorted = heapSort(list);
  print(sorted);
}
