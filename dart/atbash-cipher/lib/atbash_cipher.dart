class AtbashCipher {
  final String _plain = 'abcdefghijklmnopqrstuvwxyz';
  final String _cipher = 'zyxwvutsrqponmlkjihgfedcba';

  String encode(String input) {
    final cleaned = input.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

    final buffer = StringBuffer();
    int count = 0;

    for (final char in cleaned.split('')) {
      if (RegExp(r'[a-z]').hasMatch(char)) {
        final index = _plain.indexOf(char);
        buffer.write(_cipher[index]);
      } else {
        buffer.write(char);
      }

      count++;

      if (count % 5 == 0) {
        buffer.write(' ');
      }
    }

    return buffer.toString().trim();
  }

  String decode(String input) {
    final cleaned = input.replaceAll(' ', '').toLowerCase();

    final buffer = StringBuffer();

    for (final char in cleaned.split('')) {
      if (RegExp(r'[a-z]').hasMatch(char)) {
        final index = _cipher.indexOf(char);
        buffer.write(_plain[index]);
      } else {
        buffer.write(char);
      }
    }

    return buffer.toString();
  }
}