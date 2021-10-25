class BinaryTreeNode<T> {
  BinaryTreeNode(this.value, {this.leftChild, this.rightChild});
  T value;
  BinaryTreeNode? leftChild;
  BinaryTreeNode? rightChild;

  // modified from https://stackoverflow.com/a/19484210
  @override
  String toString() {
    final out = StringBuffer();
    if (rightChild != null) {
      rightChild!._buildTree(out, true, '');
    }
    out.write(value.toString());
    out.write('\n');
    if (leftChild != null) {
      leftChild!._buildTree(out, false, '');
    }
    return out.toString();
  }

  void _buildTree(StringBuffer out, bool isRight, String indent) {
    if (rightChild != null) {
      rightChild!._buildTree(out, true, indent + (isRight ? '     ' : ' │   '));
    }
    out.write(indent);
    if (isRight) {
      out.write(' ┌───');
    } else {
      out.write(' └───');
    }
    out.write(' ');
    out.write(value.toString());
    out.write('\n');
    if (leftChild != null) {
      leftChild!._buildTree(out, false, indent + (isRight ? ' │   ' : '     '));
    }
  }
}
