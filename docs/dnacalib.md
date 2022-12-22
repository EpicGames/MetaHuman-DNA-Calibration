# DNACalib
This library is used for performing modifications on a DNA file.
It is written in C++ and there is also a Python wrapper for it. [SWIG](https://www.swig.org/) library is used for generating
bindings for Python. DNACalib can be used in command line, or in Maya.
Binaries for Windows and Linux are provided. **If you are using a different architecture and/or platform, you must build DNACalib.**

## DNACalib folder structure
- [`DNACalib`](/dnacalib/DNACalib) - Contains C++ source code of DNACalib and its dependencies. There is a library for
reading and writing DNA files, along with a few other utility libraries.
- [`PyDNACalib`](/dnacalib/PyDNACalib) - Contains the source code for generating the Python wrapper for DNACalib.
- [`PyDNA`](/dnacalib/PyDNA) - Contains the source code for generating the Python wrapper for DNA library, that is under
DNACalib folder containing C++ source code.
- [`SPyUS`](/dnacalib/SPyUS) - Contains some common SWIG interface files used by both PyDNACalib and PyDNA.
- [`CMakeModulesExtra`](/dnacalib/CMakeModulesExtra) - Contains some common CMake functions that are used throughout the
project, both in C++ and the Python wrapper.

## Usage

For example, to change rotation values of neutral joints, use the 
[`SetNeutralJointRotationsCommand`](/dnacalib/DNACalib/include/dnacalib/commands/SetNeutralJointRotationsCommand.h).

Below is an example that reads DNA, changes rotation values of all neutral joints to `{1, 2, 3}`, and overwrites the DNA
file with these new values.

```

// Create DNA reader
auto inOutStream = dnac::makeScoped<dnac::FileStream>("example.dna",
                                                      dnac::FileStream::AccessMode::ReadWrite,
                                                      dnac::FileStream::OpenMode::Binary);
auto reader = dnac::makeScoped<dnac::BinaryStreamReader>(inOutStream.get());
reader->read();

// Check if an error occurred while reading DNA file
if (!dnac::Status::isOk()) {
    // handle reader error
}

// Create DNACalib reader in order to edit DNA
auto dnaReader = dnac::makeScoped<dnac::DNACalibDNAReader>(reader.get());

std::vector<dnac::Vector3> rotations{dnaReader->getJointCount(), {1.0f, 2.0f, 3.0f}};

// Create command instance
dnac::SetNeutralJointRotationsCommand cmd{dnac::ConstArrayView<dnac::Vector3>{rotations}};

// Execute command
cmd.run(dnaReader.get());

// Write DNA file
auto writer = dnac::makeScoped<dnac::BinaryStreamWriter>(inOutStream.get());
writer->setFrom(dnaReader.get());
writer->write();

// Check if an error occurred while writing DNA file
if (!dnac::Status::isOk()) {
    // handle writer error
}
```

## Examples

### C++
Examples of C++ library usage can be found [here](/dnacalib/DNACalib/examples).

These are:
- [Chain multiple commands](/dnacalib/DNACalib/examples/CommandSequence.cpp)
- [Rename a blendshape](/dnacalib/DNACalib/examples/SingleCommand.cpp)

### Python
Examples of using the library from Python are [here](/examples).

These are:
- [Showcase a few commands](/examples/dnacalib_demo.py)
- [Rename a joint](/examples/dnacalib_rename_joint_demo.py)
- [Create a small DNA from scratch](/examples/dna_demo.py)
- [Create a new DNA from an existing one by extracting specific LODs](/examples/dnacalib_lod_demo.py)
- [Remove a joint](/examples/dnacalib_remove_joint.py)
- [Clear blend shape data](/examples/dnacalib_clear_blend_shapes.py)
- [Subtract values from neutral mesh](/examples/dnacalib_neutral_mesh_subtract.py)


## Build
Prebuilt binaries for 64-bit Windows and Linux are [provided](/lib).
If you are using a different architecture and/or platform, you must build DNACalib.

Prerequisites:
- [CMake](https://cmake.org/download/) at least version 3.14
- [SWIG](https://www.swig.org/download.html) at least version 4.0.0
- [Python](https://www.python.org/downloads/) To specify the exact version of python3 to use, set the CMake variable
`PYTHON3_EXACT_VERSION`. For example, to use the lib from Maya 2022, use version 3.7.

Use CMake to generate the build scripts required for building, e.g. by executing the following commands from the
[`dna_calibration/dnacalib/`](/dnacalib) directory:

```
mkdir build
cd build
cmake ..
```

And subsequently, to start the build process:
```
cmake --build
```
