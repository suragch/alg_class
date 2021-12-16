void bubbleSort<E extends Comparable>(List<E> list) {
  // int first;
  // int second;
  var stop = list.length - 1;
  for (var j = 0; j < list.length; j++) {
    for (var i = 0; i < stop; i++) {
      if (list[i].compareTo(list[i + 1]) > 0) {
        swap(list, i, i + 1);
      }
    }
    stop = stop - 1;
  }
}

void swap<E>(List<E> list, int firstIndex, int secondIndex) {
  final save = list[firstIndex];
  list[firstIndex] = list[secondIndex];
  list[secondIndex] = save;
}
