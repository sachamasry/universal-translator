#!/bin/ksh

# Define name of script that will extract the system call definitions
EXTRACTION_SCRIPT=./extract_openbsd_syscalls-script
echo $EXTRACTION_SCRIPT

# Determine whether the syscall.h file exists on this system
#if [ -x /usr/include/sys/syscall.h ]; then
	SYSCALL_SOURCE=/usr/include/sys/syscall.h	
#elif
#	exit
#fi

OUTPUT_FILE=openbsd_syscalls.inc.new
rm $OUTPUT_FILE
if [ -x ./openbsd_syscalls.inc ]; then
#	OUTPUT_FILE=openbsd`uname -r`_syscalls-`date "+%y%m%d"`.inc
	OUTPUT_FILE=openbsd_syscalls.inc.old
fi

# Print location of syscall.h file
echo "OpenBSD "`uname -r`" system calls for the "`uname -m`" architecture are defined in: "$SYSCALL_SOURCE

echo $OUTPUT_FILE
cat $SYSCALL_SOURCE > $OUTPUT_FILE
ex - $OUTPUT_FILE < $EXTRACTION_SCRIPT
