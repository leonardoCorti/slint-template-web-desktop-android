all_releases: release_android release_web release_windows 

release_android: release_directory
	 x build -r --platform android --arch arm64 --format apk
	 cp target/x/release/android/provapk.apk release/
	
release_web: release_directory
	wasm-pack build --release --target web
	mkdir -p release/html
	cp index.html release/html
	cp -r pkg release/html/pkg

release_windows: release_directory
	cargo b --release --target x86_64-pc-windows-msvc --bin provapk
	cp target/x86_64-pc-windows-msvc/release/provapk.exe release/

release_linux: release_directory
	cargo b --release --target x86_64-unknown-linux-gnu

release_directory: 
	mkdir -p release

clean:
	rm -r release
	cargo clean
