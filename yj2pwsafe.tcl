#!/usr/bin/tclsh

lappend auto_path gorilla-libs
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
proc ParsePasswordFile {path} {
	set f [open $path]
	regexp {^Name: (.*)$} [gets $f] match name
	regexp {^Location: (.*)$} [gets $f] match location
	regexp {^Account: (.*)$} [gets $f] match account
	regexp {^Password: (.*)$} [gets $f] match password
	# assuming only the comments field may contain multiple lines
	regexp {^Comments: (.*)$} [read $f nonewline] match comments
	close $f
	return [list $name $location $account $password $comments]
}



# require at least one password file
if {$argc < 3} {
	puts stderr "$argv0 DB_PATH DB_PASSWORD PW_FILE \[PW_FILE ...\]"
	exit
}

# load or create a pwsafe database 
set dbpath [lindex $argv 0]
set dbpw [lindex $argv 1]
set db [GetPasswordSafeDatabase $dbpath $dbpw]

# add the password info from every specified file to the database
for {set i 2} {$i < [llength $argv]} {incr i} {
	AddPasswordItem $db {*}[ParsePasswordFile [lindex $argv $i]]
}

# write the updated database to disk
SavePasswordSafeDatabase $db $dbpath


