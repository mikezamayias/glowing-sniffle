# import modules
from random import shuffle


class Card:
    """
    A class used to represent a (playing) Card

    Attributes
    ----------
    suit: str
        The card's suit
    number: str
        The card's number

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
        The constructor for Card class

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


class Hand:
    def __init__(self):
        self.cards = []


class Player:
    def __init__(self, name: str):
        self.name = name
        self.hand = Hand()
        self.number_of_hearts = self.count_hearts()

    def take_card(self, card: Card):
        self.hand.cards.append(card)

    def throw_card(self, card: Card):
        self.hand.cards.remove(card)

    def get_hand(self) -> list:
        return [card.get_card() for card in self.hand.cards]

    def get_name(self) -> str:
        return self.name

    def count_hearts(self) -> int:
        counter = 0
        for card in self.hand.cards:
            if card.is_heart():
                counter += 1
        self.number_of_hearts = counter
        return counter

    def print_hand(self):
        print(f"\t{self.name}'s hand:")
        for card in self.hand.cards:
            print(f'\t\t{card.get_card_number()}\t{card.get_card_suit()}')


if __name__ == "__main__":
    # make card deck
    card_deck = Deck()

    # create and shuffle cards deck
    card_deck.create_deck()
    card_deck.shuffle_deck()

    # create players
    player_1 = Player('Chuck Norris')
    player_2 = Player('God')

    # count the number of rounds
    round_counter = 0

    # where the game is played
    while True:

        # deal cards to players
        card_deck.deal_cards([player_1, player_2], Deck.number_of_cards)

        # remaining cards in deck
        remaining_cards_in_deck = card_deck.get_number_of_remaining_cards()

        # print the round number
        print(f"\nRound {round_counter+1:02d}")

        # print player hands
        player_1.print_hand()
        player_2.print_hand()

        #  print how many cards are left in deck
        print(f"Remaining cards in deck {card_deck.get_number_of_remaining_cards():02d}")

        # print round's outcome
        # player 1 wins
        if player_1.count_hearts() > player_2.count_hearts():
            print(f"\n{player_1.get_name()} wins with {player_1.count_hearts()} Hearts to {player_2.get_name()}'s {player_2.count_hearts()}.")
            break
        # player 2 wins
        elif player_1.count_hearts() < player_2.count_hearts():
            print(f"\n{player_2.get_name()} wins with {player_2.count_hearts()} Hearts to {player_1.get_name()}'s {player_1.count_hearts()}.")
            break
        # next round
        else:
            # in the case where in each round both players get the same number of hearts
            # and the card deck has no cards left, end the game
            if remaining_cards_in_deck == 0:
                print(
                    f"There is no winner between {player_1.get_name()}'s {player_1.count_hearts()} Hearts")
                print(
                    f" and {player_2.get_name()}'s {player_2.count_hearts()} Hearts. It's a tie.")
                break
            # if it is the first round and there was no winner, update the number of cards to distribute to players
            if round_counter == 0:
                # update number of cards to distribute
                Deck.number_of_cards = 1
            # update the rounds counter
            round_counter += 1
