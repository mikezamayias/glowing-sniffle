from random import choice
from deck import Deck
from card import Card


class Human:
    def __init__(self, first_name: str, last_name: str, age: int):
        self.first_name = first_name
        self.last_name = last_name
        self.age = age

    def set_first_name(self, name: str):
        if self.first_name == None:
            self.first_name = name

    def set_last_name(self, name: str):
        if self.last_name == None:
            self.last_name = name

    def set_age(self, num: int):
        if self.age == None:
            self.age = num

    def get_first_name(self):
        return self.first_name

    def get_last_name(self):
        return self.last_name

    def get_age(self):
        return self.age


class HeartsPlayer(Human):
    def __init__(self, first_name, last_name, age):
        super().__init__(first_name, last_name, age)
        self.nickname = None
        self.hand = []
        self.points = 0

    def set_nickname(self, name: str):
        self.nickname = name

    def set_hand(self, card: Card):
        self.hand.append(card)

    def set_points(self, num: int):
        self.points += num

    def get_nickname(self):
        return self.nickname

    def get_hand(self):
        return self.hand

    def get_points(self):
        return self.points

    def print_hand(self):
        print(f"{self.nickname}'s hand:")
        for card in self.hand:
            print(card.pretty_card())


class HeartsDealer(Human):
    deck = Deck()
    deck.create_deck()
    deck.shuffle_deck()
    cards_to_deal = 5
    round_counter = 0

    def __init__(self, first_name, last_name, age):
        super().__init__(first_name, last_name, age)

    def show_deck(self):
        for card in self.deck.cards:
            print(card.get_card())

    def deal_random_card(self) -> Card:
        card = self.deck.cards[0]
        self.deck.remove_card(card)
        return card

    def deal_to_players(self, player1: HeartsPlayer, player2: HeartsPlayer):
        for _ in range(self.cards_to_deal):
            for player in [player1, player2]:
                player.set_hand(self.deal_random_card())

    def count_player_hearts(self, player: HeartsPlayer) -> int:
        heart_counter = 0
        for card in player.get_hand():
            if card.is_heart():
                heart_counter += 1
        return heart_counter

    def count_players_points(self, player1: HeartsPlayer, player2: HeartsPlayer):
        player1_hearts = self.count_player_hearts(player1)
        player2_hearts = self.count_player_hearts(player2)
        hearts_difference = player1_hearts - player2_hearts
        if hearts_difference > 0:
            player1.set_points(hearts_difference * 10)
        elif hearts_difference < 0:
            player2.set_points(-1 * hearts_difference * 10)
        else:
            pass

    def decide_winner(self, player1: HeartsPlayer, player2: HeartsPlayer):
        if player1.get_points() > player2.get_points():
            print(
                f"{player1.get_nickname()} wins {player2.get_nickname()}, {player1.get_points()} to {player2.get_points()}")
        elif player2.get_points() > player1.get_points():
            print(
                f"{player2.get_nickname()} wins {player1.get_nickname()}, {player2.get_points()} to {player1.get_points()}")
        else:
            print(
                f"Both {player1.get_nickname()} and {player2.get_nickname()} have the same amount of Hearts, no winner.")
