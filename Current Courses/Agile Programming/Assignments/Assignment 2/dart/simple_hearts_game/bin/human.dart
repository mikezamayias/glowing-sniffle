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

  String get lastName => _lastName;

  int get age => _age;

  @override
  String toString() {
    return 'Introducing: $_firstName $_lastName, $_age';
  }

  void introduceSelf() {
    print(toString());
  }
}
