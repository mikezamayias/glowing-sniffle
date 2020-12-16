import 'playing_card.dart';

/// A class to represent player's hand.
///
/// Player's hand has a playing cards list attribute.
///
/// It also has a getter two methods,
/// addPlayingCard to add a playing card to the
/// hand and handSize to get the hand size.
class Hand {
  final List<PlayingCard> _playingCards = []; // Attribute

  Hand(); // Constructor

  /// Gets hand's playing cards.
  List<PlayingCard> get playingCards => _playingCards;

  /// Adds card to hand.
  void addPlayingCard(PlayingCard playingCard) {
    _playingCards.add(playingCard);
  }

  /// Returns hand's size.
  int handSize() => _playingCards.length;
}
