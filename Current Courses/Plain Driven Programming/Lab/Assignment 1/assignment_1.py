# import modules and functions
from random import choice

# create deck
deck = [
    (suit, number)
    for suit in ['Clubs', 'Spades', 'Diamonds', 'Hearts']
    for number in ['Ace'] + [f'{i}' for i in range(2, 11)] + ['Jack', 'Queen', 'King']
]

# print deck
"""
for card in deck:
    print(f'{card[1]}\t{card[0]}')
"""

# create players, player_1 and player_2
player_1, player_2 = [], []


# heart counters for each player
player_1_hearts_counter = 0
player_2_hearts_counter = 0

# populate player_1 list
for i in range(0, 5):
    card = choice(deck)
    player_1.append(card)
    deck.remove(card)
    # count player_1 hearts
    # if the last card in player_1 is hearts, increment the respective counter
    if player_1[-1][0] == 'Hearts':
        player_1_hearts_counter += 1


# populate player_2 list
for i in range(0, 5):
    card = choice(deck)
    player_2.append(card)
    deck.remove(card)
    # count player_2 hearts
    # if the last card in player_2 is hearts, increment the respective counter
    if player_2[-1][0] == 'Hearts':
        player_2_hearts_counter += 1

# announce game's outcome
if player_1_hearts_counter > player_2_hearts_counter:
    print(f'Player 1 won with {player_1_hearts_counter} Hearts.')
elif player_1_hearts_counter < player_2_hearts_counter:
    print(f'Player 2 won with {player_2_hearts_counter} Hearts.')
else:
    print(f'No player won, both players have the same amount of Hearts.')
