SVG = confidence.svg
PNG = $(SVG).png
JPEG = $(SVG).jpg

WIDTH = 400

all: $(PNG) $(JPEG)

$(PNG): $(SVG)
	inkscape --export-png=$@ --export-width=400 $<

$(JPEG): $(PNG)
	convert $(PNG) $(JPEG)

upload: all
	rsync --progress -v -a --inplace $(PNG) $(SVG) *.jpg *.png $(__HOMEPAGE_REMOTE_PATH)/confidence-captioned-image/
