class Vertex<T> {
  const Vertex(this.value, this.id);

  final T value;
  final int id;

  @override
  String toString() => value.toString();
}

class Edge<T> {
  Edge(this.source, this.destination, {this.weight});
  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;

  @override
  String toString() {
    return 'from $source to $destination';
  }
}

class Graph<E> {
  Map<Vertex<E>, List<Edge<E>>> _connections = {};

  int _idCounter = 0;

  Vertex<E> createVertex(E value) {
    final vertex = Vertex(value, _idCounter);
    _idCounter++;
    _connections[vertex] = [];
    return vertex;
  }

  void addEdge(
    Vertex<E> source,
    Vertex<E> destination,
    double weight,
  ) {
    final edge = Edge(source, destination, weight: weight);
    _connections[source]?.add(edge);
  }

  @override
  String toString() {
    return _connections.toString();
  }

  List<Vertex<E>> breadthFirstSearch() {
    final returnList = <Vertex<E>>[];

    return returnList;
  }
}
