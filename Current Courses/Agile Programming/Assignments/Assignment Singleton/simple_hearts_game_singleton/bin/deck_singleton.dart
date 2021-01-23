import 'playing_card.dart';
import 'constants.dart';

class DeckSingleton {
  static List<PlayingCard> playingCards = [];

  late final DeckSingleton _instance;

  DeckSingleton() {
    _instance;
    createDeck();
  }

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
