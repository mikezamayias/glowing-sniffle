/// A class to represent the playing card.
///
/// The playing card has string variables for its suit
/// and rank attributes.
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
