veggies = ['carrot', 'onion', 'lettuce']

#   print list
print(f'veggies: {veggies}')

#   reverse list and print list
veggies.reverse()
print(f'veggies reversed: {veggies}')

#   sort list alphabetically and print list
veggies.sort()
print(f'veggies sorted: {veggies}')

#   reverse sort list alphabetically and print list
veggies.sort(reverse=True)
print(f'veggies reverese sorted: {veggies}')

#   print the position of the first item
first_item_index = veggies.index('carrot')
print(f'first_item_index: {first_item_index}')

#   print first item
print(f'veggies[first_item_index]: {veggies[first_item_index]}')

#   append to list and print list
veggies.append('broccoli')
print(f'added broccoli to the end of veggies: {veggies}')

#   remove last item and print list
veggies.pop(-1)
print(f'removed last veggie: {veggies}')

#   insert item into position and print list
veggies.insert(first_item_index, 'potato')
print(f'inserted potato to the start of veggies: {veggies}')

#   remove onion and print list
veggies.remove('onion')
print(f'removed onion from veggies: {veggies}')

#   print length of veggies
print(f'len(veggies): {len(veggies)}')