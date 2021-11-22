import 'package:alg_class/heap.dart';

void main() {
  final heap = Heap(
    values: [10, 5, 7, 2, 1],
    type: HeapType.min,
  );
  print(heap);

  final value = heap.removeRoot();
  print(value);
  print(heap);
}
