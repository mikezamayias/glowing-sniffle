from dealer import HeartsDealer
from player import HeartsPlayer


def main():
    dealer = HeartsDealer("Nick", "Fury", 70)

    player_1 = HeartsPlayer("Tony", "Stark", 50)
    player_1.set_nickname("Iron Man")

    player_2 = HeartsPlayer("Steve", "Rogers", 102)
    player_2.set_nickname("Captain America")

    round_counter = 0
    while round_counter < 5:
        dealer.deal_to_players(player_1, player_2)
        dealer.count_player_points(player_1, player_2)
        round_counter += 1

    player_1.print_hand()
    player_2.print_hand()
    dealer.decide_winner(player_1, player_2)


if __name__ == "__main__":
    main()
