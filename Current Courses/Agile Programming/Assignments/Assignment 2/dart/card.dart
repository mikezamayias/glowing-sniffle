class PlayingCard {
  String playingCardSuit;
  String playingCardRank;

  PlayingCard(
    this.playingCardSuit,
    this.playingCardRank,
  );

  @override
  String toString() {
    return '$playingCardRank of $playingCardSuit';
  }
}
