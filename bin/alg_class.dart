void main() {
  final list = [0, 10, 11, 15, 30, 35, 60, 71, 80];
  final isInList = binarySearch(61, list);
  print(isInList);
}

bool binarySearch(int value, List<int> list) {
  var start = 0;
  var end = list.length;

  while (start != end) {
    var middle = (start + end) ~/ 2;
    if (list[middle] == value) {
      return true;
    } else if (value > list[middle]) {
      start = middle + 1;
    } else {
      end = middle;
    }
  }
  return false;
}
