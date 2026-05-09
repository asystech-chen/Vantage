#!/usr/bin/env python3
"""Build patched 7zSD.sfx: replace strings + all icons with Vantage branding."""
import struct, sys
from PIL import Image
import io as iomod

def find_rsrc(raw):
    pe = raw.find(b"PE\x00\x00")
    soh = struct.unpack_from("<H", raw, pe + 20)[0]
    st = pe + 24 + soh
    for i in range(10):
        so = st + i * 40
        if raw[so:so+8].rstrip(b"\x00") == b".rsrc":
            return (struct.unpack_from("<I", raw, so + 20)[0],
                    struct.unpack_from("<I", raw, so + 16)[0],
                    struct.unpack_from("<I", raw, so + 12)[0])
    return None, None, None

def walk_icons(raw, rsrc_off, rsrc_va):
    """Returns [(icon_id, data_off_in_section, data_size, format, w, h)]
    format is 'DIB' or 'PNG'"""
    icons = []
    _, _, _, _, named, ids = struct.unpack_from("<IIHHHH", raw, rsrc_off)
    for ti in range(named + ids):
        nr, er = struct.unpack_from("<II", raw, rsrc_off + 16 + ti * 8)
        if nr != 3:  # RT_ICON only
            continue
        id_off = er & 0x7FFFFFFF
        _, _, _, _, n2, i2 = struct.unpack_from("<IIHHHH", raw, rsrc_off + id_off)
        for ii in range(n2 + i2):
            nr2, er2 = struct.unpack_from("<II", raw, rsrc_off + id_off + 16 + ii * 8)
            lang_off = er2 & 0x7FFFFFFF
            _, _, _, _, n3, i3 = struct.unpack_from("<IIHHHH", raw, rsrc_off + lang_off)
            _, er3 = struct.unpack_from("<II", raw, rsrc_off + lang_off + 16)
            de_off = er3 & 0x7FFFFFFF
            data_rva, data_size, _, _ = struct.unpack_from("<IIII", raw, rsrc_off + de_off)
            data_off = data_rva - rsrc_va
            if data_off < 0:
                continue
            rpos = rsrc_off + data_off
            if rpos + 8 > len(raw):
                continue
            header = raw[rpos:rpos+8]
            if header[:4] == b'\x89PNG':
                # Parse PNG IHDR for dimensions
                w, h = struct.unpack_from(">II", raw, rpos+16)
                icons.append((nr2, data_off, data_size, "PNG", w, h))
            elif rpos + 40 <= len(raw):
                bh = struct.unpack_from("<IiiHH", raw, rpos)
                w, h = bh[1], abs(bh[2]) // 2  # ICO stores 2x height
                icons.append((nr2, data_off, data_size, "DIB", w, h))
    return icons

def load_vantage_icons(ico_path):
    """Returns {width: (format, raw_data)} where format is 'DIB' or 'PNG'
    Converts 256x256 DIB to PNG for size optimization."""
    with open(ico_path, "rb") as f:
        ico = f.read()
    _, _, count = struct.unpack_from("<HHH", ico, 0)
    out = {}
    for i in range(count):
        off = 6 + i * 16
        wr, hr, _, _, _, bpp, sz, io = struct.unpack_from("<BBBBHHII", ico, off)
        w = 256 if wr == 0 else wr
        h = 256 if hr == 0 else hr
        data = ico[io:io+sz]
        
        fmt = "DIB"
        if w == 256 and data[:4] != b'\x89PNG':
            # Convert 256x256 DIB to PNG
            biSize, biW, biH = struct.unpack_from("<Iii", data, 0)
            real_h = abs(biH) // 2
            pixel_bytes = biW * real_h * 4
            pixels = data[40:40+pixel_bytes]
            img = Image.frombytes("RGBA", (biW, real_h), pixels, "raw", "BGRA")
            img = img.transpose(Image.FLIP_TOP_BOTTOM)  # DIB stores rows bottom-up
            buf = iomod.BytesIO()
            img.save(buf, format="PNG", optimize=True)
            data = buf.getvalue()
            fmt = "PNG"
            print(f"  Vantage 256x256: DIB→PNG ({sz}→{len(data)})")
        
        out[w] = (fmt, data)
    return out

def update_checksum(raw):
    pe = raw.find(b"PE\x00\x00")
    cso = pe + 24 + 64
    struct.pack_into("<I", raw, cso, 0)
    s = sum(raw[i] | (raw[i+1] << 8) for i in range(0, len(raw) & ~1, 2))
    s = (s & 0xFFFF) + (s >> 16); s = (s & 0xFFFF) + (s >> 16)
    s += len(raw) & 0xFFFFFFFF; s &= 0xFFFFFFFF
    struct.pack_into("<I", raw, cso, s)

def main(inp, outp, ico_path):
    with open(inp, "rb") as f:
        raw = bytearray(f.read())

    # 1. Strings
    for o, n in [("Mozilla", "ASYS"), ("Firefox", "Vantage")]:
        ob = o.encode("utf-16-le")
        nb = n.encode("utf-16-le") + b"\x00" * max(0, len(ob)-len(n.encode("utf-16-le")))
        c = raw.count(ob)
        raw[:] = raw.replace(ob, nb)
        print(f"  String: {o} → {n} ({c})")

    # 2. Icons
    rsrc_off, rsrc_size, rsrc_va = find_rsrc(raw)
    if not rsrc_off:
        print("ERROR: no .rsrc")
        return 1

    old_icons = walk_icons(raw, rsrc_off, rsrc_va)
    new_icons = load_vantage_icons(ico_path)
    
    for icon_id, doff, dsize, fmt, w, h in old_icons:
        print(f"  Old icon {icon_id}: {fmt} {w}x{h} size={dsize}")
    
    for icon_id, doff, dsize, fmt, w, h in old_icons:
        if w in new_icons:
            vfmt, vdata = new_icons[w]
            if len(vdata) <= dsize:
                padded = vdata + b"\x00" * (dsize - len(vdata))
                raw[rsrc_off + doff : rsrc_off + doff + dsize] = padded
                print(f"  Icon {w}x{h} ({fmt}): replaced ({len(vdata)}→{dsize})")
            else:
                print(f"  Icon {w}x{h}: SKIP (vantage {len(vdata)} > old {dsize})")

    # 3. Checksum
    update_checksum(raw)
    with open(outp, "wb") as f:
        f.write(raw)
    print(f"✅ {outp}")

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3])
