from card import Card
from human import Human


class HeartsPlayer(Human):
    """
    A subclass of Human, HeartsPlayer to represent a human player.

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
    set_nickname() -> None
        Sets player's nickname
    set_hand() -> None
        Sets player's hand
    set_points() -> None
        Sets player's hand
    get_nickname -> str
        Returns player's nickname
    get_hand -> list
        Returns player's hand
    get_points -> int
        Returns player's pints
    introduce_self() -> None
        Prints player's info
    print_hand() -> None
        Pretty prints player's hand
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
        self.nickname = None
        self.hand = []
        self.points = 0

    def set_nickname(self, name: str) -> None:
        """
        Sets player's nickname

        Parameters
        ----------
            name (str): player's nickname
        """
        if self.nickname is None:
            self.nickname = name

    def set_hand(self, card: Card) -> None:
        """
        Sets player's hand

        Parameters
        ----------
            card (Card): a card
        """
        self.hand.append(card)

    def set_points(self, num: int) -> None:
        """
        Sets player's points

        Parameters
        ----------
            num (int): some points
        """
        self.points += num

    @property
    def get_nickname(self) -> str:
        """
        Gets player's nickname

        Returns
        -------
            self.nickname (str): player's nickname
        """
        return self.nickname

    @property
    def get_hand(self) -> list:
        """
        Gets player's hand

        Returns
        -------
            self.hand (list): player's hand
        """
        return self.hand

    @property
    def get_points(self) -> int:
        """
        Gets player's points

        Returns
        -------
            self.points (int): player's points
        """
        return self.points

    def introduce_self(self) -> None:
        """
        Prints player's info
        """
        super(HeartsPlayer, self).introduce_self()
        print(f"{self.first_name} {self.last_name}'s, a.k.a. {self.nickname}, points:\t{self.points}")

    def print_hand(self) -> None:
        """
        Pretty prints player's hand
        """
        print(f"{self.nickname}'s hand:")
        for card in self.hand:
            print(card.pretty_card)
