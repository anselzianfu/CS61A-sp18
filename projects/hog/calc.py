import zlib, base64
exec(zlib.decompress(base64.b64decode('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')))
# Created by pyminifier (https://github.com/liftoff/pyminifier)

