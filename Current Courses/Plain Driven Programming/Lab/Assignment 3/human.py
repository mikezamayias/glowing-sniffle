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
        for card in self.hand:
            print(card.get_card())


class HeartsDealer(Human):
    deck = Deck()
    deck.create_deck()
    deck.shuffle_deck()
    cards_to_deal = 2
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

    def decide_winner(self, player1: HeartsPlayer, player2: HeartsPlayer):
        player1s_hearts = 0
        player2s_hearts = 0
        self.cards_to_deal = 1
        while True:
            if self.round_counter == 2:
                print(f"{player1.nickname}'s hand:")
                for card in player1.get_hand():
                    print(card.pretty_card())
                print(f"{player2.nickname}'s hand:")
                for card in player2.get_hand():
                    print(card.pretty_card())
                if player1.get_points() > player2.get_points():
                    winner = player1
                    losser = player2
                    print(
                        f"{winner.get_nickname()} won {losser.get_nickname()} with {winner.get_points()} to {losser.get_points()}.")
                elif player2.get_points() > player1.get_points():
                    winner = player2
                    losser = player1
                    print(
                        f"{winner.get_nickname()} won {losser.get_nickname()} with {winner.get_points()} to {losser.get_points()}.")
                else:
                    print(
                        f"Both {player1.get_nickname()} and {player2.get_nickname()} have equal amount points, {player1.get_points()}.")
                break
            else:
                for card in player1.get_hand():
                    if card.is_heart():
                        player1s_hearts += 1
                for card in player2.get_hand():
                    if card.is_heart():
                        player2s_hearts += 1

                diff = player1s_hearts - player2s_hearts
                if diff > 0:
                    player1.set_points(diff * 10)
                elif diff < 0:
                    player2.set_points(-diff * 10)
                else:
                    pass
                self.deal_to_players(player1, player2)
                self.round_counter += 1
