BUILD_DIR = .
SASS_SRC = stylesheets
JS_SRC = js
OUTSTYLE = -t compact

.PHONY: build build-watch package

default: build

build: $(SASS_SRC)/main.scss
	sass $(OUTSTYLE) $< $(BUILD_DIR)/main.css

build-watch: 
	sass $(OUTSTYLE) --watch $(SASS_SRC)/:$(BUILD_DIR)

package: gCal.js load.js main.css manifest.json
	zip SlimGCal $?
