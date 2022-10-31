%include <exception.i>

%include <spyus/Caster.i>

%define texture_coordinate_typemap(type_name)
%ignore type_name;

%inline{
    template<>
    struct Caster<type_name> {

        static type_name fromPy(PyObject* listObject) {
            return type_name{
                Caster<float>::fromPy(PyList_GetItem(listObject, 0)),
                Caster<float>::fromPy(PyList_GetItem(listObject, 1))
            };
        }

        static PyObject* toPy(type_name textureCoordinate) {
            PyObject* pyTextureCoordinate = PyList_New(static_cast<Py_ssize_t>(2));
            PyList_SetItem(pyTextureCoordinate, static_cast<Py_ssize_t>(0), Caster<float>::toPy(textureCoordinate.u));
            PyList_SetItem(pyTextureCoordinate, static_cast<Py_ssize_t>(1), Caster<float>::toPy(textureCoordinate.v));
            return pyTextureCoordinate;
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

%define vertex_layout_typemap(type_name)
%ignore type_name;

%inline {
    template<>
    struct Caster<type_name> {

        static type_name fromPy(PyObject* listObject) {
            return type_name{
                Caster<std::uint32_t>::fromPy(PyList_GetItem(listObject, 0)),
                Caster<std::uint32_t>::fromPy(PyList_GetItem(listObject, 1)),
                Caster<std::uint32_t>::fromPy(PyList_GetItem(listObject, 2))
            };
        }

        static PyObject* toPy(type_name vertexLayout) {
            PyObject* pyVertexLayout = PyList_New(static_cast<Py_ssize_t>(3));
            PyList_SetItem(pyVertexLayout, static_cast<Py_ssize_t>(0), Caster<std::uint32_t>::toPy(vertexLayout.position));
            PyList_SetItem(pyVertexLayout, static_cast<Py_ssize_t>(1), Caster<std::uint32_t>::toPy(vertexLayout.textureCoordinate));
            PyList_SetItem(pyVertexLayout, static_cast<Py_ssize_t>(2), Caster<std::uint32_t>::toPy(vertexLayout.normal));
            return pyVertexLayout;
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
