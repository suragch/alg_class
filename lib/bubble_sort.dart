void bubbleSort(List<int> list) {
  // int first;
  // int second;
  var stop = list.length - 1;
  for (int j = 0; j < list.length; j++) {
    for (int i = 0; i < stop; i++) {
      if (list[i] > list[i + 1]) {
        swap(list, i, i + 1);
      }
    }
    stop = stop - 1;
  }
}

void swap(List<int> list, int firstIndex, int secondIndex) {
  final save = list[firstIndex];
  list[firstIndex] = list[secondIndex];
  list[secondIndex] = save;
}
