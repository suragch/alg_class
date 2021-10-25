class BinaryTreeNode<T> {
  BinaryTreeNode(this.value, {this.leftChild, this.rightChild});
  T value;
  BinaryTreeNode? leftChild;
  BinaryTreeNode? rightChild;

  @override
  String toString() {
    return _toString(StringBuffer(), true, StringBuffer()).toString();
  }

  StringBuffer _toString(StringBuffer prifix, bool isTail, StringBuffer sb) {
    if (rightChild != null) {
      final newBuffer = StringBuffer();
      newBuffer.write(prifix);
      newBuffer.write(isTail ? '│   ' : '    ');
      rightChild!._toString(newBuffer, false, sb);
    }
    sb.write(prifix);
    sb.write(isTail ? '└── ' : '┌── ');
    sb.write(value.toString());
    sb.write('\n');
    if (leftChild != null) {
      final newBuffer = StringBuffer();
      newBuffer.write(prifix);
      newBuffer.write(isTail ? '    ' : '│   ');
      leftChild!._toString(prifix, true, sb);
    }
    return sb;
  }
}

// public StringBuilder toString(StringBuilder prefix, boolean isTail, StringBuilder sb) {
//     if(right!=null) {
//         right.toString(new StringBuilder().append(prefix).append(isTail ? "│   " : "    "), false, sb);
//     }
//     sb.append(prefix).append(isTail ? "└── " : "┌── ").append(value.toString()).append("\n");
//     if(left!=null) {
//         left.toString(new StringBuilder().append(prefix).append(isTail ? "    " : "│   "), true, sb);
//     }
//     return sb;
// }

// @Override
// public String toString() {
//     return this.toString(new StringBuilder(), true, new StringBuilder()).toString();
// }
