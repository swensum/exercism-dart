enum Classification {
  equal,
  sublist,
  superlist,
  unequal,
}

class Sublist {
  Classification sublist(List <int> listOne, List <int> listTwo){
    if(_isEqual(listOne, listTwo)) {
      return Classification.equal;
    }
    if(_isSublist(listOne, listTwo)) {
      return Classification.sublist;
    }
    if(_isSublist(listTwo, listOne)) {
      return Classification.superlist;
    }
    return Classification.unequal;
  }
  bool _isEqual (List <int> a, List <int> b) {
    if(a.length != b.length) return false;

    for(int i = 0; i < a.length; i++){
      if (a[i] != b[i]) return false;
    }
    return true;
  }
  bool _isSublist(List <int> small, List <int> big) {
  if (small.isEmpty) return true;
  for (int i = 0; i <= big.length - small.length; i++){
    bool match=true;
    for(int j = 0; j < small.length; j++){
      if (big[i + j] != small[j]) {
        match = false;
        break;
      }
    }
    if (match) return true;
  }
  return false;
  }
}
