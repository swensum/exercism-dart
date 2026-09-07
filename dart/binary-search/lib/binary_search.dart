import 'value_not_found_exception.dart';

class BinarySearch {
final List<int> list;

BinarySearch(this.list);

int find(int value) {
  var left = 0;
  var right = list.length - 1;

  while(left <= right){
    final middle = (left + right) ~/ 2;

    if(list[middle] == value) {
      return middle;
    }
    if(list[middle] < value) {
      left = middle + 1;
    } else {
      right = middle - 1;
    }
  }
  throw ValueNotFoundException('Value not found');
}
}
