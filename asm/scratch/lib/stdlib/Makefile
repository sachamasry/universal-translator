stdlib.o:	stdlib.s
	as -o stdlib.o stdlib.s

debug:		stdlib.s
	as --gstabs -o stdlib.o stdlib.s

production:
	@rm -f stdlib.o
	as -o stdlib.o stdlib.s
	as -o ${DEV_INCLUDE}/stdlib.o stdlib.s

clean: 
	@rm -f *.o driver_stdlib

driver:		stdlib.o driver_stdlib.s driver_stdlib-nhtoa_nibble.s
	as --gstabs -o driver_stdlib.o driver_stdlib.s
	ld -o driver_stdlib driver_stdlib.o stdlib.o ${DEV_INCLUDE}/stdio.o

	as --gstabs -o driver_stdlib-nhtoa_nibble.o driver_stdlib-nhtoa_nibble.s
	ld -o driver_stdlib-nhtoa_nibble driver_stdlib-nhtoa_nibble.o stdlib.o ${DEV_INCLUDE}/stdio.o
