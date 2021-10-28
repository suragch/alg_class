import 'package:alg_class/binary_search_tree.dart';

void main() {
  final tree = BinarySearchTree<int>();
  tree.insert(43);
  tree.insert(10);
  tree.insert(79);
  tree.insert(90);

  print(tree);

  // const a = 43;
  // const b = 43;
  // print(a.compareTo(b));
}
