digits_counter = 0
for digits in range(0, 20):
    print(f'{digits:02d} ', end='')
    digits_counter += 1
    if digits_counter == 4:
        digits_counter = 0
        print()