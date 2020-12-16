import 'hearts_dealer.dart';
import 'hearts_player.dart';

void main(List<String> args) {
  /// Creates a hearts dealer object.
  var dealer = HeartsDealer(
    'Nick',
    'Fury',
    66,
  );

  /// Creates a hearts player object.
  var player1 = HeartsPlayer(
    'Captain',
    'America',
    102,
    'Steve Rogers',
  );

  /// Creates another hearts player object.
  var player2 = HeartsPlayer(
    'Iron',
    'Man',
    50,
    'Tony Stark',
  );

  /// Dealer shuffles deck.
  dealer.shuffleDeck();

  /// Play five rounds.
  for (var i = 0; i < 5; i++) {
    dealer.dealToPlayers(player1, player2);
    dealer.decideRoundWinner(player1, player2, i);
  }

  /// Decide game winner.
  dealer.decideWinner(player1, player2);
}
