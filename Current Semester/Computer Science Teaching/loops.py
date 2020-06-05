numbers = list(range(0, 10))

#   print numbers
print(f'numbers: {numbers}')

evens, odds = [], []

#   iterate numbers list using the for loop
for number in numbers:
    #   if number is even
    if number % 2 == 0:
        #   append number to evens
        evens.append(number)
    #   if number is not even
    else:
        #   append number in odds
        odds.append(number)

#   print evens
print(f'evens: {evens}')

#   print odds
print(f'odds: {odds}')

#   print numbers in numbers using using the while loop
index = 0
length = len(numbers)
while True:
    check = index < length
    print(f'--- index: {index}')
    print(f'--- length: {length}')
    print(f'--- index < length: {check}')
    if check == False:
        break
    else:
        number = numbers[index] 
        print(f'number: {number}')
    index += 1
