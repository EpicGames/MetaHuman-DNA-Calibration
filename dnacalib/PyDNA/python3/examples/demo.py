#-*- coding: utf-8 -*-
import argparse

import dna


def createDNA(path):
    stream = dna.FileStream(path, dna.FileStream.AccessMode_Write, dna.FileStream.OpenMode_Binary)
    writer = dna.BinaryStreamWriter(stream)

    writer.setName("rig name")
    writer.setLODCount(4)
    writer.setJointName(0, "spine")
    writer.setJointName(1, "neck")

    writer.setMeshName(0, "head")
    writer.setVertexPositions(0, [[0.0, 0.5, 0.3], [1.0, 3.0, -8.0]])
    writer.setVertexTextureCoordinates(0, [[0.25, 0.55], [1.5, 3.6]])

    writer.write()
    if not dna.Status.isOk():
        status = dna.Status.get()
        raise RuntimeError("Error saving DNA: {}".format(status.message))


def loadDNA(path):
    stream = dna.FileStream(path, dna.FileStream.AccessMode_Read, dna.FileStream.OpenMode_Binary)
    reader = dna.BinaryStreamReader(stream, dna.DataLayer_All)
    reader.read()
    if not dna.Status.isOk():
        status = dna.Status.get()
        raise RuntimeError("Error loading DNA: {}".format(status.message))
    return reader


def printDNASummary(dnaReader):
    print("Name: {}".format(dnaReader.getName()))
    print("Joint count: {}".format(dnaReader.getJointCount()))
    jointNames = ', '.join(dnaReader.getJointName(i) for i in range(dnaReader.getJointCount()))
    print("Joint names: " + jointNames)

    for meshIdx in range(dnaReader.getMeshCount()):
        # Get vertices one by one
        for vtxId in range(dnaReader.getVertexPositionCount(meshIdx)):
            vtx = dnaReader.getVertexPosition(meshIdx, vtxId)
            print("Mesh {} - Vertex {} : {}".format(meshIdx, vtxId, vtx))
        # Get all X / Y / Z coordinates
        print(dnaReader.getVertexPositionXs(meshIdx))
        print(dnaReader.getVertexPositionYs(meshIdx))
        print(dnaReader.getVertexPositionZs(meshIdx))

        for tcIdx in range(dnaReader.getVertexTextureCoordinateCount(meshIdx)):
            texCoord = dnaReader.getVertexTextureCoordinate(meshIdx, tcIdx)
            print("Mesh {} - Texture coordinate {} : {}".format(meshIdx, tcIdx, texCoord))


def main():
    parser = argparse.ArgumentParser(description="DNA demo")
    parser.add_argument('dna_path',
                        metavar='dna_path',
                        help='Path where to save the DNA file')

    args = parser.parse_args()

    createDNA(args.dna_path)
    dnaReader = loadDNA(args.dna_path)
    printDNASummary(dnaReader)


if __name__ == '__main__':
    main()
