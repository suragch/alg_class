import 'package:alg_class/tree_node.dart';

void main() {
  final tree = createTree();
  tree.traverseTree();
}

TreeNode<String> createTree() {
  final drink = TreeNode('drink');
  final hot = TreeNode('hot');
  final cold = TreeNode('cold');
  final coffee = TreeNode('coffee');
  final tea = TreeNode('tea');
  final soda = TreeNode('soda');
  final juice = TreeNode('juice');
  final cola = TreeNode('cola');
  final sprite = TreeNode('sprite');
  final pepsi = TreeNode('pepsi');
  drink.addChild(hot);
  drink.addChild(cold);
  hot.addChild(coffee);
  hot.addChild(tea);
  cold.addChild(soda);
  cold.addChild(juice);
  soda.addChild(cola);
  soda.addChild(sprite);
  soda.addChild(pepsi);

  return drink;
}
