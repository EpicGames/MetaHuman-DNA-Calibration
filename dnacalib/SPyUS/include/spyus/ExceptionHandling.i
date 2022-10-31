%include exception.i
%exception {
    try {
        $action
    } catch (std::exception& e) {
        SWIG_exception_fail(SWIG_RuntimeError, e.what());
    } catch (...) {
        SWIG_exception_fail(SWIG_RuntimeError, "Unhandled exception occurred");
    }
}
