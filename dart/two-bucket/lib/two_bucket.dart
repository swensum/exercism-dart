typedef Result = ({int moves, String goalBucket, int otherBucket});

class TwoBucket {
  final int bucketOne;
  final int bucketTwo;
  final int goal;
  final String startBucket;

  TwoBucket({
    required this.bucketOne,
    required this.bucketTwo,
    required this.goal,
    required this.startBucket,
  });

  Result measure() {
    if(goal > bucketOne && goal > bucketTwo){
      throw ArgumentError('impossible');
    }

    final startCapacity = startBucket == "one" ? bucketOne : bucketTwo;
    final otherCapacity = startBucket == "one" ? bucketTwo : bucketOne;

    final queue = <State>[
      State(
        start: startCapacity,
        other: 0,
        moves: 1,
      ),
    ];
    final visited = <String>{'$startCapacity, 0'};

    while(queue.isNotEmpty) {
      final current = queue.removeAt(0);
      final start = current.start;
      final other = current.other;
      final moves = current.moves;

      //Goal is in the starting bucket.
      if(start == goal) {
        return(
          moves: moves,
          goalBucket: startBucket,
          otherBucket:other,
        );
      }

      //Goal is in the other bucket.
      if(other == goal) {
        return(
          moves: moves,
          goalBucket: startBucket == "one" ? "two" : "one",
          otherBucket: start,
        );
      }
      final nextStates = <(int, int)> [];

      //1. Fill the starting bucket.
      nextStates.add((startCapacity, other));

      //2. Empty the starting bucket.
      nextStates.add((0, other));

      //3. Fill the other bucket.
      nextStates.add((start, otherCapacity));

      //4. Empty the other bucket.
      nextStates.add((start, 0));

      //5. Pour starting bucket -> other bucket.
      final amountToOther = (otherCapacity - other).clamp(0, start);
      nextStates.add((
        start - amountToOther,
        other + amountToOther,
      ));
      //6. Pour other bucket -> starting bucket.
      final amountToStart = (startCapacity - start).clamp(0, other);
      nextStates.add((
        start + amountToStart,
        other - amountToStart,
      ));
      for(final next in nextStates) {
        final nextStart = next.$1;
        final nextOther = next.$2;

        //Forbidden state:
        //starting bucket is empty AND the other bucket is full.
        if(nextStart == 0 && nextOther == otherCapacity) {
          continue;
        }
        final key = '$nextStart,$nextOther';
        if(visited.contains(key)){
          continue;
        }
        visited.add(key);
        queue.add(
          State(
            start: nextStart,
            other:nextOther,
            moves: moves + 1,
          ),
        );
      }
    }
    throw ArgumentError('impossible');
  }
}
class State{
  final int start;
  final int other;
  final int moves;

  State({
    required this.start,
    required this.other,
    required this.moves,
  });
}