# Import modules
from card import Card
from random import shuffle


class Deck:
    """
    A class to represent a Deck (of playing cards)

    Variables
    ---------
    number_of_cards: int
        The number of cards to deal to players

    Attributes
    ----------
    cards: list
        The playing cards deck, as a list

    Methods
    -------
    create_deck()
        Creates instances of Card type and populates the deck with them
    add_card(card: Card)
        Appends card, a Card instance, to the deck
    remove_card(card: Card)
        Removes card, a Card instance, from the deck
    get_deck()
        Returns a list of dictionaries each containing the card's suit and number for each card in deck
    shuffle_deck()
        Shuffles deck in place, using the shuffle method from module random
    distribute_cards(players_list: list, number_of_cards: int)
        Distribute cards to players and remove distributed cards from deck
    get_number_of_remaining_cards()
        Return the number of remaining cards in deck
    """

    # Number of cards to deal
    number_of_cards = 5

    def __init__(self):
        """
        The constructor of Deck class

        Parameters
        ----------
        cards: list
            The deck of cards as a list
        """
        self.cards = []

    def create_deck(self):
        """
        Creates instances of Card type and populates the deck with them
        """
        for suit in ['Clubs', 'Spades', 'Diamonds', 'Hearts']:
            for number in ['Ace'] + [f'{i}' for i in range(2, 11)] + ['Jack', 'Queen', 'King']:
                self.add_card(Card(suit, number))

    def add_card(self, card: Card):
        """
        Appends card, a Card instance, to the deck

        Args:
            card (Card): a Card instance
        """
        self.cards.append(card)

    def remove_card(self, card: Card):
        """
        Removes card, a Card instance, from the deck

        Args:
            card (Card): a Card instance
        """
        self.cards.remove(card)

    def get_deck(self) -> list:
        """
        Returns a list of dictinaries each containing the card's suit and number for each card in deck

        Returns:
            list: of dictinaries each containing the card's suit and number for each card in deck
        """
        return [card.get_card() for card in self.cards]

    def shuffle_deck(self):
        """
        Shuffles deck in place, using the shuffle method from module random
        """
        shuffle(self.cards)

    def deal_cards(self, players_list: list, number_of_cards: int):
        """
        Distribute cards to players and remove dealt cards from deck

        Args:
            players_list (list): A list of players, instances of Players
            number_of_cards (int): The number of cards to deal
        """
        for player in players_list:
            for _ in range(number_of_cards):
                player.take_card(self.cards[0])
                self.remove_card(self.cards[0])

    def get_number_of_remaining_cards(self) -> int:
        """
        Return the number of remaininng cards in deck

        Returns:
            int: The deck's length
        """
        return len(self.cards)
