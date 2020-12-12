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

  @override
  void showHand() {
    /// Shows player's hand
  }

  Hand get hand => _hand;

  set hand(Hand value) {
    _hand = value;
  }

  @override
  void introduceSelf() {
    print(super.toString() + ', "$userName"');
  }
}
