class Camicia {
  Map<String, dynamic> simulateGame(
    List<String> playerA,
    List<String> playerB,
  ) {
    final a = List<String>.from(playerA);
    final b = List<String>.from(playerB);

    final pile = <String>[];

    var currentPlayer = 0; // 0 = A, 1 = B
    var cardsPlayed = 0;
    var tricks = 0;

    // A state is represented by both decks and whose turn it is.
    // Number cards are ignored when detecting loops.
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

      final result = _playRound(
        a,
        b,
        pile,
        currentPlayer,
        cardsPlayed,
      );

      cardsPlayed = result.cardsPlayed;
      currentPlayer = result.nextPlayer;

      if (result.finished) {
        return {
          'status': 'finished',
          'cards': cardsPlayed,
          'tricks': tricks + 1,
        };
      }

      if (result.trickWon) {
        tricks++;

        final winner = result.winner!;

        if (winner == 0) {
          a.addAll(pile);
        } else {
          b.addAll(pile);
        }

        pile.clear();

        // The player who collected the pile starts the next round.
        currentPlayer = winner;

        // If one player has all cards, the game is finished.
        if (a.isEmpty || b.isEmpty) {
          return {
            'status': 'finished',
            'cards': cardsPlayed,
            'tricks': tricks,
          };
        }
      }
    }
  }

  _RoundResult _playRound(
    List<String> a,
    List<String> b,
    List<String> pile,
    int startingPlayer,
    int cardsPlayed,
  ) {
    var currentPlayer = startingPlayer;

    // -1 means there is currently no payment.
    var penalty = 0;

    // Player who must currently pay the penalty.
    var payer = -1;

    // Player who played the last payment card.
    var lastPaymentPlayer = -1;

    while (true) {
      final deck = currentPlayer == 0 ? a : b;

      // Current player cannot play a card.
      if (deck.isEmpty) {
        final winner = 1 - currentPlayer;

        return _RoundResult(
          cardsPlayed: cardsPlayed,
          nextPlayer: winner,
          trickWon: true,
          winner: winner,
          finished: false,
        );
      }

      final card = deck.removeAt(0);
      pile.add(card);
      cardsPlayed++;

      final payment = _paymentValue(card);

      if (payment != null) {
        // A new payment card starts a new penalty.
        penalty = payment;
        payer = 1 - currentPlayer;
        lastPaymentPlayer = currentPlayer;

        // The player who played the payment card gets the next turn
        // to see whether the opponent can pay it.
        currentPlayer = payer;
        continue;
      }

      // Number card.
      if (penalty > 0) {
        penalty--;

        if (penalty == 0) {
          // The last payment player wins the pile.
          return _RoundResult(
            cardsPlayed: cardsPlayed,
            nextPlayer: lastPaymentPlayer,
            trickWon: true,
            winner: lastPaymentPlayer,
            finished: false,
          );
        }

        currentPlayer = 1 - currentPlayer;
      } else {
        // Normal play: switch players.
        currentPlayer = 1 - currentPlayer;
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
    // Number cards are intentionally normalized to the same value
    // because their actual values don't matter for loop detection.
    String normalize(List<String> deck) {
      return deck.map((card) {
        if (_paymentValue(card) != null) {
          return card;
        }
        return 'N';
      }).join(',');
    }

    return '${currentPlayer}|${normalize(a)}|${normalize(b)}';
  }
}

class _RoundResult {
  final int cardsPlayed;
  final int nextPlayer;
  final bool trickWon;
  final int? winner;
  final bool finished;

  _RoundResult({
    required this.cardsPlayed,
    required this.nextPlayer,
    required this.trickWon,
    required this.winner,
    required this.finished,
  });
}