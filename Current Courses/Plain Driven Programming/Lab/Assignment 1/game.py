""" Assignment status
TODO: Remove remaining cards message
TODO: Fix "None" output when printing players hand
"""
# import modules
from random import shuffle


class Card:
    def __init__(self, suit, number):
        self.suit = suit
        self.number = number

    def get_card(self):
        return self.suit, self.number

    def get_card_suit(self):
        return self.suit

    def get_card_number(self):
        return self.number

    def is_heart(self):
        return True if self.suit == 'Hearts' else False


class Deck:
    def __init__(self):
        self.cards = []

    def create_deck(self):
        for suit in ['Clubs', 'Spades', 'Diamonds', 'Hearts']:
            for number in ['Ace'] + [f'{i}' for i in range(2, 11)] + ['Jack', 'Queen', 'King']:
                self.add_card(Card(suit, number))

    def add_card(self, card):
        self.cards.append(card)

    def remove_card(self, card):
        self.cards.remove(card)

    def get_deck(self):
        return [card.get_card() for card in self.cards]

    def shuffle_deck(self):
        shuffle(self.cards)

    def distribute_cards(self, players_list, number_of_cards):
        for player in players_list:
            for _ in range(number_of_cards):
                player.take_card(self.cards[0])
                self.remove_card(self.cards[0])

    def get_number_of_remaining_cards(self):
        return len(self.cards)


class Hand:
    def __init__(self):
        self.cards = []


class Player:
    def __init__(self, name):
        self.name = name
        self.hand = Hand()
        self.number_of_hearts = self.count_hearts()

    def take_card(self, card):
        self.hand.cards.append(card)

    def throw_card(self, card):
        self.hand.cards.remove(card)

    def get_hand(self):
        return [card.get_card() for card in self.hand.cards]

    def get_name(self):
        return self.name

    def count_hearts(self):
        counter = 0
        for card in self.hand.cards:
            if card.is_heart():
                counter += 1
        self.number_of_hearts = counter
        return counter

    def print_hand(self):
        print(f"{self.name}'s hand:")
        for card in self.hand.cards:
            print(f'\t{card.get_card_number()}\t{card.get_card_suit()}')


if __name__ == "__main__":
    # make card deck
    card_deck = Deck()

    # create and shuffle cards deck
    card_deck.create_deck()
    card_deck.shuffle_deck()

    # create players
    player_1 = Player('Chuck Norris')
    player_2 = Player('God')

    # number of cards to deal
    number_of_cards = 5

    # count the number of rounds
    round_counter = 0

    # logic
    while True:

        # distribute cards to players
        card_deck.distribute_cards([player_1, player_2], number_of_cards)

        # print number of remaining cards in the card deck
        print(
            f"Remaining cards in deck:\t{card_deck.get_number_of_remaining_cards()}")

        # in the case where in each round both players get the same number of hearts
        # and the card deck has no cards left, end the game
        if card_deck.get_number_of_remaining_cards() == 0:
            print(
                f"There is no winner between {player_1.get_name()}'s {player_1.count_hearts()} Hearts")
            print(
                f" and {player_2.get_name()}'s {player_2.count_hearts()} Hearts. It's a tie.")
            break

        # print the round number
        print(f"Round:\t{round_counter+1}")

        # count hearts from player hands
        print(player_1.print_hand())
        print(player_2.print_hand())

        # compare players number of hearts
        # player 1 wins
        if player_1.count_hearts() > player_2.count_hearts():
            print(f"{player_1.get_name()} wins with {player_1.count_hearts()} Hearts to {player_2.get_name()}'s {player_2.count_hearts()}.")
            break
        # player 2 wins
        elif player_1.count_hearts() < player_2.count_hearts():
            print(f"{player_2.get_name()} wins with {player_2.count_hearts()} Hearts to {player_1.get_name()}'s {player_1.count_hearts()}.")
            break
        # next round
        else:
            # if it is the first round and there was no winner, update the number of cards to distribute to players
            if round_counter == 0:
                # update number of cards to deal
                number_of_cards = 1
            # update the rounds counter
            round_counter += 1
