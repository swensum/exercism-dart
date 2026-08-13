class RnaTranscription {
  String toRna(String strand) {
    //receives a string of DNA and returns its RNA complement
    var result = ''; // empty string to store the RNA complement
    for (final nucleotide in strand.split('')) {
      //it means looping through each letter of dna and split change the string in to {a,c,g,t} form
      if (nucleotide == 'G') {
        //if the letter is G then add C to the result
        result += 'C'; // here C is the result of RNA
      } else if (nucleotide == 'C') {
        result += 'G';
      } else if (nucleotide == 'T') {
        result += 'A';
      } else if (nucleotide == 'A') {
        result += 'U';
      }
    }
    return result;
  }
}


//other method :
// class RnaTranscription {
//   String toRna(String strand) {
//     var result = '';

//     for (final nucleotide in strand.split('')) {
//       switch (nucleotide) {
//         case 'G':
//           result += 'C';
//           break;

//         case 'C':
//           result += 'G';
//           break;

//         case 'T':
//           result += 'A';
//           break;

//         case 'A':
//           result += 'U';
//           break;
//       }
//     }

//     return result;
//   }
// }