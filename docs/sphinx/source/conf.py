# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))

import os
import sys

from os import environ
from os import path as ospath
from sys import path as syspath
from sys import platform


# if you use Maya, use absolute path
ROOT_DIR = rf"{ospath.dirname(ospath.abspath(__file__))}/../../..".replace("\\", "/")
ROOT_LIB_DIR = rf"{ROOT_DIR}/lib"
if platform == "win32":
    LIB_DIR = f"{ROOT_LIB_DIR}/windows"
elif platform == "linux":
    LIB_DIR = f"{ROOT_LIB_DIR}/linux"
else:
    raise OSError(
        "OS not supported, please compile dependencies and add value to LIB_DIR"
    )
    
# Adds bin directory to maya plugin path
if "MAYA_PLUG_IN_PATH" in environ:
    separator = ":" if platform == "linux" else ";"
    environ["MAYA_PLUG_IN_PATH"] = separator.join([environ["MAYA_PLUG_IN_PATH"], LIB_DIR])
else:
    environ["MAYA_PLUG_IN_PATH"] = LIB_DIR

# Adds directories to path
syspath.append(ROOT_DIR)
syspath.append(LIB_DIR)

import logging

try:
    from maya import standalone

    try:
        standalone.initialize(name="python")
    except Exception:
        logging.warning("Starting Maya cannot be done in Maya")
except ImportError as e:
    logging.error("DNAViewer needs to be run with Maya2022")
    raise ImportError(e) from e
    
import dna_viewer

syspath.append(f'{ROOT_DIR}/dna_viewer')
syspath.append(f'{ROOT_DIR}/dnacalib')

# -- Project information -----------------------------------------------------

project = 'DNA Calibration'
copyright = '2023, Epic Games'
author = 'Epic Games'


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinx.ext.napoleon',
    'sphinx.ext.autosummary',
    'sphinx.ext.autodoc',
    'sphinx.ext.doctest',
    'sphinx.ext.mathjax',
    'sphinx.ext.viewcode',
    'sphinx.ext.todo',
    'breathe',
    'myst_parser',
    'sphinx.ext.autosectionlabel',
    'sphinx.ext.graphviz',
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

# -- Doxygen part -------------------------------------------------

import subprocess
subprocess.run('make clean', shell=True)
root = os.getcwd()
os.chdir(f'{ROOT_DIR}/docs/doxygen')
subprocess.call('doxygen', shell=True)
os.chdir(root)

# breathe_debug_trace_directives = True
breathe_projects = {"dnacalib": f'{ROOT_DIR}/docs/doxygen/build/xml/'}
breathe_default_project = "dnacalib"
cpp_id_attributes = ["DNACAPI"]

myst_heading_anchors = 3