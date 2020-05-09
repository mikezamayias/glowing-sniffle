def compare(a, b, c):
    if a > b:
        first_largest, temp = a, b
    else:
        first_largest, temp = b, a
    if c > temp:
        second_largest, smaller = c, temp
    else:
        second_largest, smaller = temp, c
    if second_largest >= first_largest:
        first_largest, second_largest = second_largest, first_largest
    return first_largest, second_largest, smaller

print(compare(3, 4, 5))
print(compare(3, 3, 5))
print(compare(3, 5, 5))
print(compare(4, 4, 4))
