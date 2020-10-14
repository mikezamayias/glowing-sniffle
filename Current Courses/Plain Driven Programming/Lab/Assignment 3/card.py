class Card:
    """
    A class used to represent a (playing) Card

    Attributes
    ----------
    suit: str
        Card's suit
    number: str
        Card's number

    Methods
    -------
    get_card -> tuple
        Gets a tuple containing card's suit and number
    get_cards_suit -> str
        Gets card's suit
    get_cards_number -> str
        Gets card's number
    is_heart -> bool
        Returns True if the card's suit is Hearts else False
    pretty_card -> str
        Returns a pretty string containing card's number and suit
    """

    def __init__(self, suit: str, number: str) -> None:
        """
        Constructor for Card class

        Parameters
        ----------
        suit: str
            Card's suit
        number: str
            Card's number
        """
        self.suit = suit
        self.number = number

    @property
    def get_card(self) -> tuple:
        """
        Gets a dictionary containing card's suit and number

        Returns:
            dict: The card as dictionary containing the suit and number
        """
        return self.suit, self.number

    @property
    def get_card_suit(self) -> str:
        """
        Gets the card's suit

        Returns:
            str: The card's suit
        """
        return self.suit

    @property
    def get_card_number(self) -> str:
        """
        Gets the card's number

        Returns:
            str: The card's number
        """
        return self.number

    @property
    def is_heart(self) -> bool:
        """
        Returns True if the card's suit is Hearts. If it's not, return False

        Returns:
            bool: True if the card's suit is Hearts, else False
        """
        return True if self.suit == 'Hearts' else False

    @property
    def pretty_card(self) -> str:
        """
        Returns a pretty string from the card

        Returns:
            str: Card's number and suit in a pretty string
        """
        return f"{self.number}\t{self.suit}"
