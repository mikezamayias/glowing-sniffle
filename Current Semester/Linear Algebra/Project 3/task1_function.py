import numpy as np


A = np.array(
    [
        [1, 2, 3],
        [2, 4, 5],
        [3, 5, 0]
    ]
)

eigA = np.linalg.eig(A)

print(eigA[-1][0])