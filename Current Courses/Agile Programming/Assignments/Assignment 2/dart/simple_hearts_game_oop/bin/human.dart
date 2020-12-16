/// An abstract class to represent a human, which has:
/// attributes for human's first and last name and age,
/// attribute getters,
/// methods.
abstract class Human {
  final String _firstName; // Attribute
  final String _lastName; // Attribute
  final int _age; // Attribute

  Human(
    this._firstName,
    this._lastName,
    this._age,
  ); // Constructor

  // Getter for this human's first name.
  String get firstName => _firstName;

  /// Getter for this human's last name.
  String get lastName => _lastName;

  /// Getter for this human's age.
  int get age => _age;

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
