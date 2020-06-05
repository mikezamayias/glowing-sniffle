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
    print(f"{person['first_name']} studies informatics science")
else:
    print(f"What does {person['first_name']} study?")
