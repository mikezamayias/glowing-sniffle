# Singleton Design Pattern Notes

## Sources
Online:
- [Wikipedia](https://en.wikipedia.org/wiki/Singleton_pattern)
- [wiki.c2](http://wiki.c2.com/?SingletonPattern)

Books:
- Game Programming Patterns
- Design Patterns: Elements of Reusable Object-Oriented Software

## Intent
Ensure a class has only one instance, and provide a global point of access to it.

If a system only needs one instance of a class, and that instance needs to be accessible in many different parts of a system, you control both instantiation and access by making that class a singleton.


## Motivation
- An accouting system will be dedicated tos erving one company.
- There should be one file system and one window manager.

## Applicability
Use the Singleton pattern when
- there must be exactly one instance of a class, and it must be accessible to clients from a well-known access point.
- when the sole instance should be extensible by subclassing, and clients should be able to use an extended instance without modifying their code.

## Participants
Singleton
- defines an Instance operation that lets clients access its unique instance. Instance is a class operation.
- may be responsible for creating its own unique Instance.

## Collaborations
Clients access a Singleton instance solely through Singleton's Instance operation.

## [Implementation, in Dart](https://en.wikipedia.org/wiki/Singleton_pattern#Dart_implementation)
```dart
class Singleton {
	static Singleton _instance;
	static Singleton get _instance => _instance ?? Singleton._();
	Singleton._() => _instance = this;
}
```

## [Another Implementation and usage, in Dart](https://stackoverflow.com/a/12649574/13504709)
```dart
class Singleton {
	static final Singleton _singleton = Singleton._internal();
	factory Singleton() => _singleton;
	Singleton._internal();
}

main() {
	var s1 = Singleton();
	var s2 = Singleton();
	print(identical(s1, s2));  // true
	print(s1 == s2);           // true
}
```

## [One more implementation, in Dart](https://dart.academy/creational-design-patterns-for-dart-and-flutter-singleton/)
```dart
class Singleton {
	static Singleton _instance;
	Singleton._internal() {
		_instance = this;
	}
	factory Singleton() => _instance ?? Singleton._internal();
}
```
## Downsides
It's a global variable
- it makes it harder to reason about code
- it encourage coupling
- it isn't concurrent friendly 

## What we can do instead
- See if you need the class at all.
- Limit a  class to a single instance, use the first half of the Singleton pattern.
- Provide easy access to an instance; Singletons enable easy access.
  - Pass it in, as an argument.
  - Get it from other classes.
  - Get it from something already global.
  - Get it from a Service Locator (another Design Pattern).

