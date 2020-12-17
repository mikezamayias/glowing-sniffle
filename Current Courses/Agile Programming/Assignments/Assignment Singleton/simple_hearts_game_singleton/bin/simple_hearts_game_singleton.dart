import 'hearts_dealer_singleton.dart';
import 'hearts_player.dart';

void main(List<String> args) {
  /// Creates a hearts dealer object.
  var dealer = HeartsDealerSingleton();
  dealer.firstName = 'Nick';
  dealer.lastName = 'Fury';
  dealer.age = 66;

  /// Creates a hearts player object.
  var player1 = HeartsPlayer();
  player1.firstName = 'Captain';
  player1.lastName = 'America';
  player1.age = 102;
  player1.userName = 'Steve Rogers';

  /// Creates another hearts player object.
  var player2 = HeartsPlayer();
  player2.firstName = 'Iron';
  player2.lastName = 'Man';
  player2.age = 50;
  player2.userName = 'Tony Stark';

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
