import 'package:alg_class/binary_tree.dart';
import 'package:alg_class/tree_node.dart';

void main() {
  final tree = BinaryTreeNode('A',
      leftChild: BinaryTreeNode('D'),
      rightChild: BinaryTreeNode(
        'R',
        leftChild: BinaryTreeNode('T'),
        rightChild: BinaryTreeNode('Fun'),
      ));
  print(tree);
}
