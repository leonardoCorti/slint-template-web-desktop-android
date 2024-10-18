# Variables
PROGRAM := "provapk"
RELEASE_DIR := "release"

# Define the release directory target
release_directory:
    mkdir -p {{RELEASE_DIR}}

# Android release target
release_android: release_directory
    x build -r --platform android --arch arm64 --format apk
    cp target/x/release/android/{{PROGRAM}}.apk {{RELEASE_DIR}}/

# Web release target
release_web: release_directory
    wasm-pack build --release --target web
    mkdir -p {{RELEASE_DIR}}/html
    cp index.html {{RELEASE_DIR}}/html
    cp -r pkg {{RELEASE_DIR}}/html/pkg

# Windows release target
release_windows: release_directory
    cargo b --release --target x86_64-pc-windows-msvc --bin {{PROGRAM}}
    cp target/x86_64-pc-windows-msvc/release/{{PROGRAM}}.exe {{RELEASE_DIR}}/

# Linux release target
release_linux: release_directory
    cargo b --release --target x86_64-unknown-linux-gnu
    cp target/x86_64-unknown-linux-gnu/release/{{PROGRAM}} {{RELEASE_DIR}}/

# Clean target to remove build artifacts
clean:
    rm -r {{RELEASE_DIR}}
    cargo clean

# Meta target to release for all platforms
all_releases: release_android release_web release_windows release_linux

