BIN = node_modules/.bin

# Start the server
s:
	$(BIN)/coffee index.coffee

# Start server with local env variables
sp:
	foreman start

# Start the server using forever
sf:
	$(BIN)/forever $(BIN)/coffee index.coffee

# Generate minified assets from the /assets folder and output it to /public.
assets:
	mkdir -p public/assets
	$(foreach file, $(shell find assets -name '*.coffee' | cut -d '.' -f 1), \
		$(BIN)/browserify $(file).coffee -t jadeify -t caching-coffeeify > public/$(file).js; \
		$(BIN)/uglifyjs public/$(file).js > public/$(file).min.js \
	)
	$(BIN)/stylus assets -o public/assets
	$(foreach file, $(shell find assets -name '*.styl' | cut -d '.' -f 1), \
		$(BIN)/sqwish public/$(file).css -o public/$(file).min.css \
	)

deploy: assets
	git push git@heroku.com:surround-audience.git master
