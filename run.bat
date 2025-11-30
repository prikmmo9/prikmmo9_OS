@echo off
cd /d C:\rast\prikmmo9_OS

echo Building kernel...
cargo build

echo Creating bootable image...
copy /b target\x86_64-unknown-none\debug\prikmmo9_OS + nul boot.bin

echo Running in QEMU with kernel mode...
"C:\Program Files\qemu\qemu-system-x86_64.exe" -kernel target\x86_64-unknown-none\debug\prikmmo9_OS -display gtk

pause