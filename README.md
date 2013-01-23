[license]: http://opensource.org/licenses/MIT
[swfobject]: http://code.google.com/p/swfobject

# swf2html
Generate a HTML wrapper for your `.swf` file.

## Available commands
- `-f` or `-file` - `.swf` file to embed (only required parameter).
- `-c` or `-color` - Content color (don't use '#' or '0x', just the hexadecimal value).
- `-t` or `-title` - Page title (use quotes).
- `-w` or `-width` - Content width ('100%' by default).
- `-h` or `-height` - Content height ('100%' by default).
- `-ac` - Align center option. ('false' by default).
- `-v` or `-version` - Flash player version ('10.0.0' by default).
- `-sov` - [SWFObject][swfobject] version ('2.2' by default).
- `--help` - Script usage.

## How to use it

	sh swf2html.sh -f my_swf_file.swf

## TODO list
* Find a way to add new line before each CSS parameter. Inline parameters are just ugly.
* Improve template parsing.

## License
[MIT][license].