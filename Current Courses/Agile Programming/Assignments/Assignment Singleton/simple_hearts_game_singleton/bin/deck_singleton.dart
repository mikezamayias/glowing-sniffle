import 'playing_card.dart';
import 'constants.dart';

class DeckSingleton {
  static List<PlayingCard> playingCards = [];

  static DeckSingleton _instance;
  DeckSingleton._internal() {
    _instance = this;
    createDeck();
  }
  factory DeckSingleton() => _instance ?? DeckSingleton._internal();

  void createDeck() {
    for (var playingCardSuit in playingCardSuits) {
      for (var playingCardRank in playingCardRanks) {
        playingCards.add(PlayingCard(playingCardSuit, playingCardRank));
      }
    }
  }

  void shuffle() {
    playingCards.shuffle();
  }
}
