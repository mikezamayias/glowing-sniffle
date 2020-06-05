name = 'helen'
print(name)

#   make all characters uppercase
name = name.upper()
print(name)

#   make all characters lowercase
name = name.lower()
print(name)

#   make first character uppercase and the rest lowercase
name = name.capitalize()
print(name)

#   count the times there's the character l in name
l_count = name.count('l')
print(f'Number of "l"s: {l_count}')

#   replace l with ll
name = name.replace('l', 'll')
print(name)

#   count the times there's the character l in name
l_count = name.count('l')
print(f'Number of "l"s: {l_count}')

#   find index of the first e in name
e_index = name.find('e')
print(f'Index of "e": {e_index}')

#   check if name contains just characters
print(f'"{name}" containts just characters: {name.isalpha()}')

#   check if name containts characters or numbers
print(f'"{name}" containts characters or numbers: {name.isalnum()}')

#   check if name containts just numbers
print(f'"{name}" containts characters or numbers: {name.isnumeric()}')
