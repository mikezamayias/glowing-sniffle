import 'card.dart';

abstract class CardsDealer {
  void showDeck();

  PlayingCard dealRandomCard();

  void dealToPlayers();

  void decideWinner();
}
