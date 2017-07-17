BUILD_DIR = dist
SASS_SRC = stylesheets
JS_SRC = js
CSS_STYLE = -t compact

.PHONY: build build-watch package

default: build

$(BUILD_DIR): 
	mkdir -p $@

load.min.js: $(BUILD_DIR) $(JS_SRC)/load.js
	uglifyjs -o $(BUILD_DIR)/$@ $(word 2,$^)

gCal.min.js: $(BUILD_DIR) $(JS_SRC)/gCal.js
	uglifyjs -o $(BUILD_DIR)/$@ $(word 2,$^)

main.css: $(BUILD_DIR) $(SASS_SRC)/main.scss
	sass $(CSS_STYLE) $(word 2,$^) $(BUILD_DIR)/$@

build: main.css load.min.js gCal.min.js

build-watch: 
	sass $(CSS_STYLE) --watch $(SASS_SRC)/:$(BUILD_DIR)

SlimGCal.zip: build manifest.json
	zip -r $@ $^

package: SlimGCal.zip
