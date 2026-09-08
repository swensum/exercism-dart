typedef Item = ({int weight, int value});

class Knapsack {
  final int maxWeight;

  Knapsack({required this.maxWeight});

  int maxValue(List<({int weight, int value})> items) {
    final dp = List<int>.filled(maxWeight + 1, 0);

    for (final item in items) {
      for (var weight = maxWeight; weight >= item.weight; weight--) {
        final takeItem = dp[weight - item.weight] + item.value;

        if (takeItem > dp[weight]) {
          dp[weight] = takeItem;
        }
      }
    }

    return dp[maxWeight];
  }
}