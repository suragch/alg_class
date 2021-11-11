void main() {
  final tree = BinaryTreeNode(
    1,
    leftChild: BinaryTreeNode(2),
    rightChild: BinaryTreeNode(3),
  );
  print(tree);
  tree.traverseInOrder(print);
  // tree.check(1);
  // tree.traverseInOrder((value) {
  //   print(value);
  // });
}

class BinaryTreeNode<T> {
  BinaryTreeNode(this.value, {this.leftChild, this.rightChild});
  T value;
  BinaryTreeNode<T>? leftChild;
  BinaryTreeNode<T>? rightChild;

  void traverseInOrder(void Function(T value) traverse) {
    leftChild?.traverseInOrder(traverse);
    traverse(value);
    rightChild?.traverseInOrder(traverse);
  }

  void check(T value) {
    traverseInOrder((myValue) {
      if (value == myValue) {
        print(myValue);
      }
    });
  }

  @override
  String toString() {
    var buffer = StringBuffer();
    traverseInOrder((value) {
      buffer.write(value.toString());
      buffer.write(' ');
    });
    return buffer.toString();
  }
}
