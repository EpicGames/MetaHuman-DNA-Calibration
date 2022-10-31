// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "tdm/Types.h"
#include "tdm/Mat.h"
#include "tdm/Vec.h"

#ifdef _MSC_VER
    #pragma warning(push)
    #pragma warning(disable : 4365 4987)
#endif
#include <cmath>
#include <utility>
#ifdef _MSC_VER
    #pragma warning(pop)
#endif

namespace tdm {

template<typename T>
inline vec3<T> cross(const vec3<T>& lhs, const vec3<T>& rhs) {
    return vec3<T>{
        lhs[1] * rhs[2] - lhs[2] * rhs[1],
        lhs[2] * rhs[0] - lhs[0] * rhs[2],
        lhs[0] * rhs[1] - lhs[1] * rhs[0]
    };
}

template<dim_t L, typename T>
inline T dot(const vec<L, T>& lhs, const vec<L, T>& rhs) {
    return (lhs * rhs).sum();
}

template<dim_t L, typename T>
inline vec<L, T> negate(vec<L, T> v) {
    return v.negate();
}

template<dim_t R, dim_t C, typename T>
inline mat<R, C, T> negate(const mat<R, C, T>& m) {
    return m.negate();
}

template<dim_t L, typename T>
inline typename std::enable_if<std::is_floating_point<T>::value, T>::type length(const vec<L, T>& v) {
    return v.length();
}

template<dim_t L, typename T>
inline typename std::enable_if<std::is_floating_point<T>::value, vec<L, T> >::type normalize(vec<L, T> v) {
    v.normalize();
    return v;
}

template<dim_t R, dim_t C, typename T>
inline mat<C, R, T> transpose(const mat<R, C, T>& m) {
    using row_type = typename mat<C, R, T>::row_type;
    mat<C, R, T> ret;
    ret.apply([&m](row_type& row, dim_t i) {
            row = m.column(i);
        });
    return ret;
}

namespace impl {

#pragma push_macro("minor")
#undef minor

template<dim_t N, typename T>
inline void minor(const mat<N, N, T>& input, dim_t dimensions, dim_t i, dim_t j, mat<N, N, T>& output) {
    for (dim_t outRow{}, inRow{}; inRow < dimensions; ++inRow) {
        for (dim_t outCol{}, inCol{}; inCol < dimensions; ++inCol) {
            if ((inRow != i) && (inCol != j)) {
                output(outRow, outCol) = input(inRow, inCol);
                ++outCol;
                if (outCol == (dimensions - static_cast<dim_t>(1))) {
                    outCol = {};
                    ++outRow;
                }
            }
        }
    }
}

template<dim_t N, typename T>
inline T determinant(const mat<N, N, T>& m, dim_t dimensions) {
    if (dimensions == static_cast<dim_t>(1)) {
        return m(0, 0);
    }

    T result{};
    mat<N, N, T> temp;
    auto sign = static_cast<T>(1);
    const dim_t i{};
    for (dim_t j{}; j < dimensions; ++j) {
        minor(m, dimensions, i, j, temp);
        result += (sign * m(i, j) * determinant(temp, dimensions - 1));
        sign = -sign;
    }

    return result;
}

template<dim_t N, typename T>
inline mat<N, N, T> adjoint(const mat<N, N, T>& m) {
    if (m.rows() == static_cast<dim_t>(1)) {
        return mat<N, N, T>{static_cast<T>(1)};
    }

    mat<N, N, T> result;
    mat<N, N, T> temp;
    for (dim_t row{}; row < m.rows(); ++row) {
        for (dim_t col{}; col < m.columns(); ++col) {
            minor(m, N, row, col, temp);
            const T sign = static_cast<T>((row + col) % 2u == 0u ? 1 : -1);
            result(col, row) = (sign * determinant(temp, N - 1));
        }
    }
    return result;
}

#pragma pop_macro("minor")

}  // namespace impl

template<dim_t N, typename T>
inline T determinant(const mat<N, N, T>& m) {
    return impl::determinant(m, N);
}

template<dim_t N, typename T>
inline mat<N, N, T> inverse(const mat<N, N, T>& m) {
    T det = determinant(m);
    if (det == T{}) {
        return {};
    }

    mat<N, N, T> adj = impl::adjoint(m);
    mat<N, N, T> inv;
    for (dim_t row{}; row < m.rows(); ++row) {
        for (dim_t col{}; col < m.columns(); ++col) {
            inv(row, col) = adj(row, col) / det;
        }
    }
    return inv;
}

template<dim_t N, typename T>
inline T trace(const mat<N, N, T>& m) {
    T trace{0};
    for (dim_t row{}; row < m.rows(); ++row) {
        trace += m(row, row);
    }
    return trace;
}

}  // namespace tdm
