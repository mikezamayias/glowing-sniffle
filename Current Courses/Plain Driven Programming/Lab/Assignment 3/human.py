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
    set_first_name() -> None
        Updates human's first name
    set_last_name() -> None
        Updates human's last name
    set_age() -> None
        Updates human's age
    get_first_name -> str
        Returns human's first name
    get_last_name -> str
        Returns human's last name
    get_age -> int
        Returns human's age   
    introduce_self() -> None
        Prints human's info
    """
    
    def __init__(self, first_name: str, last_name: str, age: int) -> None:
        """
        Constructor for Human class

        Parameters
        ----------
        first_name: str
            Human's first name
        last_name: str
            Human's last name
        age: int
            Human's age
        """
        self.first_name = first_name
        self.last_name = last_name
        self.age = age

    def set_first_name(self, name: str) -> None:
        """
        Updates human's first name

        Args:
            name (str): human's first name
        """
        if self.first_name is None:
            self.first_name = name

    def set_last_name(self, name: str) -> None:
        """
        Updates human's last name

        Args:
            name (str): human's last name
        """
        if self.last_name is None:
            self.last_name = name

    def set_age(self, num: int) -> None:
        """
        Updates human's age

        Args:
            num (int): human's age
        """
        if self.age is None:
            self.age = num

    @property
    def get_first_name(self) -> str:
        """
        Returns human's first name

        Returns:
            str: human's first name
        """
        return self.first_name

    @property
    def get_last_name(self) -> str:
        """
        Returns human's last name

        Returns:
            str: human's last name
        """
        return self.last_name

    @property
    def get_age(self) -> int:
        """
        Returns human's age

        Returns:
            int: human's age
        """
        return self.age

    def introduce_self(self) -> None:
        """
        Prints human's info
        """
        print(f"Player's name:\t{self.first_name} {self.last_name}")
        print(f"Player's age:\t{self.age}")
