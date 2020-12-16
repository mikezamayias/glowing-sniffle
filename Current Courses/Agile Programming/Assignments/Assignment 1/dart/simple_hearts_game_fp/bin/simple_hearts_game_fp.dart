import 'dart:math';

void main(List<String> args) {
  /// A set of playing card's suits.
  var suits = <String>{'Hearts', 'Diamonds', 'Clubs', 'Spades'};

  /// A set of playing card's ranks.
  var ranks = <String>{
    'Ace',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten',
    'Jack',
    'Queen',
    'King'
  };

  /// Deck of playing cards.
  var deck = createDeck(suits, ranks);

  /// Player 1's hand.
  var player1 = createPlayerHand();

  /// Player 2's hand.
  var player2 = createPlayerHand();

  /// Deals playing cards to player 1.
  dealCardsToPlayer(deck, player1);

  /// Deals playing cards to player 2.
  dealCardsToPlayer(deck, player2);

  // Decides who won, if any
  decideWinner(player1, player2);
}

List<String> createPlayerHand({int playerHandSize = 5}) {
  /// Creates a hand for player.
  ///
  /// Creates an empty list of empty strings and it returns it.
  /// The list size is 5 by default, except otherwise.
  var hand = <String>[];
  for (var i = 0; i < playerHandSize; i++) {
    hand.add('');
  }
  return hand;
}

List<String> createDeck(Set<String> suits, Set<String> numbers) {
  /// Creates a deck of playing cards.
  ///
  /// Creates an empty string list and then iterates through
  /// the sets of suits and ranks, adding a string to the deck
  /// on each iteration. After all iterations have finished,
  /// it returns it.
  var deck = <String>[];
  for (var suit in suits) {
    for (var number in numbers) {
      deck.add('$number of $suit');
    }
  }
  return deck;
}

void dealCardsToPlayer(List<String> deck, List<String> playerHand,
    {int playerHandSize = 5}) {
  /// Deals playing cards to players
  ///
  /// Iterates through player's hand and at each iteration
  /// a random integer is generated from the size of the remaining
  /// cards in deck. This random integer marks which card from the
  /// deck will be added to player's hand and then it'll be removed
  /// from the deck.
  for (var i = 0; i < playerHandSize; i++) {
    var randomIndex = Random().nextInt(deck.length);
    var tempCard = deck.elementAt(randomIndex);
    playerHand.insert(i, tempCard);
    deck.remove(tempCard);
  }
}

int playerHeartsCounter(List<String> playerHand) {
  /// Counts how many cards there are in player's hand.
  ///
  /// Iterates through player's hand and at each iteration it
  /// check if there is a Hearts card. If there is, a counter
  /// is incremented. After all the iterations have finished,
  /// it returns the counter.
  var counter = 0;
  for (var i = 0; i < playerHand.length; i++) {
    if (playerHand[i].contains('Hearts')) {
      counter++;
    }
  }
  return counter;
}

void decideWinner(List<String> player1Hand, List<String> player2Hand) {
  /// Decides the winner of the game.
  ///
  /// Counts for Hearts in each player's hand and then checks who
  /// has the most cards. A player wins if they have more Hearts 
  /// in their hand than their opponent. It's a tie if both players 
  /// have the same number of hearts in their hand.
  var player1Hearts = playerHeartsCounter(player1Hand);
  var player2Hearts = playerHeartsCounter(player2Hand);
  if (player1Hearts > player2Hearts) {
    print('Player 1 wins!');
  } else if (player2Hearts > player1Hearts) {
    print('Player 2 wins!');
  } else {
    print('It\'s tie!');
  }
}
