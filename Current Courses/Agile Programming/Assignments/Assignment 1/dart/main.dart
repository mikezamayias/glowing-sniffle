import 'dart:math';

main(List<String> args) {
  // A set for card's suits
  Set<String> suits = {'Hearts', 'Diamonds', 'Clubs', 'Spades'};
  // A set for card's numbers
  Set<String> numbers = {
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
  List<String> deck = createDeck(suits, numbers);
  // Create player 1's hand
  List<String> player1 = createPlayerHand();
  // Create player 2's hand
  List<String> player2 = createPlayerHand();
  // Deal cards to player 1
  dealCardsToPlayer(deck, player1);
  // Deal cards to player 2
  dealCardsToPlayer(deck, player2);
  // Decide who won, if any
  decideWinner(player1, player2);
}

List<String> createPlayerHand({int playerHandSize = 5}) {
  List<String> hand = [];
  for (int i = 0; i < playerHandSize; i++) {
    hand.add('');
  }
  return hand;
}

List<String> createDeck(Set<String> suits, Set<String> numbers) {
  List<String> deck = [];
  for (String suit in suits) {
    for (String number in numbers) {
      deck.add('$number of $suit');
    }
  }
  return deck;
}

void dealCardsToPlayer(List<String> deck, List<String> playerHand,
    {int playerHandSize = 5}) {
  for (int i = 0; i < playerHandSize; i++) {
    int randomIndex = Random().nextInt(deck.length);
    String tempCard = deck.elementAt(randomIndex);
    playerHand.insert(i, tempCard);
    deck.remove(tempCard);
  }
}

int playerHeartsCounter(List<String> playerHand) {
  int counter = 0;
  for (int i = 0; i < playerHand.length; i++) {
    if (playerHand[i].contains('Hearts')) {
      counter++;
    }
  }
  return counter;
}

void decideWinner(List<String> player1Hand, List<String> player2Hand) {
  int player1Hearts = playerHeartsCounter(player1Hand);
  int player2Hearts = playerHeartsCounter(player2Hand);
  if (player1Hearts > player2Hearts) {
    print('Player 1 wins!');
  } else if (player2Hearts > player1Hearts) {
    print('Player 2 wins!');
  } else {
    print('It\'s tie!');
  }
}
