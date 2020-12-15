import 'playing_card.dart';
import 'hearts_player.dart';

abstract class CardsDealer {
  void showDeck();

  PlayingCard dealCard();

  void dealToPlayers(HeartsPlayer player1, HeartsPlayer player2);

  void decideWinner(HeartsPlayer player1, HeartsPlayer player2);
}
