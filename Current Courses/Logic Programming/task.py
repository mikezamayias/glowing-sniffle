ps = [False, True]
qs = [False, True]


def implies(p: bool, q: bool) -> bool:
    return not q or p


def z(p: bool, q: bool) -> bool:
    return implies(implies(not p, not q), implies(p, q))


print(f"P Q")
for p in ps:
    for q in qs:
        print(f"{int(p)} {int(q)} : {int(z(p, q))}")
