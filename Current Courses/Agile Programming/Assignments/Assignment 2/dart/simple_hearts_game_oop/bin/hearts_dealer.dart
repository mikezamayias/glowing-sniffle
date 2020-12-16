import 'playing_card.dart';
import 'cards_dealer.dart';
import 'deck.dart';
import 'hearts_player.dart';
import 'human.dart';

/// A class to represent a hearts dealer.
///
/// A hearts dealer has first and last name, age and a deck
/// of cards.
///
/// Has 2 mothods of their own,
/// shuffleDeck, shuffles this deck and
/// decideRoundWinner, decided who won the round.
/// 
/// Also overrides methods in Human abstract class and
/// CardsDealer interface.
class HeartsDealer extends Human implements CardsDealer {
  Deck deck = Deck(); // Attribute

  HeartsDealer(
    String firstName,
    String lastName,
    int age,
  ) : super(
          firstName,
          lastName,
          age,
        ); // Constructor

  void shuffleDeck() {
    /// Shuffles this deck.
    deck.playingCards.shuffle();
  }

  void decideRoundWinner(HeartsPlayer player1, HeartsPlayer player2,
      [int round = 0]) {
    /// Decides who won this round, if any, by giving points to the winner.
    var player1HeartsNumberLastRound = player1.countHeartsLastRound();
    var player2HeartsNumberLastRound = player2.countHeartsLastRound();
    var difference =
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
    /// Introduces dealer.
    print(super.toString());
  }

  @override
  void showDeck() {
    /// Shows remaining playing cards in deck.
    for (var playingCard in deck.playingCards) {
      print(playingCard.toString());
    }
  }

  @override
  PlayingCard dealCard() {
    /// Deals upper most card to player
    var playingCard = deck.playingCards.first; // This playing card.
    deck.playingCards.remove(playingCard); // Removes this card from deck.
    return playingCard; // Returns the card
  }

  @override
  void dealToPlayers(HeartsPlayer player1, [HeartsPlayer player2]) {
    /// Deals 10 cards to players.
    for (var i = 0; i < 5; i++) {
      player1.hand.addPlayingCard(dealCard());
      player2.hand.addPlayingCard(dealCard());
    }
  }

  @override
  void decideWinner(HeartsPlayer player1, HeartsPlayer player2) {
    /// Decides the winner of the game, if any.
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
