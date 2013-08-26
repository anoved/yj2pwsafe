#!/usr/bin/tclsh

lappend auto_path [file join [file dirname [info script]] gorilla-libs]
package require pwsafe

# load a pwsafe database from file or create a new one if no such file exists
proc GetPasswordSafeDatabase {dbpath dbpw} {
	if {[file exists $dbpath]} {
		return [ReadPasswordSafeDatabase $dbpath $dbpw]
	} else {
		return [CreatePasswordSafeDatabase $dbpw]
	}
}

# returns reference to a pwsafe database object read from the file at dbpath
proc ReadPasswordSafeDatabase {dbpath dbpw} {
	return [pwsafe::createFromFile $dbpath $dbpw]	
}

# returns reference to an empty new pwsafe database object
proc CreatePasswordSafeDatabase {dbpw} {
	return [pwsafe::db NEW_DB $dbpw]
}

# writes pwsafe db object to file at dbpath
proc SavePasswordSafeDatabase {db dbpath} {
	pwsafe::writeToFile $db $dbpath 3
}

# insert new password info record in db; other fields populated automatically
proc AddPasswordItem {db name location account password comments} {
	set record [$db createRecord]
	$db setFieldValue $record 3 $name
	$db setFieldValue $record 4 $account
	$db setFieldValue $record 5 $comments
	$db setFieldValue $record 6 $password
	$db setFieldValue $record 13 $location
}

# return a list of password info read from a Yojimbo password item export file
proc ParseInputFile {path} {
	set f [open $path]
	set content [read $f nonewline]
	close $f
	if {[regexp {^Name: (.*)\nLocation: (.*)\nAccount: (.*)\nPassword: (.*)\nComments: (.*)$} $content match name location account password comments] == 1} {
		set results [list $name $location $account $password $comments]
	} elseif {[regexp {^Product Name: (.*)\nOwner Name: (.*)\nEmail Address: (.*)\nOrganization: (.*)\nSerial Number: (.*)\nComments: (.*)$} $content match name owner email organization serial comments] == 1} {
		if {$owner ne {}} {
			append comments \n "Owner Name: $owner"
		}
		if {$email ne {}} {
			append comments \n "Email Address: $email"
		}
		if {$organization ne {}} {
			append comments \n "Organization: $organization"
		}
		set results [list $name {} {} $serial $comments]
	} else {
		error "Unrecognized content format in $path"
	}
	return $results
}



# require at least one password file
if {$argc < 2} {
	puts stderr "$argv0 DB_PATH PW_FILE \[PW_FILE ...\]"
	exit
}

# load or create a pwsafe database 
set dbpath [lindex $argv 0]

# the -mode option will only be present in stdin's config
# if it is some sort of terminal; if absent, just read pw.
if {[dict exists [fconfigure stdin] -mode]} {
	puts -nonewline stdout "Password for $dbpath: "
	flush stdout
	exec /bin/stty -echo echonl
	set dbpw [gets stdin]
	exec /bin/stty echo
} else {
	set dbpw [gets stdin]
}

set db [GetPasswordSafeDatabase $dbpath $dbpw]

# add the password info from every specified file to the database
for {set i 1} {$i < [llength $argv]} {incr i} {
	if {[catch {AddPasswordItem $db {*}[ParseInputFile [lindex $argv $i]]} result]} {
		puts stderr $result
	}
}

# write the updated database to disk
SavePasswordSafeDatabase $db $dbpath


