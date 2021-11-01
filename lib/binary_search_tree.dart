import 'package:alg_class/binary_tree.dart';

class BinarySearchTree<E extends Comparable> {
  BinaryTreeNode<E>? root;

  void insert(E value) {
    root = _insertAt(root, value);
  }

  BinaryTreeNode<E> _insertAt(BinaryTreeNode<E>? node, E value) {
    if (node == null) {
      return BinaryTreeNode<E>(value);
    }

    if (value.compareTo(node.value) >= 0) {
      node.rightChild = _insertAt(node.rightChild, value);
    } else {
      node.leftChild = _insertAt(node.leftChild, value);
    }

    return node;
  }

  // bool contains(E value) {
  //   var current = root;

  //   while (current != null) {
  //     if (current.value == value) {
  //       return true;
  //     }
  //     if (value.compareTo(current.value) > 0) {
  //       current = current.rightChild;
  //     } else {
  //       current = current.leftChild;
  //     }
  //   }
  //   return false;
  // }

  bool contains(E value) {
    return _containsHelper(root, value);
  }

  bool _containsHelper(BinaryTreeNode<E>? node, E value) {
    // base case
    if (node == null) {
      return false;
    }
    if (node.value == value) {
      return true;
    }

    // recursion

    if (value.compareTo(node.value) > 0) {
      node = node.rightChild;
    } else {
      node = node.leftChild;
    }
    return _containsHelper(node, value);
  }

  @override
  String toString() => root.toString();
}
