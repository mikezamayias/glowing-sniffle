import 'cards_player.dart';
import 'hand.dart';
import 'human.dart';

class HeartsPlayer extends Human implements CardsPlayer {
  final String _userName;
  final Hand _hand = Hand();
  int points;

  HeartsPlayer(
    String firstName,
    String lastName,
    int age,
    this._userName,
  ) : super(
          firstName,
          lastName,
          age,
        ) {
    points = 0;
  }

  String get userName => _userName;

  Hand get hand => _hand;

  int countHeartsLastRound() {
    return hand.playingCards
        .sublist(hand.handSize() - 5, hand.handSize())
        .where((card) => card.playingCardSuit == 'Hearts')
        .length;
  }

  int countHearts() {
    return hand
        .playingCards
        .where((card) => card.playingCardSuit == 'Hearts')
        .length;
  }

  @override
  void introduceSelf() {
    print(super.toString() + ', "$userName"');
  }

  @override
  void showHand() {
    print(userName);
    for (var playingCard in hand.playingCards) {
      print(playingCard.toString());
    }
  }
}
