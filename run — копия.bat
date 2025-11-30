@echo off
cd /d C:\rast\prikmmo9_OS

echo Setting up nightly Rust...
rustup override set nightly
rustup component add rust-src --toolchain nightly

echo Building bootable image...
cargo bootimage

echo Starting QEMU...
"C:\Program Files\qemu\qemu-system-x86_64.exe" -drive format=raw,file=target\x86_64-unknown-none\debug\bootimage-prikmmo9_OS.bin

pause