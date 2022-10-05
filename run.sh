#!/usr/bin/expect

set timeout 100

set cpus {qemu_arc_hs5x qemu_arc_hs6x}
set bmrks {core cjpeg-rose7-preset parser-125k sha-test zip-test}

for {set j 0} {$j < [llength $cpus]} {incr j} {
    for {set i 0 } {$i < [llength $bmrks]} {incr i} {
	spawn west build -p -b [lindex $cpus $j] \
	    coremark-pro-zephyr/[lindex $bmrks $i] && west build -t run
	expect " Done:[lindex $bmrks $i]="
    }
}
