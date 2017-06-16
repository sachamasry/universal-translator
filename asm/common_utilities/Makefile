# Source file and extension definitions
#NAME		= true
SOURCE_EXT	= asm
OBJ_EXT		= o
DEBUG_EXT	= fas
SYMBOLIC_CONST  = 

# Commands required
ASSEMBLER	= /usr/local/bin/f${SOURCE_EXT}
ASSEMBLER_OPTS	=
ASM_DEBUG_OPTS	= -s
LINKER		= /usr/bin/ld
LINKER_OPTS	= -o
RM		= /bin/rm
RM_OPTS		= -f
MV		= /bin/mv
MV_ARGS		=



# Binary file dependencies
${NAME}:		${NAME}.${OBJ_EXT}
	${LINKER} ${LINKER_OPTS} ${DEV_BIN}/${NAME} ${DEV_INCLUDE_OBJ}/${NAME}.${OBJ_EXT}



# Object file dependencies
${NAME}.${OBJ_EXT}:	${NAME}.${SOURCE_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT} ${SYMBOLIC_CONST}
	${MV} ${MV_ARGS} ${NAME}.${OBJ_EXT} ${DEV_INCLUDE_OBJ}/



# Create symbol output for debugging
debug:			${NAME}.${SOURCE_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT} ${ASM_DEBUG_OPTS} ${NAME}.${DEBUG_EXT}



production:
	@${RM} ${RM_OPTS} ${NAME}.${OBJ_EXT}
	@${RM} ${RM_OPTS} ${NAME}.${DEBUG_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT}

### Operating system portability ###
linux:			${NAME}.${SOURCE_EXT}
	${ASSEMBLER} ${NAME}.${SOURCE_EXT} -d os=2
	${MV} ${MV_ARGS} ${NAME}.${OBJ_EXT} ${DEV_INCLUDE_OBJ}/linux
	${LINKER} ${LINKER_OPTS} ${DEV_BIN}/linux/${NAME} ${DEV_INCLUDE_OBJ}/${NAME}.${OBJ_EXT}




clean: 
	@${RM} ${RM_OPTS} *.${OBJ_EXT} driver_${NAME}



driver:			driver_${NAME}.${SOURCE_EXT}
	${ASSEMBLER} driver_${NAME}.${SOURCE_EXT} ${ASM_DEBUG_OPTS} ${NAME}.${DEBUG_EXT}
	${LINKER} ${LINKER_OPTS} driver_${NAME} driver_${NAME}.o ${NAME}.o	
