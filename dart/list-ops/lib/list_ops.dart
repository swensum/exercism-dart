extension ListOps on List {
  void append<T>(List<T> other) {
   for(final item in other){
    add(item);
   }
  }

  List<T> concat<T>() {
   final result = <T>[];
   for(final list in this){
    for(final item in list){
      result.add(item);
    }
   }
   return result;
  }

  List<T> filter<T>(bool Function(T elem) predicate) {
    final result = <T>[];
    for(final elem in this){
      if(predicate(elem)){
        result.add(elem);
      }
    }
    return result;
  }

  int count() {
   var result = 0;

  for(final _ in this){
    result++;
   }
   return result;
  }

  List<T> myMap<T>(T Function(T elem) fn) {
   final result = <T>[];
   for(final elem in this){
    result.add(fn(elem));
   }
   return result;
  }

  U foldl<T, U>(U initial, U Function(U acc, T elem) fn) {
  var accumulator = initial;
  for(final elem in this){
    accumulator = fn(accumulator, elem);
  }
  return accumulator;
  }

  U foldr<T, U>(U initial, U Function(T elem, U acc) fn) {
   var accumulator = initial;

   for(var i = count() - 1; i >= 0; i--){
    accumulator = fn(this[i], accumulator);
       }
       return accumulator;
  }

  List<T> reverse<T>() {
    final result = <T>[];

    for (var i = count() - 1; i >= 0; i--){
      result.add(this[i]);
    }
    return result;
  }
}
