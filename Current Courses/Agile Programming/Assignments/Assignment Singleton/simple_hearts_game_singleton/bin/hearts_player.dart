import 'cards_player.dart';
import 'hand.dart';
import 'human.dart';

/// A class to represent a hearts player.
///
/// A hearts player has first and last name, age, username
/// hand and points.
///
/// The class has 2 getters, for this username and this hand.
///
/// There are also 2 methods,
/// countHeartsLastRound, counts number of Hearts in
/// player's hand in the last round and
/// countHearts, counts number of Hearts in player's hand.
///
/// Also overrides methods in Human abstract class and
/// CardsPlayer interface.
class HeartsPlayer extends Human implements CardsPlayer {
  late String _userName; // Attribute
  late Hand _hand = Hand(); // Attribute
  late int _points; // Attribute

  HeartsPlayer() : super() {
    _points = 0;
  } // Constructor

  String get userName => this._userName; // getter for _userName attribute
  set userName(String value) =>
      this._userName = value; // setter for _userName attribute

  Hand get hand => this._hand; // getter for _hand attribute
  set hand(Hand value) => this._hand = value; // setter for _hand attribute

  int get points => this._points; // getter for _points attribute
  set points(int value) => this._points = value; // setter for _points attribute

  /// Counts Hearts in last round, or in the last 5 cards.
  int countHeartsLastRound() {
    return _hand.playingCards
        .sublist(_hand.handSize() - 5, _hand.handSize())
        .where((card) => card.playingCardSuit == 'Hearts')
        .length;
  }

  /// Counts Hearts in this hand.
  int countHearts() {
    return _hand.playingCards
        .where((card) => card.playingCardSuit == 'Hearts')
        .length;
  }

  /// Introduces this player.
  @override
  void introduceSelf() {
    print(super.toString() + ', "$_userName"');
  }

  /// Shows this player's hand.
  @override
  void showHand() {
    print(_userName);
    for (var playingCard in _hand.playingCards) {
      print(playingCard.toString());
    }
  }
}
