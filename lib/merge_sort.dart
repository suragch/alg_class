List<int> mergeSort(List<int> list) {
  if (list.length <= 1) {
    return list;
  }
  // split list
  final middleIndex = list.length ~/ 2;
  var left = list.sublist(0, middleIndex);
  var right = list.sublist(middleIndex, list.length);

  left = mergeSort(left);
  right = mergeSort(right);
  // merge list
  return _merge(left, right);
}

List<int> _merge(List<int> a, List<int> b) {
  final merged = <int>[];
  var aIndex = 0;
  var bIndex = 0;

  while (aIndex < a.length && bIndex < b.length) {
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
    for (var i = aIndex; i < a.length; i++) {
      merged.add(a[i]);
    }
  }
  if (bIndex < b.length) {
    for (var i = bIndex; i < b.length; i++) {
      merged.add(b[i]);
    }
  }
  return merged;
}
