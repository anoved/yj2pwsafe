# yj2pwsafe

This script adds password or serial number items exported from [Yojimbo](http://barebones.com/products/yojimbo/) to a [Password Safe](http://pwsafe.org/)-compatible database. The Password Safe database format is compatible with [many programs](http://pwsafe.org/relatedprojects.shtml) and is based on [encryption](http://www.schneier.com/blowfish.html) [algorithms](http://www.schneier.com/twofish.html) developed in part by [Bruce Schneier](http://www.schneier.com/about.html).

## Usage

---

### 1

First, export some password or serial number items from Yojimbo. Select your items and choose *Export…* from the *File* menu:

![Export password items from Yojimbo](https://raw.github.com/anoved/yj2pwsafe/master/images/1-yojimbo-export.png)

You'll be prompted to enter your Yojimbo password (possibly a few times) and asked to choose a folder to contain the exported items. I recommend creating an empty new folder, for instance named *Exported Yojimbo Passwords*. Consider your export location carefully, as exported items (including passwords) are stored in plain text and are visible to anyone with access to your file system. Furthermore, automated backup tools like Dropbox or Time Machine may retain archived copies of files stored under their jurisdiction.

---

### 2

[Download this repository](https://github.com/anoved/yj2pwsafe/archive/master.zip) (.zip), unzip it, and run `yj2pwsafe.app`:

![Run yj2pwsafe.app](https://raw.github.com/anoved/yj2pwsafe/master/images/2-yj2pwsafe-files.png)

This "app" is just a bundle of scripts you can [browse on GitHub](https://github.com/anoved/yj2pwsafe/tree/master/yj2pwsafe.app/Contents/Resources/Scripts) and an Applescript wrapper you can examine by opening the app in Applescript Editor.

---

### 3

The `yj2pwsafe` app simply presents a series of dialogs. First, choose the items exported in step 1:

![Select exported password items](https://raw.github.com/anoved/yj2pwsafe/master/images/3-select-exported.png)

---

### 4

Next, specify which Password Safe database to add the items to. If you specify a new file, it will be created. If you choose to overwrite an existing Password Safe database, the original contents will be loaded first and included in the output.

![Specify Password Safe database](https://raw.github.com/anoved/yj2pwsafe/master/images/4-select-database.png)

---

### 5

Finally, enter the master password for the database specified in step 4. If it is a new file, this sets the master password. If you are adding to an existing database, you must provide the correct master password.

![Enter database master password](https://raw.github.com/anoved/yj2pwsafe/master/images/5-database-password.png)

The `yj2pwsafe` app will quit once the passwords or serial numbers are added to the database. Unfortunately, the script currently performs no error checking, so if anything goes wrong, its behavior is… undefined. Please do [report](https://github.com/anoved/yj2pwsafe/issues?state=open) such problems in as much detail as possible.

Last but not least, delete the interim clear text password or serial number files you exported from Yojimbo!

---

## Command Line Usage

The instructions above apply to the Applescript app at the top level of this repository. However, this app is just a wrapper that presents a few dialogs to get input for a platform-independent Tcl script that does the actual import. You can invoke the Tcl script directly if you prefer. It is called `yj2pwsafe.tcl` and is located in the [`Contents/Resources/Scripts` subdirectory](https://github.com/anoved/yj2pwsafe/tree/master/yj2pwsafe.app/Contents/Resources/Scripts) of the app bundle. It relies on the packages in the `gorilla-libs` folder found in the same directory.

The command line syntax of `yj2pwsafe.tcl` is as follows:

	yj2pwsafe.tcl DB_FILE YJ_FILE [YJ_FILE ...]

The first argument, `DB_FILE`, is the path to the Password Safe database. Each remaining argument (`YJ_FILE ...`) is interpreted as the path to a password or serial number item exported from Yojimbo. The master password for the database is read from standard input; a prompt will appear if you run the script from a terminal.

## Yojimbo Password Item Export Format

Technically, yj2pwsafe can import passwords from any source that exports files formatted like this:

	Name: NAME
	Location: URL
	Account: USERNAME
	Password: PASSWORD
	Comments: NOTES

Additionally, yj2pwsafe can import serial numbers from any source that exports files formatted like this:

	Product Name: NAME
	Owner Name: OWNER
	Email Address: EMAIL
	Organization: ORGANIZATION
	Serial Number: SERIAL
	Comments: NOTES

When importing serial number items, yj2pwsafe will append the `OWNER`, `EMAIL`, and `ORGANIZATION` values (if defined) to the `NOTES` field. The `URL` and `USERNAME` fields of serial number items will be left blank and the `SERIAL` number will be stored as the `PASSWORD`.

Every line must be present and formatted exactly as shown, but any field value (represented by the ALL-CAPS terms) may be left blank. The `NOTES` field extends to the end of the file, and may therefore span multiple lines. It is assumed that other fields will not span multiple lines.

## Requirements

yj2pwsafe was tested on Mac OS X 10.8.4 with password items exported from Yojimbo 3.0.4. All prerequisite Tcl packages are either included with this system or included in this repository. Users of prior versions of Mac OS X may need to install missing packages (including by not limited to [`[incr Tcl]`](http://sourceforge.net/projects/incrtcl/)) manually.

## Acknowledgements

yj2pwsafe is based on select [Password Gorilla](https://github.com/zdia/gorilla/wiki) code by Frank Pilhofer, redistributed with minor modifications in the [`gorilla-libs`](https://github.com/anoved/yj2pwsafe/tree/master/yj2pwsafe.app/Contents/Resources/Scripts/gorilla-libs) directory. This attribution does not constitute endorsement.

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

