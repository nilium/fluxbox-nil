RM := rm -vf

button_states := focus unfocus press
buttons += close
buttons += min max
buttons += stick stuck
buttons += shade unshade

.include "style.mk"

.for button in ${buttons}
${button}_unfocus_color  ?= ${unfocus_color}
${button}_focus_color    ?= ${focus_color}
${button}_press_color    ?= ${press_color}
.for state in ${button_states}
${button}_${state}_shape ?= ${${button}_shape:U${button_shape}}
.endfor
.endfor

.PHONY: all clean

all:

.for state in ${button_states}
.for button in ${buttons}
images += ${button}_${state}.xpm
${button}_${state}.xpm: style.mk
	convert -size "${size}" \
		"xc:${${state}_background}" \
		-fill "${${button}_${state}_color}" \
		-stroke "${${button}_${state}_color}" \
		${${button}_${state}_shape} \
		$@
.endfor
.endfor

all: ${images}

clean:
	${RM} ${images}
