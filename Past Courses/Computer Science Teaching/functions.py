def function_zero():
    """
    A function that prints 'Hello World!' to the terminal.
    """
    print('Hello World!')


def function_one(name='user'):
    """
    A function that greets the user. It has a default value for the name set to 'user', in the case that the suer forgets to enter his'/hers' name.
    """
    print(f'Hello {name} from function_one!')


def function_two(name='user'):
    """
    A function that returns a greeting with the name of the user.
    """
    return f'Hello {name} from function_two!'


#   call function_zero
function_zero()

#   call function_one without an arguement
function_one()

#   call function_one with an arguement
function_one('Mike')

#   call function_two that returns a string with an arguement
function_two('Helen')

#   call function_two that returns a string without an arguement
string = function_two()
print(string)
