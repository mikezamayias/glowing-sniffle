import 'dart:math' show Random;
import 'playing_card.dart';
import 'constants.dart';

/// A class to represent deck of playing cards.
///
/// Deck has a playing cards list attribute.
///
/// It also has a getter and one method, 
/// shuffle which shuffles the deck.
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
  } // Constructor

  /// Gets deck's playing cards.
  List<PlayingCard> get playingCards => _playingCards;

  /// Shuffles deck.
  void shuffle() {
    _playingCards.shuffle(Random());
  }
}
