import 'hearts_dealer.dart';
import 'hearts_player.dart';

void main(List<String> args) {
  var dealer = HeartsDealer(
    'Nick',
    'Fury',
    66,
  );

  var player1 = HeartsPlayer(
    'Captain',
    'America',
    102,
    'Steve Rogers',
  );

  var player2 = HeartsPlayer(
    'Iron',
    'Man',
    50,
    'Tony Stark',
  );

  dealer.shuffleDeck();

  for (var i = 0; i < 5; i++) {
    dealer.dealToPlayers(player1, player2);
    dealer.decideRoundWinner(player1, player2, i);
  }

  dealer.decideWinner(player1, player2);
}
