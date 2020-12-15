import 'playing_card.dart';
import 'cards_player.dart';
import 'hand.dart';
import 'human.dart';

class HeartsPlayer extends Human implements CardsPlayer {
  String _userName;
  Hand _hand = new Hand();

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  int points;

  HeartsPlayer(
    String firstName,
    String lastName,
    int age,
    String this._userName,
  ) : super(
          firstName,
          lastName,
          age,
        ) {
    points = 0;
  }

  Hand get hand => _hand;

  set hand(Hand value) {
    _hand = value;
  }

  @override
  void showHand() {
    /// Shows player's hand
    print(this.userName);
    for (PlayingCard playingCard in this.hand.playingCards) {
      print(playingCard.toString());
    }
  }

  int countHeartsLastRound() {
    return this
        .hand
        .playingCards
        .sublist(this.hand.playingCards.length - 5, this.hand.playingCards.length)
        .where((card) => card.playingCardSuit == 'Hearts')
        .length;
  }

  int countHearts() {
    return this.hand.playingCards.where((card) => card.playingCardSuit == 'Hearts').length;
  }

  @override
  void introduceSelf() {
    print(super.toString() + ', "$userName"');
  }
}
