PROGRAM_NAME := provapk
RELEASE_DIR := release

all_releases: release_android release_web release_windows 

release_android: release_directory
	 x build -r --platform android --arch arm64 --format apk
	 cp target/x/$(RELEASE_DIR)/android/$(PROGRAM_NAME).apk $(RELEASE_DIR)/
	
release_web: release_directory
	wasm-pack build --release --target web
	mkdir -p $(RELEASE_DIR)/html
	cp index.html $(RELEASE_DIR)/html
	cp -r pkg $(RELEASE_DIR)/html/pkg

release_windows: release_directory
	cargo b --release --target x86_64-pc-windows-msvc --bin $(PROGRAM_NAME)
	cp target/x86_64-pc-windows-msvc/$(RELEASE_DIR)/$(PROGRAM_NAME).exe $(RELEASE_DIR)/

release_linux: release_directory
	cargo b --release --target x86_64-unknown-linux-gnu
	cp target/x86_64-unknown-linux-gnu/$(RELEASE_DIR)/$(PROGRAM_NAME) $(RELEASE_DIR)/

release_directory: 
	mkdir -p $(RELEASE_DIR)

clean:
	rm -r $(RELEASE_DIR)
	cargo clean
