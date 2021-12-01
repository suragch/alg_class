import 'package:alg_class/bubble_sort.dart';
import 'package:alg_class/insertion_sort.dart';
import 'package:alg_class/merge_sort.dart';

void main() {
  final list = [4, 3, 1, 4, 6, 7, 8];
  print(list);
  final sorted = mergeSort(list);
  print(sorted);
}
