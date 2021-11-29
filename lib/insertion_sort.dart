void insertionSort(List<int> list) {
  var i = 1;
  while (i < list.length) {
    var j = i;
    while (j > 0 && list[j] < list[j - 1]) {
      swap(list, j, j - 1);
      j--;
    }
    i++;
  }
}

void insertionSortFor(List<int> list) {
  for (var i = 1; i < list.length; i++) {
    for (var j = i; j > 0 && list[j] < list[j - 1]; j--) {
      swap(list, j, j - 1);
    }
  }
}

void swap(List<int> list, int firstIndex, int secondIndex) {
  final save = list[firstIndex];
  list[firstIndex] = list[secondIndex];
  list[secondIndex] = save;
}
