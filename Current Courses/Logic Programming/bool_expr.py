from pyeda.inter import *


Q, P = map(exprvar, "Q P".split())
Z = Implies(Implies(Not(P), Not(Q)), Implies(P, Q))
print(expr2truthtable(Z))
