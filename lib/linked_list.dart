class Node<T> {
  Node(this.value);
  T? value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  void push(E value) {
    final node = Node(value);
    if (isEmpty) {
      head = node;
      tail = node;
      return;
    }
    node.next = head;
    head = node;
  }

  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    final node = Node(value);
    tail!.next = node;
    tail = node;
  }

  Node<E>? nodeAt({required int index}) {
    if (isEmpty) {
      return null;
    }
    var currentNode = head;
    for (var i = 0; i < index; i++) {
      if (currentNode!.next == null) {
        return null;
      }
      currentNode = currentNode.next;
    }
    return currentNode;
  }

  void insertAfter(Node<E>? node, E value) {
    if (node == null) return;
    final newNode = Node(value);
    if (isEmpty) {
      push(value);
    } else {
      if (node.next == null) {
        append(value);
        return;
      }
      newNode.next = node.next;
      node.next = newNode;
    }
  }

  E? pop() {
    if (isEmpty) return null;
    final value = head?.value;
    head = head?.next;
    if (head == null) {
      tail = null;
    }
    return value;
  }

  E? removeLast() {
    if (head?.next == null) return pop();

    var current = head;
    while (current?.next != tail) {
      current = current?.next;
    }
    // get value
    final value = tail?.value;
    // update tail
    tail = current;
    tail?.next = null;

    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    // if (node.next == tail) return removeLast();
    if (node.next == tail) {
      tail = node;
      tail?.next = null;
    }
    node.next = node.next?.next;
    return value;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}
