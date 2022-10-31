/**
 * Copyright Epic Games, Inc. All Rights Reserved.
 */

%include <exception.i>

%include "spyus/Caster.i"


%define tdm_vec_typemap(type_name)
%ignore type_name;

%inline {
    template<>
    struct Caster<type_name> {

        static type_name fromPy(PyObject* listObject) {
            type_name cVec;
            for (std::size_t i = 0; i < type_name::dimensions(); i++) {
                cVec[i] = Caster<type_name::value_type>::fromPy(PyList_GetItem(listObject, i));
            }
            return cVec;
        }

        static PyObject* toPy(type_name cVec) {
            std::size_t length = type_name::dimensions();
            PyObject* pyVec = PyList_New(static_cast<Py_ssize_t>(length));
            for (std::size_t i = 0; i < length; i++) {
                PyList_SetItem(pyVec, static_cast<Py_ssize_t>(i), Caster<type_name::value_type>::toPy(cVec[i]));
            }
            return pyVec;
        }

    };
}

%typemap(in) (type_name) {
    if (PyList_Check($input)) {
        $1 = Caster<type_name>::fromPy($input);
    } else {
        SWIG_exception(SWIG_TypeError, "list expected");
    }
};

%typemap(out) type_name {
    $result = Caster<$1_basetype>::toPy($1);
}

%typemap(typecheck, precedence=SWIG_TYPECHECK_BOOL_ARRAY) type_name {
    $1 = PyList_Check($input) ? 1 : 0;
}

%enddef

