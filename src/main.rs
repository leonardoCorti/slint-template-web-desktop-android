#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

pub mod ui_stuff;

#[cfg_attr(target_arch = "wasm32",
           wasm_bindgen::prelude::wasm_bindgen(start))]
fn main() {
    ui_stuff::draw_ui();
}

#[cfg(target_os="android")]
#[no_mangle]
fn android_main(app: slint::android::AndroidApp) {
    ui_stuff::draw_ui();
}
