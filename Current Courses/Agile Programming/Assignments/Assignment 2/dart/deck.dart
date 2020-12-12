import 'dart:math';

import 'card.dart';
import 'constants.dart';

class Deck {
  List<PlayingCard> _playingCards = [];

  Deck() {
    PlayingCard playingCard;
    for (String playingCardSuit in playingCardSuits) {
      for (String playingCardRank in playingCardRanks) {
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
    _playingCards.shuffle(new Random());
  }
}
