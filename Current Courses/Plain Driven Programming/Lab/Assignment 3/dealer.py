from random import shuffle, choice

from card import Card
from deck import Deck
from human import Human
from player import HeartsPlayer


class HeartsDealer(Human):
    deck = Deck()
    deck.create_deck()
    CARDS_TO_DEAL = 5

    def __init__(self, first_name, last_name, age) -> None:
        super().__init__(first_name, last_name, age)

    def show_deck(self) -> None:
        for card in self.deck.cards:
            print(card.get_card())

    def deal_random_card(self) -> Card:
        card = choice(self.deck.cards)
        self.deck.remove_card(card)
        return card

    def deal_to_players(self, player1: HeartsPlayer, player2: HeartsPlayer) -> None:
        shuffle(self.deck.cards)
        for _ in range(self.CARDS_TO_DEAL):
            for player in [player1, player2]:
                card = self.deck.cards[0]
                player.set_hand(card)
                self.deck.remove_card(card)

    @staticmethod
    def count_player_hearts(player: HeartsPlayer) -> int:
        heart_counter = 0
        for card in player.get_hand:
            if card.is_heart:
                heart_counter += 1
        return heart_counter

    def count_players_points(self, player1: HeartsPlayer, player2: HeartsPlayer) -> None:
        player1_hearts = self.count_player_hearts(player1)
        player2_hearts = self.count_player_hearts(player2)
        hearts_difference = player1_hearts - player2_hearts
        if hearts_difference > 0:
            player1.set_points(hearts_difference * 10)
        elif hearts_difference < 0:
            player2.set_points(-1 * hearts_difference * 10)
        else:
            pass

    @staticmethod
    def decide_winner(player1: HeartsPlayer, player2: HeartsPlayer) -> None:
        if player1.get_points > player2.get_points:
            print(
                f"{player1.get_nickname} wins {player2.get_nickname}, {player1.get_points} to {player2.get_points}.")
        elif player2.get_points > player1.get_points:
            print(
                f"{player2.get_nickname} wins {player1.get_nickname}, {player2.get_points} to {player1.get_points}.")
        else:
            print(
                f"Both {player1.get_nickname} and {player2.get_nickname} have the same amount of Hearts, no winner.")
