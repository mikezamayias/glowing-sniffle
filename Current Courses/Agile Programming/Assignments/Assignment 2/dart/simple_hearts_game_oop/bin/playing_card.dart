/// A class to represent a playing card.
///
/// Playing card has string attributes for its suit and rank.
///
/// It also has two getters, for the above attributes,
/// and a method "toString" to return a formatted string
/// for this card.
class PlayingCard {
  final String _playingCardSuit;  // Attribute
  final String _playingCardRank;  // Attribute

  PlayingCard(
    this._playingCardSuit,
    this._playingCardRank,
  );  // Constructor

  /// Gets playing card's suit attribute.
  String get playingCardSuit => _playingCardSuit;

  /// Gets playing card's rank attribute.
  String get playingCardRank => _playingCardRank;

  /// toString method returns this playing card as a 
  /// formatted string with its attributes.
  @override
  String toString() {
    return '$_playingCardRank of $_playingCardSuit';
  }
}
