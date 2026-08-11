class Strain {
  List<T> keep<T>(List<T>values, bool Function(T) fn){
    final result = <T>[];
    for(final value in values){
      if(fn(value)) {
        result.add(value);
      }
    }
    return result;
  }
  List<T> discard<T>(List<T> values, bool Function(T) fn){
    final result = <T>[];
    for(final value in values){
      if(!fn(value)){
        result.add(value);
      }
    }
    return result;
  }
}
