%include <exception.i>

%include "spyus/Caster.i"

%define vector3_typemap(type_name)
%ignore type_name;

%inline {
    template<>
    struct Caster<type_name> {

        static type_name fromPy(PyObject* listObject) {
            return type_name{
                Caster<float>::fromPy(PyList_GetItem(listObject, 0)),
                Caster<float>::fromPy(PyList_GetItem(listObject, 1)),
                Caster<float>::fromPy(PyList_GetItem(listObject, 2))
            };
        }

        static PyObject* toPy(type_name vec3) {
            PyObject* pyVec3 = PyList_New(static_cast<Py_ssize_t>(3));
            PyList_SetItem(pyVec3, static_cast<Py_ssize_t>(0), Caster<float>::toPy(vec3.x));
            PyList_SetItem(pyVec3, static_cast<Py_ssize_t>(1), Caster<float>::toPy(vec3.y));
            PyList_SetItem(pyVec3, static_cast<Py_ssize_t>(2), Caster<float>::toPy(vec3.z));
            return pyVec3;
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

%typemap(typecheck, precedence=SWIG_TYPECHECK_FLOAT_ARRAY) type_name {
    $1 = PyList_Check($input) ? 1 : 0;
}

%enddef
