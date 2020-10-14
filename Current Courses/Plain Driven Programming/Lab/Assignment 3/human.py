class Human:
    """
    A class to represent a Human

    Attributes
    ----------
    first_name: str
        Player's first name
    last_name: str
        Player's last name
    age: int
        Player's age

    Methods
    -------
    set_first_name()
    """
    def __init__(self, first_name: str, last_name: str, age: int) -> None:
        self.first_name = first_name
        self.last_name = last_name
        self.age = age

    def set_first_name(self, name: str) -> None:
        if self.first_name is None:
            self.first_name = name

    def set_last_name(self, name: str) -> None:
        if self.last_name is None:
            self.last_name = name

    def set_age(self, num: int) -> None:
        if self.age is None:
            self.age = num

    @property
    def get_first_name(self) -> str:
        return self.first_name

    @property
    def get_last_name(self) -> str:
        return self.last_name

    @property
    def get_age(self) -> int:
        return self.age

    def introduce_self(self) -> None:
        print(f"Player's name:\t{self.first_name} {self.last_name}")
        print(f"Player's age:\t{self.age}")
