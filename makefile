BUILD_DIR = dist
SASS_SRC = stylesheets
JS_SRC = js
CSS_STYLE = -t compact

.PHONY: build sass-watch package load.min.js gCal.min.js main.css

default: build

$(BUILD_DIR): 
	mkdir -p $@

load.min.js: $(BUILD_DIR)/load.min.js
$(BUILD_DIR)/load.min.js: $(BUILD_DIR) $(JS_SRC)/load.js
	uglifyjs -o $@ $(word 2,$^)

gCal.min.js: $(BUILD_DIR)/gCal.min.js
$(BUILD_DIR)/gCal.min.js: $(BUILD_DIR) $(JS_SRC)/gCal.js
	uglifyjs -o $@ $(word 2,$^)

main.css: $(BUILD_DIR)/main.css
$(BUILD_DIR)/main.css: $(BUILD_DIR) $(SASS_SRC)/main.scss
	sass $(CSS_STYLE) $(word 2,$^) $@

build: $(BUILD_DIR) main.css load.min.js gCal.min.js

sass-watch: 
	sass $(CSS_STYLE) --watch $(SASS_SRC)/:$(BUILD_DIR)

SlimGCal.zip: build manifest.json
	zip -r $@ $(BUILD_DIR) manifest.json

package: SlimGCal.zip
