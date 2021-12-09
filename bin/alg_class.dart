import 'package:alg_class/graph.dart';

void main() {
  final graph = Graph();

  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');
  final e = graph.createVertex('E');
  final f = graph.createVertex('F');
  final g = graph.createVertex('G');
  final h = graph.createVertex('H');
  final i = graph.createVertex('I');
  final j = graph.createVertex('J');

  graph.addEdge(a, i, 1);
  graph.addEdge(a, h, 1);
  graph.addEdge(a, g, 1);
  graph.addEdge(a, f, 1);
  graph.addEdge(a, b, 1);
  graph.addEdge(a, c, 1);
  graph.addEdge(i, j, 1);
  graph.addEdge(i, d, 1);
  graph.addEdge(b, e, 1);

  final visited = graph.breadthFirstSearch(a);
  print(visited);
}
