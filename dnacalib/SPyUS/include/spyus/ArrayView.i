%include <exception.i>

%include "spyus/Caster.i"

%define array_view_to_py_list(type_name)
%typemap(out) type_name {
    const std::size_t count = $1.size();
    $result = PyList_New(static_cast<Py_ssize_t>(count));
    using ValueType = std::remove_cv<$1_basetype::value_type>::type;

    $1_basetype arrayView = $1;
    for (std::size_t i = 0ul; i < count; ++i) {
        PyList_SetItem($result, static_cast<Py_ssize_t>(i), Caster<ValueType>::toPy(arrayView[i]));
    }
}
%enddef

%define string_view_to_py_string(type_name)
%typemap(out) type_name {
    %#if PY_VERSION_HEX >= 0x03000000
    $result = PyUnicode_FromStringAndSize($1.c_str(), $1.size());
    %#else
    $result = PyString_FromStringAndSize($1.c_str(), $1.size());
    %#endif
}
%enddef

%define py_list_to_array_view(type_name, typecheck_precedence)
%typemap(in) (type_name) {
    if (PyList_Check($input)) {
        bool isCorrect = true;
        auto item = PyList_GetItem($input, 0);
        if (item != NULL) {
            if (std::is_floating_point<$1_basetype::value_type>::value) {
                isCorrect = PyFloat_Check(item) ? true : false;
            } else if (std::is_integral<$1_basetype::value_type>::value) {
                isCorrect = PyLong_Check(item) || PyInt_Check(item) ? true : false;
            } else {
                // For structs, classes, and other object types, just assume true until something breaks
                isCorrect = true;
            }
        } else {
            isCorrect = true;
        }
        if (!isCorrect) {
            SWIG_Python_RaiseOrModifyTypeError("wrong element type");
            return 0;
        }
        using value_type = std::remove_cv<$1_basetype::value_type>::type;
        const std::size_t count = static_cast<std::size_t>(PyList_Size($input));
        const auto ptr = reinterpret_cast<value_type*>(malloc(count * sizeof(value_type)));
        for (std::size_t i{}; i < count; ++i) {
            ptr[i] = Caster<value_type>::fromPy(PyList_GetItem($input, i));
        }
        $1 = $1_basetype{ptr, count};
    } else {
        SWIG_exception(SWIG_TypeError, "list expected");
    }
}

%typemap(freearg) (type_name) {
    using value_type = std::remove_cv<$1_basetype::value_type>::type;
    free(const_cast<value_type*>($1.data()));
}

%typemap(typecheck, precedence=typecheck_precedence) type_name {
    $1 = 0;
    if (PyList_Check($input)) {
        auto item = PyList_GetItem($input, 0);
        if (item != NULL) {
            if (std::is_floating_point<$1_basetype::value_type>::value) {
                $1 = PyFloat_Check(item) ? 1 : 0;
            } else if (std::is_integral<$1_basetype::value_type>::value) {
                $1 = PyLong_Check(item) || PyInt_Check(item) ? 1 : 0;
            } else {
                // For structs, classes, and other object types, just assume true until something breaks
                $1 = 1;
            }
        } else {
            $1 = 1;
        }
    }
}

%enddef
