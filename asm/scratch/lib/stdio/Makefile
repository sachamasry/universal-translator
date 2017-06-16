# Source file and extension definitions
#NAME		= true
SOURCE_EXT	= asm
OBJ_EXT		= o
DEBUG_EXT	= fas

# Commands required
ASSEMBLER	= /usr/local/bin/f${SOURCE_EXT}
ASSEMBLER_OPTS	=
ASM_DEBUG_OPTS	= -s
LINKER		= /usr/bin/ld
LINKER_OPTS	= -o
RM		= /bin/rm
RM_OPTS		= -f



# Binary file dependencies
${NAME}:		${NAME}.${OBJ_EXT}
#	${LINKER} ${LINKER_OPTS} ${NAME} ${NAME}.${OBJ_EXT}



# Object file dependencies
${NAME}.${OBJ_EXT}:	${NAME}.${SOURCE_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT}



# Create symbol output for debugging
debug:			${NAME}.${SOURCE_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT} ${ASM_DEBUG_OPTS} ${NAME}.${DEBUG_EXT}



production:
	@${RM} ${RM_OPTS} ${NAME}.${OBJ_EXT}
	@${RM} ${RM_OPTS} ${NAME}.${DEBUG_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT}




clean: 
	@${RM} ${RM_OPTS} *.${OBJ_EXT} driver_${NAME}



driver:			driver_${NAME}.${SOURCE_EXT}
	${ASSEMBLER} driver_${NAME}.${SOURCE_EXT} ${ASM_DEBUG_OPTS} ${NAME}.${DEBUG_EXT}
	${LINKER} ${LINKER_OPTS} driver_${NAME} driver_${NAME}.o ${NAME}.o	
