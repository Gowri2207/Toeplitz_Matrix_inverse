# Toeplitz_Matrix_inverse
Super Fast algorithm to find the approximated inverse of toeplitz matrix.
## Description
The inverse.m scripts finds the inverse of a Toeplitz matrix with time complexity of order O(n log n), by approximating Toeplitz matrix with circulant matrix. It uses a helper function gen_circ function.

## Requirements 
1. MATLAB

## Usage
1. Clone or download the repository to your local machine
2. Open MATLAB and navigate to the directory where you saved the repository.
3. Open the 'inverse.m' script in MATLAB.
4. Run the script and observe the output results and plots.

## Results
The script produces plots showing the relative errors in the matrix approximation, inverse, and solution of the linear system. It also calculates the mean relative errors for each category. The plots are drawn for size of the matrix vs errors. As matrices are generated randomly for every result mean of the error for 100 iterations are considered.

## Applications

Finding the approximate inverse of a Toeplitz matrix has several applications in various fields. Some potential use cases include:

- **Signal Processing:** Toeplitz matrices often arise in signal processing problems such as linear filtering, data interpolation, and spectral estimation. By efficiently computing the approximate inverse of a Toeplitz matrix, you can accelerate these signal processing algorithms.

- **Time Series Analysis:** Many time series analysis techniques involve working with Toeplitz matrices. Approximating the inverse of a Toeplitz matrix can improve the efficiency of computations in time series analysis, enabling faster analysis of large datasets.

- **Numerical Methods:** Approximate inverses of Toeplitz matrices are widely used in numerical methods such as iterative solvers, preconditioning techniques, and regularization methods. These techniques benefit from efficient algorithms that compute the approximate inverse.

By providing an optimized and fast algorithm for computing the approximate inverse of a Toeplitz matrix, this code offers a valuable tool for researchers, engineers, and practitioners working in these and related fields.



## Contributing
Contributions to this repository are welcome. If you find any issues or have improvements to suggest, feel free to open an issue or submit a pull request.

