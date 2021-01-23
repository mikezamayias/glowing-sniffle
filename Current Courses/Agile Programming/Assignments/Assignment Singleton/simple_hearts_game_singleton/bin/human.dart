/// An abstract class to represent a human, which has:
/// attributes for human's first and last name and age,
/// attribute getters,
/// methods.
abstract class Human {
  late String _firstName; // class attribute
  late String _lastName; // class attribute
  late int _age; // class attribute

  Human(); // Constructor

  String get firstName => this._firstName; // getter for _firstName
  set firstName(String value) =>
      this._firstName = value; // setter for _firstName

  String get lastName => this._lastName; // getter for _lastName
  set lastName(String value) => this._lastName = value; // setter for _lastName

  int get age => this._age; // getter for _age
  set age(int value) => this._age = value; // setter for _age

  /// Returns a formmated string containing classes attributes.
  @override
  String toString() {
    return 'Introducing: $_firstName $_lastName, $_age';
  }

  /// Introduces human.
  void introduceSelf() {
    print(toString());
  }
}
