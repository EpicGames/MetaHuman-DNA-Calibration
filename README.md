# Important Note
This repository has not been updated to support MetaHuman characters created in MetaHuman Creator in Unreal Engine 5.6.
Characters created in Unreal Engine 5.6 should be edited using the new MetaHuman for Maya plugin, available for download on Fab.
This repository remains compatible with characters created in Unreal Engine 5.5 or earlier.

## DNA v2.5 Preliminary Support (In Progress)

**Status**: This branch implements preliminary DNA v2.5 file format detection and provides clear user-facing error messages.

### What's New

- **Version Detection**: Added DNA file header version checking in both DNACalib and DNAViewer libraries
- **User-Friendly Errors**: When a DNA v2.5 file is loaded, the tools now provide a clear, actionable error message instead of crashing or producing cryptic errors
- **Workaround Guidance**: Error messages direct users to use the MetaHuman for Maya plugin (available on Fab) for DNA v2.5 files until full support is implemented

### Error Message Example

```
DNA Version 2.5 Not Yet Supported

The DNA file you are trying to load uses version 2.5 of the DNA format, which is not yet fully supported by this version of DNACalib/DNAViewer.

Workaround: Please use the MetaHuman for Maya plugin (available on Fab) to work with DNA v2.5 files.

Full DNA v2.5 support is currently in development. We welcome contributors and testers!
For more information, see: https://github.com/EpicGames/MetaHuman-DNA-Calibration/issues
```

### Roadmap for Full v2.5 Support

1. ✅ Phase 1: Version detection and user-friendly error messages (COMPLETED in this PR)
2. 🔄 Phase 2: Read-only support for DNA v2.5 files (IN PROGRESS)
3. 📋 Phase 3: Full read/write support for DNA v2.5 format
4. 📋 Phase 4: Backwards compatibility layer for v2.0-v2.4 files

### Contributing

We're actively seeking contributors and testers for DNA v2.5 support! Areas where help is needed:

- **Testing**: If you have DNA v2.5 files, please test this branch and report any issues
- **Documentation**: Help document the DNA v2.5 format differences
- **Implementation**: C++ and Python developers familiar with binary file formats

Please see `CONTRIBUTING.md` for guidelines on how to contribute.

### Technical Details

The version check is implemented at the file loading stage:
- `dna_viewer/dnalib/dna_reader.py`: Added `check_dna_version()` function
- `dnacalib/src/DNAReader.cpp`: Added version validation in the constructor
- Both implementations check the DNA file header magic number and version field
- Version 2.5 files are detected early and trigger a `DNAVersionNotSupportedException` with helpful guidance

---

# MetaHuman DNA Calibration
MetaHuman DNA Calibration is a set of tools used for working with MetaHuman DNA files, bundled into a single package.
[`DNA`](/docs/dna.md#metahuman-dna) is an integral part of [MetaHuman](https://www.unrealengine.com/en-US/metahuman) identity.
DNA files are created with [MetaHuman Creator](https://metahuman.unrealengine.com/) and downloaded with [Quixel Bridge](https://docs.metahuman.unrealengine.com/en-US/downloading-metahumans-with-quixel-bridge/), and Bifrost in UE5.

MetaHuman DNA Calibration is a set of tools used for working with MetaHuman DNA files, bundled into a single package. We wanted to share this code to help users customize DNA files so they can better integrate the characters they create into their games and experiences.
MetaHuman DNA Calibration tools are provided in a GitHub repository located at this address.

# Overview
For an explanation about how the repository is organized, [click here](docs/repository_organization.md).

The MetaHuman DNA Calibration repository contains two distinct tools:
- [DNACalib](docs/dnacalib.md) (and its dependencies) 
- [DNAViewer](docs/dna_viewer.md)

## Required Knowledge
To use these tools, you should be familiar with:
- Rigging in Maya
- Python

## Optional Knowledge
- C++ (for [DNACalib](docs/dnacalib.md) and its [API](docs/dnacalib_api.md))

## DNACalib
[DNACalib](docs/dnacalib.md) and its [API](docs/dnacalib_api.md) are used to inspect and modify DNA files. With [DNACalib](docs/dnacalib.md), you can make the following changes in DNA files:
- Rename joints, meshes, blendshapes, and / or animated maps.
- Remove joints, meshes, and / or joint animation.
- Rotate, scale, and translate the rig.
- Remove LODs.
- Change neutral joint positions, neutral mesh positions, and blendshape delta values.
