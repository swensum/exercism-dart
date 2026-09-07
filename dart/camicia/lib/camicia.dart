class Camicia {
  Map<String, dynamic> simulateGame(
    List<String> playerA,
    List<String> playerB,
  ) {
    final a = List<String>.from(playerA);
    final b = List<String>.from(playerB);

    final pile = <String>[];

    var currentPlayer = 0;
    var cardsPlayed = 0;
    var tricks = 0;

    final seenStates = <String>{};

    while (true) {
      final state = _stateKey(a, b, currentPlayer);

      if (seenStates.contains(state)) {
        return {
          'status': 'loop',
          'cards': cardsPlayed,
          'tricks': tricks,
        };
      }

      seenStates.add(state);

      var penalty = 0;
      var payer = -1;
      var paymentPlayer = -1;

      while (true) {
        final deck = currentPlayer == 0 ? a : b;

        // The current player has no card to play.
        if (deck.isEmpty) {
          final winner = 1 - currentPlayer;

          if (winner == 0) {
            a.addAll(pile);
          } else {
            b.addAll(pile);
          }

          pile.clear();
          tricks++;

          return {
            'status': 'finished',
            'cards': cardsPlayed,
            'tricks': tricks,
          };
        }

        final card = deck.removeAt(0);
        pile.add(card);
        cardsPlayed++;

        final payment = _paymentValue(card);

        if (payment != null) {
          // A face card starts a new penalty.
          penalty = payment;

          // The opponent must now pay.
          payer = 1 - currentPlayer;

          // Remember who played the face card.
          paymentPlayer = currentPlayer;

          currentPlayer = payer;
          continue;
        }

        // Normal number card.
        if (penalty > 0) {
          penalty--;

          if (penalty == 0) {
            // The player who played the last face card
            // wins the entire pile.
            final winner = paymentPlayer;

            if (winner == 0) {
              a.addAll(pile);
            } else {
              b.addAll(pile);
            }

            pile.clear();
            tricks++;

            currentPlayer = winner;

            if (a.isEmpty || b.isEmpty) {
              return {
                'status': 'finished',
                'cards': cardsPlayed,
                'tricks': tricks,
              };
            }

            break;
          }

          // The same player continues paying.
          currentPlayer = payer;
        } else {
          // Normal turn: switch players.
          currentPlayer = 1 - currentPlayer;
        }
      }
    }
  }

  int? _paymentValue(String card) {
    switch (card) {
      case 'J':
        return 1;
      case 'Q':
        return 2;
      case 'K':
        return 3;
      case 'A':
        return 4;
      default:
        return null;
    }
  }

  String _stateKey(
    List<String> a,
    List<String> b,
    int currentPlayer,
  ) {
    String deckState(List<String> deck) {
      final result = StringBuffer();

      for (final card in deck) {
        if (_paymentValue(card) != null) {
          // Keep A, K, Q, J.
          result.write(card);
        } else {
          // Number cards are ignored,
          // but their POSITION is preserved.
          result.write('-');
        }
      }

      return result.toString();
    }

    return '$currentPlayer|${deckState(a)}|${deckState(b)}';
  }
}