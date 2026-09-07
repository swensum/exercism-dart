class RelativeDistance {
  final Map<String, List<String>> familyTree;

  RelativeDistance(this.familyTree);

  int degreesOfSeparation(String person1, String person2) {
    if (person1 == person2) {
      return 0;
    }

    final graph = <String, Set<String>>{};

    void addPerson(String person) {
      graph.putIfAbsent(person, () => {});
    }

    for (final entry in familyTree.entries) {
      final parent = entry.key;
      final children = entry.value;

      addPerson(parent);

      // Parent <-> child
      for (final child in children) {
        addPerson(child);

        graph[parent]!.add(child);
        graph[child]!.add(parent);
      }

      // Sibling <-> sibling
      for (var i = 0; i < children.length; i++) {
        for (var j = i + 1; j < children.length; j++) {
          graph[children[i]]!.add(children[j]);
          graph[children[j]]!.add(children[i]);
        }
      }
    }

    if (!graph.containsKey(person1) || !graph.containsKey(person2)) {
      return -1;
    }

    final queue = <String>[person1];
    final distances = <String, int>{
      person1: 0,
    };

    var index = 0;

    while (index < queue.length) {
      final current = queue[index];
      index++;

      for (final next in graph[current]!) {
        if (distances.containsKey(next)) {
          continue;
        }

        final distance = distances[current]! + 1;

        if (next == person2) {
          return distance;
        }

        distances[next] = distance;
        queue.add(next);
      }
    }

    return -1;
  }
}