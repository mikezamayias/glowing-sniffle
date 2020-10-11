from human import HeartsPlayer, HeartsDealer


def main():
    dealer = HeartsDealer("Nick", "Fury", 70)
    player_1 = HeartsPlayer("Tony", "Stark", 50)
    player_2 = HeartsPlayer("Steve", "Rogers", 102)
 
    player_1.set_nickname("Iron Man")    
    player_2.set_nickname("Captain America")

    # dealer.show_deck()

    dealer.deal_to_players(player_1, player_2)

    dealer.decide_winner(player_1, player_2)


if __name__ == "__main__":
    main()
