class PlayingCard {
  String _playingCardSuit;
  String _playingCardRank;

  String get playingCardSuit {
    return _playingCardSuit;
  }

  set playingCardSuit(String playingCardSuit) {
    _playingCardSuit = playingCardSuit;
  }

  String get playingCardRank => _playingCardRank;

  set playingCardRank(String playingCardRank) {
    _playingCardRank = playingCardRank;
  }

  PlayingCard(
    this._playingCardSuit,
    this._playingCardRank,
  );

  @override
  String toString() {
    return '$_playingCardRank of $_playingCardSuit';
  }
}
