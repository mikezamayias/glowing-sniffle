import 'dart:math' show Random;
import 'playing_card.dart';
import 'constants.dart';

class Deck {
  final List<PlayingCard> _playingCards = [];

  Deck() {
    PlayingCard playingCard;
    for (var playingCardSuit in playingCardSuits) {
      for (var playingCardRank in playingCardRanks) {
        playingCard = PlayingCard(
          playingCardSuit,
          playingCardRank,
        );
        _playingCards.add(playingCard);
      }
    }
  }

  List<PlayingCard> get playingCards => _playingCards;

  void shuffle() {
    _playingCards.shuffle(Random());
  }
}
