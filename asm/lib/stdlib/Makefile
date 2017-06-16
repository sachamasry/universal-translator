# Source file and extension definitions
NAME		= stdlib
DRIVER_NAME	= driver-stdlib
SOURCE_EXT	= asm
OBJ_EXT		= o
DEBUG_EXT	= fas

# Commands required
ASSEMBLER	= /usr/local/bin/fasm
ASSEMBLER_OPTS	=
ASM_DEBUG_OPTS	= -s
LINKER		= /usr/bin/ld
LINKER_OPTS	= -o
RM		= /bin/rm
RM_OPTS		= -f
CP		= /bin/cp
CP_ARGS		= 



# Object file dependencies
${NAME}.${OBJ_EXT}:	${NAME}.${SOURCE_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT}

driver-${NAME}.${OBJ_EXT}:	driver-${NAME}.${SOURCE_EXT}
	${ASSEMBLER} driver-${NAME}.${SOURCE_EXT} ${ASM_DEBUG_OPTS} ${NAME}.${DEBUG_EXT}



# Make procedure library driver
driver-${NAME}:		driver-${NAME}.${OBJ_EXT} ${NAME}.${OBJ_EXT}
	${LINKER} ${LINKER_OPTS} driver-${NAME} driver-${NAME}.o ${NAME}.o	




# Create symbol output for debugging
debug:			${NAME}.${SOURCE_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT} ${ASM_DEBUG_OPTS} ${NAME}.${DEBUG_EXT}



production:
	@${RM} ${RM_OPTS} ${NAME}.${OBJ_EXT}
	@${RM} ${RM_OPTS} ${NAME}.${DEBUG_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT}
	${CP} ${CP_ARGS} ${NAME}.${OBJ_EXT} ${DEV_INCLUDE_OBJ}/




clean: 
	@${RM} ${RM_OPTS} *.${OBJ_EXT} driver_${NAME}





test:			driver-${NAME}
	./driver-${NAME}
