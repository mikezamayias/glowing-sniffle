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
    get_card() -> dict
        Returns a dictionary containing the card's suit and number
    get_cards_suit() -> str
        Returns the card's suit
    get_cards_number() -> str
        Returns the card's number
    is_heart() -> bool
        Returns True if the card's suit is Hearts else False
    """

    def __init__(self, suit: str, number: str):
        """
        Constructor for Card class

        Parameters
        ----------
        suit: str
            The card's suit
        number: str
            The card's number
        """
        self.suit = suit
        self.number = number

    def get_card(self) -> dict:
        """
        Returns a dictionary containing card's suit and number

        Returns:
            dict: The card as dictionary containing the suit and number
        """
        return self.suit, self.number

    def get_cards_suit(self) -> str:
        """
        Returns the card's suit

        Returns:
            str: The card's suit
        """
        return self.suit

    def get_cards_number(self) -> str:
        """
        Returns the card's number

        Returns:
            str: The card's number
        """
        return self.number

    def is_heart(self) -> bool:
        """
        Returns True if the card's suit is Hearts. If it's not, return False

        Returns:
            bool: True if the card's suit is Hearts, else False
        """
        return True if self.suit == 'Hearts' else False

    def pretty_card(self) -> str:
        """
        Returns a prtty string from the card

        Returns:
            str: Card's number and suit in a pretty string
        """
        return f"{self.number}\t{self.suit}"