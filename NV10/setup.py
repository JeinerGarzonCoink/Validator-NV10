from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

ext_modules = [Extension("CythonNV10", ["NV10PY.pyx", "ValidatorNV10.cpp", "StateMachine.cpp"], include_dirs = ['spdlog/include/'], language='c++',extra_compile_args=["-std=c++14"])]

for e in ext_modules:
    e.cython_directives = {'language_level': "3"} #all are Python-3

setup(cmdclass = {'build_ext': build_ext}, ext_modules = ext_modules,)