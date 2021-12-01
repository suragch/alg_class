List<int> mergeSort(List<int> list) {
  if (list.length <= 1) {
    return list;
  }
  // split list
  final middleIndex = list.length ~/ 2;
  final left = list.sublist(0, middleIndex);
  final right = list.sublist(middleIndex, list.length);
  // merge list
}

List<int> _merge(List<int> a, List<int> b) {
  final merged = <int>[];
  var aIndex = 0;
  var bIndex = 0;

  while (aIndex < a.length || bIndex < b.length) {
    if (a[aIndex] < b[bIndex]) {
      merged.add(a[aIndex]);
      aIndex++;
    } else if (a[aIndex] == b[bIndex]) {
      merged.add(a[aIndex]);
      merged.add(b[bIndex]);
      aIndex++;
      bIndex++;
    } else {
      merged.add(b[bIndex]);
      bIndex++;
    }
  }

  if (aIndex < a.length) {
    // TODO add the rest
  }
  return merged;
}
