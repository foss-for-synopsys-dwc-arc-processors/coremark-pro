#!/usr/bin/expect

set timeout 100

set cpus { qemu_arc_hs6x}
set bmrks {core cjpeg-rose7-preset parser-125k sha-test zip-test}
set i 0
set j 0

while {$j < [llength $cpus]} {
while {$i < [llength $bmrks]} {
	  spawn west build -p -b [lindex $cpus $j] \
		[lindex $bmrks $i] && west build -t run
	  expect " Done:[lindex $bmrks $i]="
	  incr i;
      }
      incr j
}
