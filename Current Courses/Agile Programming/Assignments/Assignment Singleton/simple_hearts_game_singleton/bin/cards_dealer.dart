import 'playing_card.dart';
import 'hearts_player.dart';

/// Interface CardsDealer.
///
/// An interface to be implemented by the dealer of the game.
abstract class CardsDealer {
  /// Shows the deck of cards.
  void showDeck();

  /// Deals a card.
  PlayingCard dealCard();

  /// Deals cards to players.
  void dealToPlayers(HeartsPlayer player1, HeartsPlayer player2);

  /// Decides the game winner.
  void decideWinner(HeartsPlayer player1, HeartsPlayer player2);
}
