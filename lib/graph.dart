class Vertex<T> {
  const Vertex(this.value, this.id);

  final T value;
  final int id;
}

class Edge<T> {
  Edge(this.source, this.destination, {this.weight});
  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;
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
    // TODO: homework
  }
}
