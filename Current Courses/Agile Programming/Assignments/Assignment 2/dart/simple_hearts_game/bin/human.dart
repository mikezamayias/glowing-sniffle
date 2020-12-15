abstract class Human {
  String _firstName;
  String _lastName;
  int _age;

  Human(
    this._firstName,
    this._lastName,
    this._age,
  );

  String get firstName => _firstName;

  set firstName(String value) => _firstName = value;

  String get lastName => _lastName;

  set lastName(String value) => _lastName = value;

  int get age => _age;

  set age(int value) => _age = value;

  @override
  String toString() {
    return 'Introducing: $_firstName $_lastName, $_age';
  }

  void introduceSelf() {
    print(toString());
  }
}
