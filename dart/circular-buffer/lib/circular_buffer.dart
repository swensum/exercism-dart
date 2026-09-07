class EmptyBufferException implements Exception {}

class FullBufferException implements Exception {}

class CircularBuffer {
  final int capacity;
  late List<dynamic> _buffer;

  int _readPosition = 0;
  int _size = 0;

  CircularBuffer(this.capacity) {
    _buffer = List<dynamic>.filled(capacity, null);
  }

  dynamic read() {
    if (_size == 0) {
      throw EmptyBufferException();
    }

    final value = _buffer[_readPosition];

    _buffer[_readPosition] = null;

    _readPosition = (_readPosition + 1) % capacity;
    _size--;

    return value;
  }

  void write(dynamic value, {bool force = false}) {
    if (_size == capacity) {
      if (!force) {
        throw FullBufferException();
      }

      // Buffer is full, so overwrite the oldest item.
      _buffer[_readPosition] = value;

      // The overwritten item is no longer the oldest.
      _readPosition = (_readPosition + 1) % capacity;

      return;
    }

    final writePosition = (_readPosition + _size) % capacity;

    _buffer[writePosition] = value;
    _size++;
  }

  void clear() {
    _buffer = List<dynamic>.filled(capacity, null);
    _readPosition = 0;
    _size = 0;
  }
}