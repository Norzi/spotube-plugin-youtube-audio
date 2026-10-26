.PHONY: compile test archive clean

compile:
	mkdir -p build
	hetu compile src/plugin.ht build/plugin.out

# The compile target is intentionally separate from static contract tests.
test:
	python3 tests/static_test.py
	$(MAKE) compile

archive: compile
	mkdir -p build/archive
	cp plugin.json build/plugin.out build/archive/
	cd build/archive && zip -q -r ../plugin.smplug .

clean:
	rm -rf build
