import dna


class Reader:
    """
    A utility class used for reading DNA files
    """

    @staticmethod
    def create_stream_reader(dna_path: str) -> dna.BinaryStreamReader:
        """
        Creates a stream reader needed for reading values from the DNA file.

        @type dna_path: str
        @param dna_path: The path of the DNA file

        @rtype: dna.BinaryStreamReader
        @returns: The stream reader needed for reading values from the DNA file
        """

        stream = dna.FileStream(
            dna_path, dna.FileStream.AccessMode_Read, dna.FileStream.OpenMode_Binary
        )

        reader = dna.BinaryStreamReader(stream, dna.DataLayer_All)
        reader.read()
        if not dna.Status.isOk():
            status = dna.Status.get()
            raise RuntimeError(f"Error loading DNA: {status.message}")
        return reader
