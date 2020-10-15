from random import shuffle, choice

from card import Card
from deck import Deck
from human import Human
from player import HeartsPlayer


class HeartsDealer(Human):
    """
    A subclass of Human, HeartsDealer to represent a human dealer.

    Arguments
    ---------
        Human (type): a class to represent a Human

    Attributes, inherited from parent class
    ----------
    first_name: str
        Player's first name
    last_name: str
        Player's last name
    age: int
        Player's age

    Methods
    -------
    show_deck() -> None
        Prints deck
    deal_random_card() -> Card
        Deals a random card from deck
    deal_to_players() -> None
        Deals cards to players
    count_player_hearts() -> int
        Counts player's Hearts
    count_player_points() -> None
        Counts and sets players' points
    decide_winner() -> None
        Prints the game result
    """

    def __init__(self, first_name, last_name, age) -> None:
        """
        Constructor for Human class

        Parameters
        ----------
        first_name: str
            Player's first name
        last_name: str
            Player's last name
        age: int
            Player's age
        """
        super().__init__(first_name, last_name, age)
        self.deck = Deck()
        self.deck.create_deck()
        self.cards_to_deal = 5

    def show_deck(self) -> None:
        """
        Prints deck
        """
        for card in self.deck.cards:
            print(card.get_card)

    def deal_random_card(self) -> Card:
        """
        Deals a random card from deck

        Returns
        -------
        card
        """
        card = choice(self.deck.cards)
        self.deck.remove_card(card)
        return card

    def deal_to_players(self, player1: HeartsPlayer, player2: HeartsPlayer) -> None:
        """
        Deals cards to players

        Parameters
        ----------
        player1: HeartsPlayer
            Player 1
        player2: HeartsPlayer
            Player 2
        """
        shuffle(self.deck.cards)
        for _ in range(self.cards_to_deal):
            for player in [player1, player2]:
                card = self.deck.cards[0]
                player.set_hand(card)
                self.deck.remove_card(card)

    @staticmethod
    def count_player_hearts(player: HeartsPlayer) -> int:
        """
        Counts player's Hearts

        Parameters
        ----------
        player: HeartsPlayer
            Player

        Returns
        -------
        heart_counter: int
            Number of Hearts in Player's hand
        """
        heart_counter = 0
        for card in player.get_hand:
            if card.is_heart:
                heart_counter += 1
        return heart_counter

    def count_player_points(self, player1: HeartsPlayer, player2: HeartsPlayer) -> None:
        """
        Counts and sets players' points

        Parameters
        ----------
        player1: HeartsPlayer
            Player 1
        player2: HeartsPlayer
            Player 2
        """
        player1_hearts = self.count_player_hearts(player1)
        player2_hearts = self.count_player_hearts(player2)
        hearts_difference = player1_hearts - player2_hearts
        if hearts_difference > 0:
            player1.set_points(hearts_difference * 10)
        elif hearts_difference < 0:
            player2.set_points(-1 * hearts_difference * 10)
        else:
            pass

    @staticmethod
    def decide_winner(player1: HeartsPlayer, player2: HeartsPlayer) -> None:
        """
        Decides winner

        Parameters
        ----------
        player1: HeartsPlayer
            Player 1
        player2: HeartsPlayer
            Player 2
        """
        if player1.get_points > player2.get_points:
            print(
                f"{player1.get_nickname} wins {player2.get_nickname}, {player1.get_points} to {player2.get_points}.")
        elif player2.get_points > player1.get_points:
            print(
                f"{player2.get_nickname} wins {player1.get_nickname}, {player2.get_points} to {player1.get_points}.")
        else:
            print(
                f"Both {player1.get_nickname} and {player2.get_nickname} have the same amount of Hearts, no winner.")
