class BinaryTreeNode<T> {
  BinaryTreeNode(this.value, {this.leftChild, this.rightChild});
  T value;
  BinaryTreeNode? leftChild;
  BinaryTreeNode? rightChild;
}
