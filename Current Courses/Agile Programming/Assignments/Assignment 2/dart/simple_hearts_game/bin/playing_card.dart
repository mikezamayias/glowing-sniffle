class PlayingCard {
  final String _playingCardSuit;
  final String _playingCardRank;

  PlayingCard(
    this._playingCardSuit,
    this._playingCardRank,
  );

  String get playingCardSuit => _playingCardSuit;

  String get playingCardRank => _playingCardRank;

  @override
  String toString() {
    return '$_playingCardRank of $_playingCardSuit';
  }
}
