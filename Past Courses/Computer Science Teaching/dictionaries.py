person = {
    'first_name': 'Mike',
    'last_name': 'Zamayias',
    'age': 20
}

#   print person
print(f'person: {person}')

#   print person type
print(f'type(person): {type(person)}')

#   print person's first name
print(f"person['first_name']: {person['first_name']}")

#   print person's last name
print(f"person['last_name']: {person['last_name']}")

#   print person's age
print(f"person['age']: {person['age']}")

#   add key:item pair to person
person['id'] = 'TP5000'

#   print person
print(f'person: {person}')

#   remove key:item pair from person
del person['age']
person.pop('id')

#   print person
print(f'person: {person}')

#   print person's keys
print(f'person.keys(): {person.keys()}')

#   print person's items
print(f'person.items(): {person.items()}')

#   copy person to another_person and print another_person
another_person = person.copy()
print(f"another_person: {another_person}")

#   clear person and print person
person.clear()
print(f"person: {person}")

#   print length of person and another_person
print(f"len(person): {len(person)}")
print(f"len(another_person): {len(another_person)}")
