use slint;

slint::include_modules!();

pub mod ui_stuff;

#[cfg(target_os="android")]
#[no_mangle]
fn android_main(app: slint::android::AndroidApp) {
    slint::android::init(app).unwrap();

    ui_stuff::draw_ui();
}

#[cfg_attr(target_arch = "wasm32",
           wasm_bindgen::prelude::wasm_bindgen(start))]
fn main() {
    ui_stuff::draw_ui();
}
