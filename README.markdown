[license]: https://github.com/rafaelrinaldi/swf-to-html/raw/master/license.txt
[swfobject]: http://code.google.com/p/swfobject

# swf-to-html
Generate a HTML wrapper for your SWF file.

---
### API
- `-f` or `-file` - SWF file to embed (only required parameter).
- `-c` or `-color` - Content color (don't use '#' or '0x', just the hexadecimal code).
- `-t` or `-title` - Page title (use quotes).
- `-w` or `-width` - Content width ('100%' by default).
- `-h` or `-height` - Content height ('100%' by default).
- `-v` or `-version` - Flash player version ('10.0.0' by default).
- `-sov` - [SWFObject][swfobject] version ('2.2' by default).
- `--help` - Script usage.

---
### Usage

	sh swf-to-html.sh -f my_swf_file.swf

For a complete list of available options and etc, just run `sh swf-to-html --help`.

---
### License
[WTFPL][license]