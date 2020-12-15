import 'playing_card.dart';
import 'cards_dealer.dart';
import 'deck.dart';
import 'hearts_player.dart';
import 'human.dart';

class HeartsDealer extends Human implements CardsDealer {
  Deck deck = new Deck();

  HeartsDealer(
    String firstName,
    String lastName,
    int age,
  ) : super(
          firstName,
          lastName,
          age,
        );

  void shuffleDeck() {
    deck.playingCards.shuffle();
  }

  void decideRoundWinner(HeartsPlayer player1, HeartsPlayer player2,
      [int round = 0]) {
    /// Decides who won the round, if any
    int player1HeartsNumberLastRound = player1.countHeartsLastRound();
    int player2HeartsNumberLastRound = player2.countHeartsLastRound();
    int difference =
        player1HeartsNumberLastRound - player2HeartsNumberLastRound;
    if (difference != 0) {
      if (difference > 0) {
        player1.points += difference * 10;
      } else {
        player2.points += -1 * difference * 10;
      }
    }
  }

  @override
  void introduceSelf() {
    print(super.toString());
  }

  @override
  void showDeck() {
    /// Shows remaining playing cards in deck
    for (PlayingCard playingCard in deck.playingCards) {
      print(playingCard.toString());
    }
  }

  @override
  PlayingCard dealCard() {
    /// Returns first playing card from shuffled deck
    PlayingCard playingCard = deck.playingCards.first;
    // Remove this playing card from deck
    deck.playingCards.remove(playingCard);
    // Return the random playing card
    return playingCard;
  }

  @override
  void dealToPlayers(HeartsPlayer player1, [HeartsPlayer player2]) {
    /// Deals 10 cards to players
    for (int i = 0; i < 5; i++) {
      player1.hand.addPlayingCard(dealCard());
      player2.hand.addPlayingCard(dealCard());
    }
  }

  @override
  void decideWinner(HeartsPlayer player1, HeartsPlayer player2) {
    /// Decides who won the game, if any
    if (player1.points == player2.points) {
      print('It\'s a tie!');
    } else {
      if (player1.points > player2.points) {
        print(player1.userName + ' wins!');
      } else {
        print(player2.userName + ' wins!');
      }
    }
  }
}
