class BinaryTreeNode<T> {
  BinaryTreeNode(this.value, {this.leftChild, this.rightChild});

  T value;
  BinaryTreeNode<T>? leftChild;
  BinaryTreeNode<T>? rightChild;

  @override
  String toString() {
    final out = StringBuffer();

    final indents = <String>[];
    rightChild?._buildTree(out, true, indents);
    out.writeln(value);
    leftChild?._buildTree(out, false, indents);

    return out.toString();
  }

  void _buildTree(StringBuffer out, bool isRight, List<String> indents) {
    if (rightChild != null) {
      indents.add(isRight ? '     ' : '│    ');
      rightChild!._buildTree(out, true, indents);
      indents.removeLast();
    }

    out
      ..writeAll(indents)
      ..write(isRight ? '┌─── ' : '└─── ')
      ..writeln(value);

    if (leftChild != null) {
      indents.add(isRight ? '│    ' : '     ');
      leftChild!._buildTree(out, false, indents);
      indents.removeLast();
    }
  }
}
