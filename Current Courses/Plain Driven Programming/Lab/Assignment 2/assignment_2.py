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
        Returns a dictinary containining the card's suit and number
    get_card_suit() -> str
        Returns the card's suit
    get_card_number() -> str
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

    def get_card_suit(self) -> str:
        """
        Returns the card's suit

        Returns:
            str: The card's suit
        """
        return self.suit

    def get_card_number(self) -> str:
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
    distribute_cards(players_list: list, number_of_cards_to_deal: int)
        Distribute cards to players and remove distributed cards from deck
    get_number_of_remaining_cards()
        Return the number of remaining cards in deck
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

    def get_number_of_remaining_cards(self) -> int:
        """
        Return the number of remaininng cards in deck

        Returns:
            int: The deck's length
        """
        return len(self.cards)


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
    name: string
        Player's name
    hand: Hand
        Player's Hand
    points: int
        Player's points
    hearts_count: int
        Count of Hearts in Player's hand

    Methods
    -------
    take_card(card: Card)
        Appends card, of a Card instance, to the end of the player's hand
    throw_card(card: Card)
        Removes card, of a Card instance, from the player's hand
    get_hand()
        Returns a list of dictionaries of card's suit and number for each card in player's hand
    get_name()
        Returns player's name
    count_hearts()
        Counts the number of Heart cards in player's hand
    print_hand()
        Pretty prints player's name and player's hand
    """

    def __init__(self, name: str):
        """
        Constructor of Player class

        Parameters
        ----------
        name: str
            Player's name
        hand: Hand
            Player's hand
        points: int
            Player's points
        hearts_count: int
            Count of Hearts in Player's hand
        """
        self.name = name
        self.hand = Hand()
        self.points = 0
        self.hearts_count = self.count_hearts()

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

    def get_hand(self) -> list:
        """
        Returns a list of dictionaries of card's suit and number for each card in player's hand

        Returns:
            list: list of dictionaries of card's suit and number for each card in player's hand
        """
        return [card.get_card() for card in self.hand.cards]

    def get_name(self) -> str:
        """
        Returns player's name

        Returns:
            str: player's name
        """
        return self.name

    def count_hearts(self) -> int:
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

    def print_hand(self):
        """
        Pretty prints player's name and player's hand
        """
        print(f"\t{self.name}'s hand:")
        for card in self.hand.cards:
            print(f'\t\t{card.get_card_number()}\t{card.get_card_suit()}')


if __name__ == "__main__":
    # make card deck
    card_deck = Deck()

    # create cards deck
    card_deck.create_deck()

    # shuffle cards deck
    card_deck.shuffle_deck()

    # create player 1
    player_1 = Player('Chuck Norris')

    # create player 2
    player_2 = Player('God')

    # count played rounds
    round_counter = 0

    # play rounds
    for game_round in range(5):
        # change the number of cards to deal, if first round was played
        if game_round != 0:
            Deck.number_of_cards_to_deal = 3  # 3 so there is no "IndexError: list index out of range"

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
        player_1_hearts_counter = player_1.count_hearts()

        # count player's 2 Hearts
        player_2_hearts_counter = player_2.count_hearts()

        # difference in players' count of Hearts
        diff = player_1_hearts_counter - player_2_hearts_counter

        # give points to players
        if diff > 0:
            player_1.points += diff * 10
        elif diff < 0:
            player_2.points += abs(diff) * 10

    #   announce game results
    if player_1.points > player_2.points:
        print(f"{player_1.name} wins with {player_1.points} points to {player_2.name}'s {player_2.points}.")
    elif player_1.points < player_2.points:
        print(f"{player_2.name} wins with {player_2.points} points to {player_1.name}'s {player_1.points}.")
    else:
        print(
            f"Nobody won, both {player_1.name} and {player_2.name} have {player_2.points}.")
