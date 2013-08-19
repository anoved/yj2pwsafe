# yj2pwsafe

This script adds password items exported from [Yojimbo](http://barebones.com/products/yojimbo/) to a [Password Safe](http://pwsafe.org/)-compatible database. The Password Safe database format is compatible with [many programs](http://pwsafe.org/relatedprojects.shtml) and is based on [encryption](http://www.schneier.com/blowfish.html) [algorithms](http://www.schneier.com/twofish.html) developed in part by [Bruce Schneier](http://www.schneier.com/about.html).

## Usage

First, export some passwords from Yojimbo: select the desired password items, select "Export…" from the File menu, enter your Yojimbo password as prompted, and choose a folder to contain the exported password items. I recommend choosing an empty new folder, since a separate text file will be created for each password.

(Passwords exported from Yojimbo are stored in clear text, so consider your export location carefully; otherwise, automatic backup services such as Dropbox or Time Machine may retain clear text copies of all your passwords.)

The yj2pwsafe script takes two or more command line arguments: first, the path to the Password Safe database to add passwords to (which will be created if it does not exist), followed by the path to one or more password files exported by Yojimbo. You will be prompted to enter your Password Safe database password. The script must be run from the directory containing the script and the `gorilla-libs` subdirectory.

Here's an example. `foo` is the Password Safe database, `passwords` is a folder containing only Yojimbo password text files, and `bar` is the Password Safe database password.

	> ./yj2pwsafe.tcl foo passwords/*.txt
	Password for foo: bar

Note that if you add passwords to an existing Password Safe database, any pre-existing items in the database will be retained. However, the database is always written using version 3 of the Password Safe format (easily changed in the `SavePasswordSafeDatabase` procedure if necessary).

## Yojimbo Password Item Export Format

Technically, yj2pwsafe can import passwords from any source that writes this exact file format:

	Name: NAME
	Location: URL
	Account: USERNAME
	Password: PASSWORD
	Comments: NOTES
	
Every line must be present and formatted exactly as shown, but any field value (represented by the capitalized terms) may be left blank. The `NOTES` field extends to the end of the file, and may therefore span multiple lines. It is assumed that other fields will not span multiple lines.

## Requirements

yj2pwsafe was tested on Mac OS X 10.8.4 with password items exported from Yojimbo 3.0.4. All prerequisite Tcl packages are either included with this system or included in this repository. Users of prior versions of Mac OS X may need to install missing packages (including by not limited to [`[incr Tcl]`](http://sourceforge.net/projects/incrtcl/)) manually.

## Acknowledgements

yj2pwsafe is based on select [Password Gorilla](https://github.com/zdia/gorilla/wiki) code by Frank Pilhofer, redistributed with minor modifications in the `gorilla-libs` directory. This attribution does not constitute endorsement.

## License

yj2pwsafe is freely distributed under an open source [BSD License](http://opensource.org/licenses/BSD-3-Clause):

> Copyright (c) 2013, Jim DeVona  
> All rights reserved.
> 
> Redistribution and use in source and binary forms, with or without
> modification, are permitted provided that the following conditions are
> met:
> 
> Redistributions of source code must retain the above copyright notice,
> this list of conditions and the following disclaimer. 
> 
> Redistributions in binary form must reproduce the above copyright
> notice, this list of conditions and the following disclaimer in the
> documentation and/or other materials provided with the distribution.
> 
> Neither the name of the package's author nor the names of its
> contributors may be used to endorse or promote products derived from
> this software without specific prior written permission.
> 
> THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

