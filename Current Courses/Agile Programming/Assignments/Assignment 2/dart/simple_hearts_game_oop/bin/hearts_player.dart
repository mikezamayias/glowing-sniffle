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
  final String _userName; // Attribute
  final Hand _hand = Hand(); // Attribute
  int points; // Attribute

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
  } // Constructor

  /// Getter for this username.
  String get userName => _userName;

  /// Getter for this hand.
  Hand get hand => _hand;

  /// Counts Hearts in last round, or in the last 5 cards.
  int countHeartsLastRound() {
    return hand.playingCards
        .sublist(hand.handSize() - 5, hand.handSize())
        .where((card) => card.playingCardSuit == 'Hearts')
        .length;
  }

  /// Counts Hearts in this hand.
  int countHearts() {
    return hand.playingCards
        .where((card) => card.playingCardSuit == 'Hearts')
        .length;
  }

  /// Introduces this player.
  @override
  void introduceSelf() {
    print(super.toString() + ', "$userName"');
  }

  /// Shows this player's hand.
  @override
  void showHand() {
    print(userName);
    for (var playingCard in hand.playingCards) {
      print(playingCard.toString());
    }
  }
}
