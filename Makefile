TARGETS=$(shell ls *pdf | sed s/pdf/stl/)

all: ${TARGETS}

%.dxf: %.pdf
	pstoedit -dt -f dxf:"-polyaslines -mm" $< $@

%.stl: %.dxf
	/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o $@ -D 'dxffile="$<"' letter.scad
