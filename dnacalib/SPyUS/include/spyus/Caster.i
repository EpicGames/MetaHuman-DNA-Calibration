%{
#include <vector>
%}

%inline{
    template<typename T>
    struct Caster;

    template<>
    struct Caster<std::uint16_t> {
        static std::uint16_t fromPy(PyObject* pyObject) {
            return static_cast<std::uint16_t>(PyLong_AsLong(pyObject));
        }

        static PyObject* toPy(std::uint16_t value) {
            return PyLong_FromLong(static_cast<long>(value));
        }
    };

    template<>
    struct Caster<std::uint32_t> {
        static std::uint32_t fromPy(PyObject* pyObject) {
            return static_cast<std::uint32_t>(PyLong_AsLong(pyObject));
        }

        static PyObject* toPy(std::uint32_t value) {
            return PyLong_FromLong(static_cast<long>(value));
        }
    };

    template<>
    struct Caster<float> {
        static float fromPy(PyObject* pyObject) {
            return static_cast<float>(PyFloat_AsDouble(pyObject));
        }

        static PyObject* toPy(float value) {
            return PyFloat_FromDouble(static_cast<double>(value));
        }
    };
}

%include "stdint.i"

%define py_list_to_c_pointer(arg1)
%typemap(in) (arg1) {
    if (PyList_Check($input)) {
        const std::size_t count = static_cast<std::size_t>(PyList_Size($input));
        $1 = reinterpret_cast<$1_basetype*>(malloc(count * sizeof($1_basetype)));
        for (std::size_t i{}; i < count; ++i) {
            $1[i] = Caster<$1_basetype>::fromPy(PyList_GetItem($input, i));
        }
    } else {
        SWIG_fail;
    }
}

%typemap(freearg) (arg1) {
    free($1);
}
%enddef

%define py_list_to_c_array(arg1, arg2)
%typemap(in) (arg1, arg2) {
    if (PyList_Check($input)) {
        $2 = static_cast<$2_basetype>(PyList_Size($input));
        $1 = reinterpret_cast<$1_basetype*>(malloc($2 * sizeof($1_basetype)));
        for ($2_basetype i{}; i < $2; ++i) {
            $1[i] = Caster<$1_basetype>::fromPy(PyList_GetItem($input, i));
        }
    } else {
        SWIG_fail;
    }
}

%typemap(freearg) (arg1, arg2) {
    free($1);
}
%enddef

%define py_list_to_c_matrix(arg1, arg2, arg3)
%typemap(in) (arg1, arg2, arg3) {
    if(PyList_Check($input)) {
        $3 = static_cast<$3_basetype>(PyList_Size($input));
        $2 = reinterpret_cast<$2_basetype*>(malloc($3 * sizeof($2_basetype)));

        std::size_t totalSize{};
        for ($3_basetype i{}; i < $3; ++i) {
            auto pyRow = PyList_GetItem($input, i);
            if (PyList_Check(pyRow)) {
                $2[i] = static_cast<$2_basetype>(PyObject_Length(pyRow));
                totalSize += static_cast<std::size_t>($2[i]);
            } else {
                 SWIG_fail;
            }
        }
        $1 = reinterpret_cast<$1_basetype*>(malloc(totalSize * sizeof($1_basetype)));
        std::size_t matrixIndex{};
        for ($3_basetype i{}; i < $3; ++i) {
            auto pyRow = PyList_GetItem($input, i);
            for ($2_basetype j{}; j < $2[i]; ++j) {
                $1[matrixIndex] = Caster<$1_basetype>::fromPy(PyList_GetItem(pyRow, j));
                ++matrixIndex;
            }
        }
    }
}

%typemap(freearg) (arg1, arg2, arg3) {
    free($1);
    free($2);
}
%enddef

%define py_list_to_c_array_complex_type(arg1, arg2)
%typemap(in) (arg1, arg2) {
    if (PyList_Check($input)) {
        $2 = static_cast<$2_basetype>(PyList_Size($input));
        $1 = reinterpret_cast<$1_ltype>(malloc($2 * sizeof($*1_ltype)));
        for ($2_basetype i{}; i < $2; ++i) {
            int res = 0;
            void *convert_ptr = 0 ;
            res = SWIG_ConvertPtr(PyList_GetItem($input, i), &convert_ptr, $*1_descriptor , 0 |  0 );
            if (!SWIG_IsOK(res)) {
                SWIG_fail;
            }
            $1[i] = reinterpret_cast<$*1_ltype>(convert_ptr);
        }
    } else {
        SWIG_fail;
    }
}

%typemap(typecheck /*, precedence=SWIG_TYPECHECK_INTEGER*/) (arg1, arg2) {
  $1 = PyList_Check($input) ? 1 : 0;
}

%typemap(freearg) (arg1, arg2) {
    free($1);
}
%enddef

%include "carrays.i"
%define wrap_array_class(type, name)
%array_functions(type, name);
%pythoncode %{
class name(object):
    def __init__(self, arr=[], nelements=0):
        self.nelements = max(len(arr), nelements)
        assert self.nelements > -1, "Nelements has to be greater then or equal to zero."
        self.this = new_ ## name ## (self.nelements)
        for (i, el) in enumerate(arr):
            self[i] = el

    def __del__(self):
        delete_ ## name ## (self.this)

    def __setitem__(self, index, value):
        name ## _setitem(self.this, index, value)

    def __getitem__(self, index):
        return name ## _getitem(self.this, index)

    def __iter__(self):
        for i in range(self.nelements):
            yield self[i]

    def __len__(self):
        return self.nelements
%}
%enddef

%pythoncode %{
def with_metaclass(meta, *bases):
    class metaclass(type):

        def __new__(cls, name, this_bases, d):
            return meta(name, bases, d)

        @classmethod
        def __prepare__(cls, name, this_bases):
            return meta.__prepare__(name, bases)
    return type.__new__(metaclass, 'temporary_class', (), {})
%}

%define pythonize_unmanaged_type(typename, creator, destroyer)
%pythoncode %{
typename ## Impl = typename

class typename ## ImplReflectionMixin(type):

    def __getattr__(cls, name):
        return getattr(typename ## Impl, name)

    def __dir__(cls):
        return [name for name in dir(typename ## Impl) if name not in (#creator, #destroyer)]

class typename(with_metaclass(typename ## ImplReflectionMixin, object)):
    __slots__ = ('_args', '_kwargs', '_instance')

    def __init__(self, *args, **kwargs):
        self._args = args
        self._kwargs = kwargs
        self._instance = typename ## Impl. ## creator(*args, **kwargs)

    def __del__(self):
        typename ## Impl. ## destroyer(self._instance)

    def _in_slots(self, attr):
        for cls in type(self).__mro__:
            if attr in getattr(cls, '__slots__', []):
                return True
        return False

    def __getattr__(self, attr):
        if self._in_slots(attr):
            return object.__getattr__(self, attr)
        return getattr(self._instance, attr)

    def __setattr__(self, attr, value):
        if self._in_slots(attr):
            object.__setattr__(self, attr, value)
        else:
            setattr(self._instance, attr, value)

    def __dir__(self):
        return [name for name in self._instance.__dir__() if name not in (#creator, #destroyer)]
%}
%enddef
