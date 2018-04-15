RM := rm -vf

button_states := focus unfocus press
buttons += close
buttons += min max
buttons += stick stuck
buttons += shade unshade

size ?= 30x30

unfocus_background ?= \#282828
focus_background   ?= \#121212
press_background   ?= ${focus_background}
hilite_color       ?= \#9a77f6

button_shape       ?= -strokewidth 0 -draw "circle 14.5,13.5 8,13.5"

unfocus_color      ?= \#444444
focus_color        ?= \#666666
press_color        ?= \#dfdfdf

close_focus_color  ?= \#cf5449
close_press_color  ?= \#ff5449

max_focus_color    ?= \#54b959
max_press_color    ?= \#74ef69

min_focus_color    ?= \#df8439
min_press_color    ?= \#fea449

pin_shape          ?= -draw "roundRectangle 8,11 22,19 3,3"
stick_shape        ?= -strokewidth 2 -fill none ${pin_shape}
stuck_shape        ?= -strokewidth 0 ${pin_shape}

shade_shape         ?= -fill none -strokewidth 2 -draw "polyline 8,17 14.5,11 22,17"
shade_press_shape   ?= -fill none -strokewidth 2 -draw "polyline 8,15 14.5,13 22,15"
unshade_shape       ?= -fill none -strokewidth 2 -draw "polyline 8,11 14.5,17 22,11"
unshade_press_shape ?= -fill none -strokewidth 2 -draw "polyline 8,13 14.5,15 22,13"

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
${button}_${state}.xpm!
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
