dirs += pixmaps

.PHONY: all clean

all:

.for dir in ${dirs}
makefiles += ${dir}/Makefile
${dir}/Makefile!
	${MAKE} -C ${dir}
.endfor

all: ${makefiles}

clean:
.for dir in ${dirs}
	${MAKE} -C ${dir} $@
.endfor
