class TreeNode<T> {
  TreeNode(this.value);
  T value;
  List<TreeNode<T>> children = [];

  void addChild(TreeNode<T> child) {
    children.add(child);
  }

  void traverseTree() {
    for (final child in children) {
      child.traverseTree(); // recurrsion (a method calling itself)
    }
    print(value);
  }
}
