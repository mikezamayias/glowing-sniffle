import 'dart:math';

void main(List<String> args) {
  // A set for card's suits
  var suits = <String>{'Hearts', 'Diamonds', 'Clubs', 'Spades'};
  // A set for card's numbers
  var numbers = <String>{
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
  // Create deck of cards
  var deck = createDeck(suits, numbers);
  // Create player 1's hand
  var player1 = createPlayerHand();
  // Create player 2's hand
  var player2 = createPlayerHand();
  // Deal cards to player 1
  dealCardsToPlayer(deck, player1);
  // Deal cards to player 2
  dealCardsToPlayer(deck, player2);
  // Decide who won, if any
  decideWinner(player1, player2);
}

List<String> createPlayerHand({int playerHandSize = 5}) {
  var hand = <String>[];
  for (var i = 0; i < playerHandSize; i++) {
    hand.add('');
  }
  return hand;
}

List<String> createDeck(Set<String> suits, Set<String> numbers) {
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
  for (var i = 0; i < playerHandSize; i++) {
    var randomIndex = Random().nextInt(deck.length);
    var tempCard = deck.elementAt(randomIndex);
    playerHand.insert(i, tempCard);
    deck.remove(tempCard);
  }
}

int playerHeartsCounter(List<String> playerHand) {
  var counter = 0;
  for (var i = 0; i < playerHand.length; i++) {
    if (playerHand[i].contains('Hearts')) {
      counter++;
    }
  }
  return counter;
}

void decideWinner(List<String> player1Hand, List<String> player2Hand) {
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
