// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "tdm/Computations.h"
#include "tdm/Types.h"

namespace tdm {

inline constexpr double pi() {
    return 3.14159265358979323846;
}

template<typename T>
inline typename std::enable_if<std::is_floating_point<T>::value, T>::type degrees(T radians) {
    static constexpr const auto c = static_cast<T>(180.0 / pi());
    return c * radians;
}

template<typename T>
inline typename std::enable_if<std::is_floating_point<T>::value, T>::type radians(T degrees) {
    static constexpr const auto c = static_cast<T>(pi() / 180.0);
    return c * degrees;
}

namespace affine {

template<dim_t L, typename T>
inline mat<L, L, T> scale(const vec<L, T>& factors) {
    return mat<L, L, T>::diagonal(factors);
}

template<dim_t L, typename T>
inline mat<L, L, T> scale(const mat<L, L, T>& m, const vec<L, T>& factors) {
    return m * scale(factors);
}

template<dim_t L, typename T>
inline mat<L, L, T> scale(T factor) {
    return scale(vec<L, T>{factor});
}

template<dim_t L, typename T>
inline mat<L, L, T> scale(const mat<L, L, T>& m, T factor) {
    return scale(m, vec<L, T>{factor});
}

}  // namespace affine

inline namespace projective {

template<typename T>
inline mat4<T> rotate(const vec3<T>& axis, T radians, handedness h = handedness::right) {
    const T c = std::cos(radians);
    const T s = std::sin(radians) * static_cast<T>(h);
    const T one_minus_c = static_cast<T>(1) - c;
    const vec3<T> n = normalize(axis);
    return mat4<T>{n[0] * n[0] * one_minus_c + c,
                   n[1] * n[0] * one_minus_c - n[2] * s,
                   n[2] * n[0] * one_minus_c + n[1] * s,
                   static_cast<T>(0),
                   n[0] * n[1] * one_minus_c + n[2] * s,
                   n[1] * n[1] * one_minus_c + c,
                   n[2] * n[1] * one_minus_c - n[0] * s,
                   static_cast<T>(0),
                   n[0] * n[2] * one_minus_c - n[1] * s,
                   n[1] * n[2] * one_minus_c + n[0] * s,
                   n[2] * n[2] * one_minus_c + c,
                   static_cast<T>(0),
                   static_cast<T>(0),
                   static_cast<T>(0),
                   static_cast<T>(0),
                   static_cast<T>(1)};
}

template<typename T>
inline mat4<T> rotate(const mat4<T>& m, const vec3<T>& axis, T radians, handedness h = handedness::right) {
    return m * rotate(axis, radians, h);
}

template<typename T>
inline mat4<T> rotate(T xRadians, T yRadians, T zRadians, handedness h = handedness::right) {
    const T sx = std::sin(xRadians) * static_cast<T>(h);
    const T sy = std::sin(yRadians) * static_cast<T>(h);
    const T sz = std::sin(zRadians) * static_cast<T>(h);
    const T cx = std::cos(xRadians);
    const T cy = std::cos(yRadians);
    const T cz = std::cos(zRadians);
    auto rx = mat4<T>::identity();
    rx(1, 1) = cx;
    rx(1, 2) = sx;
    rx(2, 1) = -sx;
    rx(2, 2) = cx;
    auto ry = mat4<T>::identity();
    ry(0, 0) = cy;
    ry(0, 2) = -sy;
    ry(2, 0) = sy;
    ry(2, 2) = cy;
    auto rz = mat4<T>::identity();
    rz(0, 0) = cz;
    rz(0, 1) = sz;
    rz(1, 0) = -sz;
    rz(1, 1) = cz;
    return rx * ry * rz;
}

template<typename T>
inline mat4<T> rotate(const mat4<T>& m, T xRadians, T yRadians, T zRadians, handedness h = handedness::right) {
    return m * rotate(xRadians, yRadians, zRadians, h);
}

template<typename T>
inline mat4<T> rotate(const vec3<T>& radians, handedness h = handedness::right) {
    return rotate(radians[0], radians[1], radians[2], h);
}

template<typename T>
inline mat4<T> rotate(const mat4<T>& m, const vec3<T>& radians, handedness h = handedness::right) {
    return m * rotate(radians[0], radians[1], radians[2], h);
}

template<dim_t L, typename T>
inline mat<L + 1, L + 1, T> scale(const vec<L, T>& factors) {
    vec<L + 1, T> diagonal{static_cast<T>(1)};
    factors.apply([&diagonal](const T& value, dim_t i) {
                diagonal[i] = value;
            });
    return mat<L + 1, L + 1, T>::diagonal(diagonal);
}

template<dim_t L, typename T>
inline mat<L + 1, L + 1, T> scale(const mat<L + 1, L + 1, T>& m, const vec<L, T>& factors) {
    return m * scale(factors);
}

template<dim_t L, typename T>
inline mat<L + 1, L + 1, T> scale(T factor) {
    return scale(vec<L, T>{factor});
}

template<dim_t L, typename T>
inline mat<L, L, T> scale(const mat<L, L, T>& m, T factor) {
    return scale(m, vec<L - 1, T>{factor});
}

template<dim_t L, typename T>
inline mat<L + 1, L + 1, T> translate(const vec<L, T>& position) {
    auto m = mat<L + 1, L + 1, T>::identity();
    position.apply([&m](const T& value, dim_t i) {
                m(L, i) = value;
            });
    return m;
}

template<dim_t L, typename T>
inline mat<L + 1, L + 1, T> translate(const mat<L + 1, L + 1, T>& m, const vec<L, T>& position) {
    return m * translate(position);
}

template<typename T>
struct axis_angle {
    tdm::vec3<T> axis;
    T radians;
};

template<typename T>
axis_angle<T> xyz2AxisAngle(T xRadians, T yRadians, T zRadians, handedness h = handedness::right) {
    const mat4<T> m = rotate(xRadians, yRadians, zRadians, h);
    const T radians = std::acos((trace(m.template submat<3, 3>(0, 0)) - static_cast<T>(1)) / static_cast<T>(2));
    const T factor = static_cast<T>(1) / (static_cast<T>(2) * std::sin(radians));
    const T x = factor * (m(2, 1) - m(1, 2));
    const T y = factor * (m(0, 2) - m(2, 0));
    const T z = factor * (m(1, 0) - m(0, 1));
    return {{x, y, z}, radians};
}

template<typename T>
axis_angle<T> xyz2AxisAngle(const vec3<T>& radians, handedness h = handedness::right) {
    return xyz2AxisAngle(radians[0], radians[1], radians[2], h);
}

}  // namespace projective

}  // namespace tdm
