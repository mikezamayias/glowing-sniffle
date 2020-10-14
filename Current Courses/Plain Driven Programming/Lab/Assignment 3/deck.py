from card import Card


class Deck:
    """
    A class to represent a Deck (of playing cards)

    Attributes
    ----------
    cards: list
        Playing cards deck

    Methods
    -------
    get_deck -> list
        Gets a list of dictionaries each containing the card's suit and number for each card in deck
    get_number_of_remaining_cards -> int
        Gets the number of remaining cards in deck
    create_deck() -> None
        Creates instances of Card type and populates the deck with them
    add_card(card: Card) -> None
        Appends card, a Card instance, to the deck
    remove_card(card: Card) -> None
        Removes card, a Card instance, from the deck
    """

    def __init__(self) -> None:
        """
        Constructor of Deck class

        Parameters
        ----------
        cards: list
            The deck of cards as a list
        """
        self.cards = []

    @property
    def get_deck(self) -> list:
        """
        Gets a list of dictionaries each containing the card's suit and number for each card in deck

        Returns:
            list: of dictionaries each containing the card's suit and number for each card in deck
        """
        return [card.get_card() for card in self.cards]

    @property
    def get_number_of_remaining_cards(self) -> int:
        """
        Gets the number of remaining cards in deck

        Returns:
            int: The deck's length
        """
        return len(self.cards)

    def create_deck(self) -> None:
        """
        Creates instances of Card type and populates the deck with them
        """
        for suit in ['Clubs', 'Spades', 'Diamonds', 'Hearts']:
            for number in ['Ace'] + [f'{i}' for i in range(2, 11)] + ['Jack', 'Queen', 'King']:
                self.add_card(Card(suit, number))

    def add_card(self, card: Card) -> None:
        """
        Appends card, a Card instance, to the deck

        Args:
            card (Card): a Card instance
        """
        if card not in self.cards:
            self.cards.append(card)

    def remove_card(self, card: Card) -> None:
        """
        Removes card, a Card instance, from the deck

        Args:
            card (Card): a Card instance
        """
        if card in self.cards:
            self.cards.remove(card)
