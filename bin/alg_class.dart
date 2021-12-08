import 'package:alg_class/graph.dart';
import 'package:alg_class/heap.dart';
import 'package:alg_class/heap_sort.dart';

void main() {
  final graph = Graph();

  final ub = graph.createVertex('Ulaanbaatar');
  final nyc = graph.createVertex('New York City');
  final kalama = graph.createVertex('Kalama');

  graph.addEdge(ub, kalama, 1);
}
