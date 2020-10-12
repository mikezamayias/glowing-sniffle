from human import HeartsPlayer, HeartsDealer


def main():
    dealer = HeartsDealer("Nick", "Fury", 70)
    player_1 = HeartsPlayer("Tony", "Stark", 50)
    player_2 = HeartsPlayer("Steve", "Rogers", 102)

    player_1.set_nickname("Iron Man")
    player_2.set_nickname("Captain America")

    round_counter = 0
    dealer.deal_to_players(player_1, player_2)
    dealer.cards_to_deal = 3
    while round_counter < 5:
        dealer.count_players_points(player_1, player_2)
        round_counter += 1
        dealer.deal_to_players(player_1, player_2)

    player_1.print_hand()
    player_2.print_hand()
    dealer.decide_winner(player_1, player_2)


if __name__ == "__main__":
    main()
