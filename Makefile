ifeq ($(shell uname -s),Darwin)
	SCAD:=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
else
	SCAD:=openscad
endif

FILES=out/plate_left.3mf \
      out/plate_right.3mf \
			out/tub.3mf \
			out/projects.3mf \
			out/projects_cover.3mf \
			out/prelude_companies.3mf \
			out/money.3mf \
			out/brown_hexes.3mf

all: ${FILES}

out:
	mkdir -p out

out/plate_left.3mf: modules/plates.scad
out/plate_right.3mf: modules/plates.scad
out/tub.3mf: modules/tubs.scad
out/brown_hexes.3mf: modules/tubs.scad
out/money.3mf: modules/tubs.scad
out/projects.3mf: modules/cards.scad
out/prelude_companies.3mf: modules/cards.scad

out/%.3mf: parts/%.scad out
	${SCAD} -q -o $@ $<