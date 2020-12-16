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

  int countHeartsLastRound() {
    /// Counts Hearts in last round, or in the last 5 cards.
    return hand.playingCards
        .sublist(hand.handSize() - 5, hand.handSize())
        .where((card) => card.playingCardSuit == 'Hearts')
        .length;
  }

  int countHearts() {
    /// Counts Hearts in this hand.
    return hand.playingCards
        .where((card) => card.playingCardSuit == 'Hearts')
        .length;
  }

  @override
  void introduceSelf() {
    /// Introduces this player.
    print(super.toString() + ', "$userName"');
  }

  @override
  void showHand() {
    /// Shows this player's hand.
    print(userName);
    for (var playingCard in hand.playingCards) {
      print(playingCard.toString());
    }
  }
}
