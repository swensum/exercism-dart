class Proverb {
  String recite(List<String> pieces){
    if(pieces.isEmpty){
      return "";
    }
    final List<String> lines = [];
    for (int i = 0; i<pieces.length -1 ; i++){
      lines.add("For want of a ${pieces[i]} the ${pieces[i + 1]} was lost.");   
       }
       lines.add("And all for the want of ${pieces[0]}.");
       return lines.join('\n');
  }
  
}
