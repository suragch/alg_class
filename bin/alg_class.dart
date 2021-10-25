import 'package:alg_class/binary_tree.dart';

void main() {
  final tree = BinaryTreeNode('D',
      leftChild: BinaryTreeNode('A'),
      rightChild: BinaryTreeNode(
        'R',
        leftChild: BinaryTreeNode('T'),
        rightChild: BinaryTreeNode('Fun'),
      ));
  print(tree);
}
