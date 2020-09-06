from numpy import array, dot, set_printoptions, linalg
import fractions
from fractions import Fraction as frac


set_printoptions(formatter={'all': lambda x: str(
    fractions.Fraction(x).limit_denominator(10))})


def vector_projection(x, y):
####dot_xy = dot(x, y)
####dot_xx = dot(x, x)
####xy_xx = dot_xy / dot_xx
####_x = xy_xx*x
####print('x = ', x)
####print('y = ', y)
####print('dot(x, y) = ', Fraction(dot_xy))
####print('dot(x, x) = ', Fraction(dot_xx))
####print('dot(x, y) / dot(x, x) = ', Fraction(xy_xx))
####print('dot(x, y) / dot(x, x) * x = ', _x)
    return dot(x, y) / dot(x, x) * x


def vector_length(v):
    return linalg.norm(v)


"""
v1 = [0, 1, 1]
v2 = [0, 2, 0]
v1_v2 = vector_projection(v1, v2)
print(v1_v2)
"""

#   base
u = array([1, -2, 3])
v = array([2, -1, 2])
w = array([1, -2, 1])

#   orthogonal base
a = u
print('a = ', a)
b = v - vector_projection(a, v)
print('b = ', b)
c = w - vector_projection(a, w) - vector_projection(b, v)
print('c = ', c)

print(f'length of a: {frac(str(vector_length(a))).limit_denominator(10)}')
print(f'length of b: {frac(str(vector_length(b))).limit_denominator(10)}')
print(f'length of c: {frac(str(vector_length(c))).limit_denominator(10)}')

print(f'orthonormal a: {a/vector_length(a)}')
print(f'orthonormal b: {b/vector_length(b)}')
print(f'orthonormal c: {c/vector_length(c)}')