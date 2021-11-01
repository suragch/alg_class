import 'package:alg_class/binary_search_tree.dart';

void main() {
  final tree = BinarySearchTree<int>();
  tree.insert(43);
  tree.insert(10);
  tree.insert(79);
  tree.insert(90);
  tree.insert(12);
  tree.insert(54);
  tree.insert(11);
  tree.insert(9);
  tree.insert(50);

  print(tree);
  final isInTree = tree.contains(66);
  print(isInTree);
  print(tree);

  final people = ['Bob', 'Mary', 'Susan'];
  greetEveryone(people);
  greetEveryone(people);
}

void greetEveryone(List<String> people) {
  for (final person in people) {
    print('Welcome, $person!');
  }
  people[0] = 'Hacker';
}
