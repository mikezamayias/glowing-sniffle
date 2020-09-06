import numpy as np

A = np.array(
    [
        [1, 2, 3],
        [2, 4, 5],
        [3, 5, 0]
    ]
)

eigenvalues_A, eigenvectors_A = np.linalg.eig(A)
eigenvalues_A = round(eigenvalues_A)
eigenvectors_A = round(eigenvectors_A)
print(f'eigenvalues of A:\n{eigenvalues_A}\n\neigenvectors of A:\n{eigenvectors_A}')

print()

A_squared = A ** 2
eigenvalues_A_squared, eigenvectors_A_squared = np.linalg.eig(A_squared)
print(f'eigenvalues of A squared:\n{eigenvalues_A_squared}\n\neigenvectors of A squared:\n{eigenvectors_A_squared}')