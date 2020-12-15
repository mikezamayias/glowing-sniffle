import 'playing_card.dart';

class Hand {
  List<PlayingCard> _playingCards = [];

  Hand();

  List<PlayingCard> get playingCards => _playingCards;

  void addPlayingCard(PlayingCard playingCard) {
    _playingCards.add(playingCard);
  }
}
