import 'heap.dart';

List<int> heapSort(List<int> list) {
  final sorted = <int>[];
  final heap = Heap(values: list, type: HeapType.min);
  for (var i = 0; i < list.length; i++) {
    final value = heap.removeRoot();
    sorted.add(value!);
  }
  return sorted;
}
