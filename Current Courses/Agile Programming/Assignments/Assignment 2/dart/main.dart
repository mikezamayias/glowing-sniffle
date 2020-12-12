import 'hearts_dealer.dart';
import 'hearts_player.dart';

main(List<String> args) {
  HeartsDealer dealer = new HeartsDealer(
    'Nick',
    'Fury',
    66,
  );

  HeartsPlayer player1 = new HeartsPlayer(
    'Captain',
    'America',
    102,
    'Steve Rogers',
  );

  HeartsPlayer player2 = new HeartsPlayer(
    'Iron',
    'Man',
    50,
    'Tony Stark',
  );

  dealer.introduceSelf();
  player1.introduceSelf();
  player2.introduceSelf();
}
