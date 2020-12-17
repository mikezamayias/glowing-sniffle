/// An abstract class to represent a human, which has:
/// attributes for human's first and last name and age,
/// attribute getters,
/// methods.
abstract class Human {
  String firstName; // Attribute
  String lastName; // Attribute
  int age; // Attribute

  Human(); // Constructor

  /// Returns a formmated string containing classes attributes.
  @override
  String toString() {
    return 'Introducing: $firstName $lastName, $age';
  }

  /// Introduces human.
  void introduceSelf() {
    print(toString());
  }
}
