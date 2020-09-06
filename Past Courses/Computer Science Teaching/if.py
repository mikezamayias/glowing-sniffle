person = {
    'first_name': 'Mike',
    'last_name': 'Zamayias',
    'age': 20,
    'id': 'TP5000'
}

if person['age'] >= 18:
    print(f"{person['first_name']} is an adult.")
else:
    print(f"{person['first_name']} is a child.")


if 'TP' in person['id']:
    print(f"{person['first_name']} studies informatics science.")
else:
    print(f"What does {person['first_name']} study?")

x = y = 10

if x > y:
    print(f'{x} is greater than {y}')
elif x == y:
    print(f'{x} is equal to {y}')
else:
    print(f'{y} is greater than {x}')
