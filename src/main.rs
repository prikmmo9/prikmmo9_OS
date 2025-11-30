#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[no_mangle]
pub extern "C" fn _start() -> ! {
    unsafe {
        // Максимально просто - пишем в VGA
        let vga = 0xb8000 as *mut u8;
        *vga = b'H';
        *vga.add(1) = 0x0A;
        *vga.add(2) = b'i';
        *vga.add(3) = 0x0A;
        *vga.add(4) = b'!';
        *vga.add(5) = 0x0A;
    }
    loop {}
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}