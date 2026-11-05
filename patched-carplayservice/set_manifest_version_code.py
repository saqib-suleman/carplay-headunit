"""Sets android:versionCode in a compiled (binary AXML) AndroidManifest.xml in place.

The patched CarplayService must have a higher versionCode than the copy on /system, or the
package manager discards the update at boot ("System package updated; 28 --> 28").
Usage: python3 -I set_manifest_version_code.py <AndroidManifest.xml> <new versionCode>
"""
import struct
import sys

RES_XML_TYPE = 0x0003
RES_XML_RESOURCE_MAP_TYPE = 0x0180
RES_XML_START_ELEMENT_TYPE = 0x0102
ANDROID_VERSION_CODE_ATTR_ID = 0x0101021B
TYPE_INT_DEC = 0x10
ATTRIBUTE_SIZE = 20


def find_version_code_offsets(manifest):
    chunk_type, header_size, total_size = struct.unpack_from("<HHI", manifest, 0)
    if chunk_type != RES_XML_TYPE or total_size != len(manifest):
        raise ValueError("not a binary AndroidManifest.xml")

    resource_ids = []
    version_code_value_offsets = []
    offset = header_size
    while offset < total_size:
        chunk_type, chunk_header_size, chunk_size = struct.unpack_from("<HHI", manifest, offset)
        if chunk_type == RES_XML_RESOURCE_MAP_TYPE:
            count = (chunk_size - chunk_header_size) // 4
            resource_ids = list(struct.unpack_from(f"<{count}I", manifest, offset + chunk_header_size))
        elif chunk_type == RES_XML_START_ELEMENT_TYPE:
            element = offset + chunk_header_size
            attribute_start, attribute_size, attribute_count = struct.unpack_from("<HHH", manifest, element + 8)
            for index in range(attribute_count):
                attribute = element + attribute_start + index * attribute_size
                name_index = struct.unpack_from("<I", manifest, attribute + 4)[0]
                data_type = manifest[attribute + 15]
                is_version_code = (
                    name_index < len(resource_ids)
                    and resource_ids[name_index] == ANDROID_VERSION_CODE_ATTR_ID
                )
                if is_version_code and data_type == TYPE_INT_DEC:
                    version_code_value_offsets.append(attribute + 16)
        offset += chunk_size
    return version_code_value_offsets


def main():
    manifest_path, new_version_code = sys.argv[1], int(sys.argv[2])
    manifest = bytearray(open(manifest_path, "rb").read())
    value_offsets = find_version_code_offsets(manifest)
    if len(value_offsets) != 1:
        raise SystemExit(f"expected exactly one versionCode attribute, found {len(value_offsets)}")
    old_version_code = struct.unpack_from("<I", manifest, value_offsets[0])[0]
    struct.pack_into("<I", manifest, value_offsets[0], new_version_code)
    open(manifest_path, "wb").write(manifest)
    print(f"versionCode {old_version_code} -> {new_version_code}")


if __name__ == "__main__":
    main()
