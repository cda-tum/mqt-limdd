#ifndef CVEC_UTITITIES_HPP
#define CVEC_UTITITIES_HPP

#include "Complex.hpp"
#include "Definitions.hpp"

namespace dd {
    inline bool isZeroVector(const CVec& vec) {
        for (unsigned int i = 0; i < vec.size(); i++) {
            if (!Complex::approximatelyEqual(vec[i], 0)) {
                return false;
            }
        }
        return true;
    }

    inline bool isZeroVector(const CVec& vec, unsigned int start, unsigned int end) {
        if (vec.size() <= start || vec.size() < end) {
            throw std::runtime_error("[isZeroVector] ERROR received start and end which are out of bounds.");
        }
        for (unsigned int i = start; i < end; i++) {
            if (!Complex::approximatelyEqual(vec[i], 0)) {
                return false;
            }
        }
        return true;
    }

    inline CVec addVectors(const CVec a, const CVec b) {
        const auto N = a.size();
        CVec       c(N, {0.0, 0.0});
        for (unsigned int i = 0; i < N; i++) {
            c[i] = a[i] + b[i];
        }
        return c;
    }

    inline CVec multiplyMatrixVector(const CMat mat, const CVec x) {
        const auto N = std::max(mat.size(), x.size());
        CVec       y(N, {0.0, 0.0});
        if (mat.size() != x.size()) {
            return y;
        }
        for (unsigned int row = 0; row < N; row++) {
            for (unsigned int col = 0; col < N; col++) {
                //        			y[row] += x[col] * mat[col][row];
                y[row] += x[col] * mat[row][col]; // Or is this the right order?
            }
        }
        return y;
    }

} // namespace dd

#endif
