// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/types/ArrayView.h"

namespace dna {

class StringView : public trust::ConstArrayView<char> {
    public:
        using Base = trust::ConstArrayView<char>;

    public:
        using Base::ArrayView;

        const char* c_str() const {
            return dataOrEmpty();
        }

        operator const char*() const {
            return dataOrEmpty();
        }

        const char* operator*() const {
            return dataOrEmpty();
        }

    private:
        const char* dataOrEmpty() const {
            return (data() == nullptr ? "" : data());
        }

};

inline bool operator==(const StringView& lhs, const StringView& rhs) {
    return (static_cast<const StringView::Base&>(lhs) == static_cast<const StringView::Base&>(rhs));
}

inline bool operator!=(const StringView& lhs, const StringView& rhs) {
    return !(lhs == rhs);
}

}  // namespace dna
