# Source file and extension definitions
NAME		= cpuid
SOURCE_EXT	= asm
OBJ_EXT		= o
DEBUG_EXT	= fas

# Commands required
ASSEMBLER	= /usr/local/bin/f${SOURCE_EXT}
ASSEMBLER_ARGS	=
ASM_DEBUG_ARGS	= -s
LINKER		= /usr/bin/ld
LINKER_ARGS	= -o
RM		= /bin/rm
RM_ARGS		= -f
CP		= /bin/cp
CP_ARGS		=
MV		= /bin/mv
MV_ARGS		=


# Define dependencies
OBJ_DEPENDENCIES	= ${DEV_INCLUDE_OBJ}/stdlib.o


# Binary file dependencies
${NAME}:		${NAME}.${OBJ_EXT}
	${LINKER} ${LINKER_ARGS} ${DEV_BIN}/${NAME} ${NAME}.${OBJ_EXT} ${OBJ_DEPENDENCIES}



# Object file dependencies
${NAME}.${OBJ_EXT}:	${NAME}.${SOURCE_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT}



# Create symbol output for debugging
debug:			${NAME}.${SOURCE_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT} ${ASM_DEBUG_ARGS} ${NAME}.${DEBUG_EXT}



production:
	@${RM} ${RM_ARGS} ${NAME}.${OBJ_EXT}
	@${RM} ${RM_ARGS} ${NAME}.${DEBUG_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT}
	${LINKER} ${LINKER_ARGS} ${NAME} ${NAME}.${OBJ_EXT} ${OBJ_DEPENDENCIES}.${OBJ_EXT}




clean: 
	@${RM} ${RM_ARGS} *.${OBJ_EXT} ${NAME} *.${DEBUG_EXT} driver_${NAME}



driver:			driver_${NAME}.${SOURCE_EXT}
	${ASSEMBLER} driver_${NAME}.${SOURCE_EXT} ${ASM_DEBUG_ARGS} ${NAME}.${DEBUG_EXT}
	${LINKER} ${LINKER_ARGS} driver_${NAME} driver_${NAME}.o ${NAME}.o	
