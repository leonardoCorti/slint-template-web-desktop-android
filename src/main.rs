#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

pub mod ui_stuff;

fn main() {
    ui_stuff::draw_ui();
}
