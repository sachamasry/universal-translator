string.o:	string.s
	as -o string.o string.s

debug:		string.s
	as --gstabs -o string.o string.s

production:	string.s
	@rm -f string.o
	as -o string.o string.s
	as -o ${DEV_INCLUDE}/string.o string.s

clean: 
	@rm -f *.o driver_string

driver:		string.o driver_string.s
	as -o driver_string.o driver_string.s
	ld -o driver_string driver_string.o string.o ${DEV_INCLUDE}/stdio.o ${DEV_INCLUDE}/stdlib.o
