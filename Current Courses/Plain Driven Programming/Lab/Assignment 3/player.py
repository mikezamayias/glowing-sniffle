from card import Card
from human import Human


class HeartsPlayer(Human):
    def __init__(self, first_name, last_name, age) -> None:
        super().__init__(first_name, last_name, age)
        self.nickname = None
        self.hand = []
        self.points = 0

    def set_nickname(self, name: str) -> None:
        self.nickname = name

    def set_hand(self, card: Card) -> None:
        self.hand.append(card)

    def set_points(self, num: int) -> None:
        self.points += num

    @property
    def get_nickname(self) -> str:
        return self.nickname

    @property
    def get_hand(self) -> list:
        return self.hand

    @property
    def get_points(self) -> int:
        return self.points

    def introduce_self(self) -> None:
        super(HeartsPlayer, self).introduce_self()
        print(f"{self.first_name} {self.last_name}'s, a.k.a. {self.nickname}, points:\t{self.points}")

    def print_hand(self) -> None:
        print(f"{self.nickname}'s hand:")
        for card in self.hand:
            print(card.pretty_card)
