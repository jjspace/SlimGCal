BUILD_DIR = dist
SASS_SRC = stylesheets
JS_SRC = js
CSS_STYLE = -t compact

.PHONY: build sass-watch package load.min.js gCal.min.js main.css

default: build

$(BUILD_DIR): 
	mkdir -p $@

load.min.js: $(JS_SRC)/load.js | $(BUILD_DIR) 
	uglifyjs -o $(addprefix $(BUILD_DIR)/, $@) $<

gCal.min.js: $(JS_SRC)/gCal.js | $(BUILD_DIR)
	uglifyjs -o $(addprefix $(BUILD_DIR)/, $@) $<

main.css: $(SASS_SRC)/main.scss | $(BUILD_DIR)
	sass $(CSS_STYLE) $< $(addprefix $(BUILD_DIR)/, $@)

build: main.css load.min.js gCal.min.js

sass-watch: 
	sass $(CSS_STYLE) --watch $(SASS_SRC)/:$(BUILD_DIR)

SlimGCal.zip: build manifest.json
	zip -r $@ $(BUILD_DIR) manifest.json

package: SlimGCal.zip

clean: 
	-@rm -rf $(BUILD_DIR) 2>/dev/null || true
	-@rm SlimGCal.zip 2>/dev/null || true
