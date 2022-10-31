// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

namespace terse {

template<class Serializable>
class VirtualSerializerProxy {
    public:
        explicit VirtualSerializerProxy(Serializable* instance_) : instance{instance_} {
        }

        template<class TArchive>
        void load(TArchive& archive) {
            instance->load(archive);
        }

        template<class TArchive>
        void save(TArchive& archive) {
            instance->save(archive);
        }

    private:
        Serializable* instance;

};

}  // namespace terse
