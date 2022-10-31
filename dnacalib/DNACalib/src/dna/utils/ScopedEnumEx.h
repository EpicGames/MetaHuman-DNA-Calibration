// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include <type_traits>

namespace dna {

template<typename TEnum>
typename std::enable_if<std::is_enum<TEnum>::value, TEnum>::type
operator&(TEnum lhs, TEnum rhs) {
    using Underlying = typename std::underlying_type<TEnum>::type;
    return static_cast<TEnum>(static_cast<Underlying>(lhs) & static_cast<Underlying>(rhs));
}

template<typename TEnum>
typename std::enable_if<std::is_enum<TEnum>::value, TEnum>::type
operator|(TEnum lhs, TEnum rhs) {
    using Underlying = typename std::underlying_type<TEnum>::type;
    return static_cast<TEnum>(static_cast<Underlying>(lhs) | static_cast<Underlying>(rhs));
}

template<typename TEnum>
typename std::enable_if<std::is_enum<TEnum>::value, TEnum>::type
operator^(TEnum lhs, TEnum rhs) {
    using Underlying = typename std::underlying_type<TEnum>::type;
    return static_cast<TEnum>(static_cast<Underlying>(lhs) ^ static_cast<Underlying>(rhs));
}

template<typename TEnum>
typename std::enable_if<std::is_enum<TEnum>::value, TEnum>::type
operator~(TEnum value) {
    using Underlying = typename std::underlying_type<TEnum>::type;
    return static_cast<TEnum>(~static_cast<Underlying>(value));
}

template<typename TEnum>
typename std::enable_if<std::is_enum<TEnum>::value, TEnum>::type
operator&=(TEnum& lhs, TEnum rhs) {
    return lhs = (lhs & rhs);
}

template<typename TEnum>
typename std::enable_if<std::is_enum<TEnum>::value, TEnum>::type
operator|=(TEnum& lhs, TEnum rhs) {
    return lhs = (lhs | rhs);
}

template<typename TEnum>
typename std::enable_if<std::is_enum<TEnum>::value, TEnum>::type
operator^=(TEnum& lhs, TEnum rhs) {
    return lhs = (lhs ^ rhs);
}

template<typename TEnum>
typename std::enable_if<std::is_enum<TEnum>::value, bool>::type
contains(TEnum lhs, TEnum rhs) {
    return (lhs & rhs) == rhs;
}

}  // namespace dna
