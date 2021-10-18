class Stack<T> {
  final _list = <T>[];

  void push(T item) => _list.add(item);

  T pop() => _list.removeLast();

  T peek() => _list.last;

  bool get isEmpty => _list.isEmpty;

  @override
  String toString() {
    const top = '---Top---\n';
    final middle = _list.reversed.join('\n');
    const bottom = '\n---------';
    return '$top$middle$bottom';
  }
}
