import 'dart:math';

import 'card.dart';
import 'cards_dealer.dart';
import 'deck.dart';
import 'human.dart';

class HeartsDealer extends Human implements CardsDealer {
  Deck deck = new Deck();
  Duration timer_duration;

  HeartsDealer(
    String firstName,
    String lastName,
    int age,
  ) : super(
          firstName,
          lastName,
          age,
        ) {
    deck.shuffle();
    timer_duration = Duration(minutes: 5);
  }

  @override
  void introduceSelf() {
    print(super.toString());
  }

  @override
  void showDeck() {
    /// Shows remaining playing cards in deck
    for (PlayingCard playingCard in deck.playingCards) {
      print(playingCard.toString());
    }
  }

  @override
  PlayingCard dealRandomCard() {
    /// Returns a random playing card
    // Random number in range 0 and deck.playingCards.length
    int randomDeckIndex = Random().nextInt(deck.playingCards.length);
    // Choose a random playing card from deck
    PlayingCard playingCard = deck.playingCards[randomDeckIndex];
    // Remove this playing card from deck
    deck.playingCards.remove(playingCard);
    // Return the random playing card
    return playingCard;
  }

  @override
  void dealToPlayers() {
    /// Deals cards to players
  }

  @override
  void decideWinner() {
    /// Decides who is the winner, if any
  }
}
