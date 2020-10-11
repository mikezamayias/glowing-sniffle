# import modules
from random import shuffle


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
        return (f"{self.suit}", f"{self.number}")

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
        Return True if the card's suit is Hearts. If it's not, return False

        Returns:
            bool: True if the card's suit is Hearts, else False
        """
        return True if self.suit == 'Hearts' else False


class Deck:
    """
    A class to represent a Deck (of playing cards)

    Variables
    ---------
    number_of_cards_to_deal: int
        Number of cards to deal to players

    Attributes
    ----------
    cards: list
        Playing cards deck

    Methods
    -------
    get_deck()
        Returns a list of dictionaries each containing the card's suit and number for each card in deck
    get_number_of_remaining_cards()
        Return the number of remaining cards in deck
    create_deck()
        Creates instances of Card type and populates the deck with them
    add_card(card: Card)
        Appends card, a Card instance, to the deck
    remove_card(card: Card)
        Removes card, a Card instance, from the deck
    shuffle_deck()
        Shuffles deck in place, using the shuffle method from module random
    distribute_cards(players_list: list, number_of_cards_to_deal: int)
        Distribute cards to players and remove distributed cards from deck
    """

    # Number of cards to deal
    number_of_cards_to_deal = 10

    def __init__(self):
        """
        Constructor of Deck class

        Parameters
        ----------
        cards: list
            The deck of cards as a list
        """
        self.cards = []

    def get_deck(self) -> list:
        """
        Returns a list of dictinaries each containing the card's suit and number for each card in deck

        Returns:
            list: of dictinaries each containing the card's suit and number for each card in deck
        """
        return [card.get_card() for card in self.cards]

    def get_number_of_remaining_cards(self) -> int:
        """
        Return the number of remaininng cards in deck

        Returns:
            int: The deck's length
        """
        return len(self.cards)

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

    def shuffle_deck(self):
        """
        Shuffles deck in place, using the shuffle method from module random
        """
        shuffle(self.cards)

    def deal_cards(self, players_list: list, number_of_cards_to_deal: int):
        """
        Deal cards to players and remove dealt cards from deck

        Args:
            players_list (list): A list of players, instances of Players
            number_of_cards_to_deal (int): The number of cards to deal
        """
        for player in players_list:
            for dealt_card_counter in range(number_of_cards_to_deal):
                player.take_card(self.cards[dealt_card_counter])
                self.remove_card(self.cards[dealt_card_counter])


class Hand:
    """
    A class to represent a player's Hand

    Attributes
    ----------
    cards: list
        Cards in hand
    """

    def __init__(self):
        """
        Constructor of Hand class

        Parameters
        ----------
        cards: list
            Cards in hand
        """
        self.cards = []


class Player:
    """
    A class to represent a Player

    Attributes
    ----------
    first_name: str
        Player's first name
    last_name: str
        Player's last name
    full_name: str
        Player's full name
    age: int
        Player's age
    hand: Hand
        Player's Hand
    hearts_count: int
        Count of Hearts in Player's hand
    points: int
        Player's points

    Methods
    -------
    get_first_name()
        Returns player's first name
    get_last_name()
        Returns player's last name
    get_full_name()
        Returns player's full name
    get_age()
        Returns player's age
    get_hand()
        Returns a list of dictionaries of card's suit and number for each card in player's hand
    get_number_of_hearts()
        Counts the number of Heart cards in player's hand
    get_points()
        Returns player's points
    take_card(card: Card)
        Appends card, of a Card instance, to the end of the player's hand
    throw_card(card: Card)
        Removes card, of a Card instance, from the player's hand
    print_hand()
        Pretty prints player's name and player's hand
    """

    def __init__(self, first_name: str, last_name: str, age: int):
        """
        Constructor of Player class

        Parameters
        ----------
        first_name: str
            Player's first name
        last_name: str
            Player's last name
        full_name: str
            Player's full name
        age: int
            Player's age
        hand: Hand
            Player's hand
        hearts_count: int
            Count of Hearts in Player's hand
        points: int
            Player's points
        """
        self.first_name = first_name
        self.last_name = last_name
        self.full_name = f"{self.first_name} {self.last_name}"
        self.age = age
        self.hand = Hand()
        self.hearts_count = self.get_number_of_hearts()
        self.points = 0

    def get_first_name(self) -> str:
        """
        Returns player's first name

        Returns:
            str: player's first name
        """
        return f"{self.first_name}"

    def get_last_name(self) -> str:
        """
        Returns player's last name

        Returns:
            str: player's last name
        """
        return f"{self.last_name}"

    def get_full_name(self) -> str:
        """
        Returns player's full name

        Returns:
            str: player's full name
        """
        return self.full_name

    def get_age(self) -> int:
        """
        Returns player's age

        Returns:
            int: player's age
        """
        return self.age

    def get_hand(self) -> list:
        """
        Returns a list of dictionaries of card's
        suit and number for each card in player's hand

        Returns:
            list: list of dictionaries of card's
            suit and number for each card in player's hand
        """
        return [card.get_card() for card in self.hand.cards]

    def get_number_of_hearts(self) -> int:
        """
        Counts the number of Heart cards in player's hand

        Returns:
            int: number of Heart cards in player's hand
        """
        counter = 0
        for card in self.hand.cards:
            if card.is_heart():
                counter += 1
        self.hearts_count = counter
        return counter

    def get_points(self) -> int:
        """
        Returns player's points

        Returns:
            int: player's points
        """
        return self.points

    def take_card(self, card: Card):
        """
        Appends card, of a Card instance, to the end of the player's hand

        Args:
            card (Card): a instance card of class Card
        """
        self.hand.cards.append(card)

    def throw_card(self, card: Card):
        """
        Removes card, of a Card instance, from the player's hand

        Args:
            card (Card): a instance card of class Card
        """
        self.hand.cards.remove(card)

    def print_hand(self):
        """
        Pretty prints player's name and player's hand
        """
        print(f"\t{self.first_name} {self.last_name}'s hand:")
        for card in self.hand.cards:
            print(f'\t\t{card.get_cards_number()}\t{card.get_cards_suit()}')


if __name__ == "__main__":
    # make card deck
    card_deck = Deck()

    # create cards deck
    card_deck.create_deck()

    # shuffle cards deck
    card_deck.shuffle_deck()

    # create player 1
    player_1 = Player('Chuck', 'Norris', 55)

    # create player 2
    player_2 = Player('Donald', 'Duck',  85)

    # count played rounds
    round_counter = 0

    # play rounds
    for game_round in range(5):
        # change the number of cards to deal, if first round was played
        if game_round != 0:
            # 3 so there is no "IndexError: list index out of range"
            Deck.number_of_cards_to_deal = 3

        # print round counter
        print(f"Round {game_round}")

        # deal cards to players
        card_deck.deal_cards([player_1, player_2],
                             Deck.number_of_cards_to_deal)

        # remaining cards in deck
        remaining_cards_in_deck = card_deck.get_number_of_remaining_cards()

        # print the round number
        # print(f"\nRound {round_counter+1:02d}")

        # print player 1 hand
        player_1.print_hand()

        # print player 2 hand
        player_2.print_hand()

        #  print how many cards are left in deck
        # print(
        # f"Remaining cards in deck {card_deck.get_number_of_remaining_cards():02d}")

        # count player's 1 Hearts
        player_1_hearts_counter = player_1.get_number_of_hearts()

        # count player's 2 Hearts
        player_2_hearts_counter = player_2.get_number_of_hearts()

        # difference in players' count of Hearts
        diff = player_1_hearts_counter - player_2_hearts_counter

        # give points to players
        if diff > 0:
            player_1.points += diff * 10
        elif diff < 0:
            player_2.points += abs(diff) * 10

    #   announce game results
    if player_1.points > player_2.points:
        print(f"{player_1.get_full_name()} wins with {player_1.points} points to {player_2.get_full_name()}'s {player_2.points}.")
    elif player_1.points < player_2.points:
        print(f"{player_2.get_full_name()} wins with {player_2.points} points to {player_1.get_full_name()}'s {player_1.points}.")
    else:
        print(
            f"Nobody won, both {player_1.get_full_name()} and {player_2.get_full_name()} have {player_2.points}.")
