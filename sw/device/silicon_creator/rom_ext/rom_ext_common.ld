/* Copyright lowRISC contributors. */
/* Licensed under the Apache License, Version 2.0, see LICENSE for details. */
/* SPDX-License-Identifier: Apache-2.0 */

/**
 * NOTE:
 * This is an incomplete common portion of ROM_EXT linker file, and should not
 * be used directly. Instead it should be included by a top level ROM_EXT slot
 * linker file.
 */

OUTPUT_ARCH(riscv)
GROUP(-lgcc)

/**
 * Indicate that there are no dynamic libraries, whatsoever.
 */
__DYNAMIC = 0;

/**
 * Marking the entry point correctly for the ELF file. The signer tool will
 * transfer this value to the `entry_point` field of the manifest, which will
 * then be used by `mask_rom_boot` to handover execution to ROM_EXT.
 */
ENTRY(_rom_ext_start_boot)

/**
 * NOTE: We have to align each section to word boundaries as our current
 * s19->slm conversion scripts are not able to handle non-word aligned sections.
 */
SECTIONS {
  .manifest _slot_start_address : {
    KEEP(*(.manifest))
  } > eflash

  /**
   * Ibex interrupt vector.
   *
   * This has to be set up at a 256-byte offset, so that we can use it with
   * Ibex.
   */
  .vectors : ALIGN(256) {
    _text_start = .;
    KEEP(*(.vectors))
  } > eflash

  /**
   * C runtime (CRT) section, containing program initialization code.
   */
  .crt : ALIGN(4) {
    KEEP(*(.crt))
  } > eflash

  /**
   * Standard text section, containing program code.
   */
  .text : ALIGN(4) {
    *(.text)
    *(.text.*)

    /* Ensure section end is word-aligned. */
    . = ALIGN(4);
  } > eflash

  /**
   * Shutdown text section, containing shutdown function(s).
   *
   * This must be the last executable section in the ROM_EXT flash image.
   */
  .shutdown : ALIGN(4) {
    *(.shutdown)
    *(.shutdown.*)

    /* Ensure section end is word-aligned. */
    . = ALIGN(4);
    _text_end = .;
  } > eflash

  /**
   * Read-only data section, containing all large compile-time constants, like
   * strings.
   */
  .rodata : ALIGN(4) {
    /* Small read-only data comes before regular read-only data for the same
     * reasons as in the data section */
    *(.srodata)
    *(.srodata.*)
    *(.rodata)
    *(.rodata.*)
  } > eflash

  /**
   * Critical static data that is accessible by both the mask ROM and the ROM
   * extension.
   *
   * Each variable added to .static_critical must be in its own subsection
   * named after the variable.
   *
   * This data is not initialized during CRT (hence NOLOAD). Instead it will
   * be initialized by the mask ROM.
   */
  .static_critical ORIGIN(ram_main) (NOLOAD) : ALIGN(4) {
    INCLUDE sw/device/silicon_creator/lib/base/static_critical.ld
  } > ram_main

  /**
   * Mutable data section, at the bottom of ram_main. This will be initialized
   * from flash at runtime by the CRT.
   *
   * Load this by copying the bytes from [_data_init_start, _data_init_end] into
   * the range [_data_start, _data_end].
   */
  .data : ALIGN(4) {
    _data_start = .;
    _data_init_start = LOADADDR(.data);

    /* This will get loaded into `gp`, and the linker will use that register for
     * accessing data within [-2048,2047] of `__global_pointer$`.
     *
     * This is much cheaper (for small data) than materializing the
     * address and loading from that (which will take one extra instruction).
     */
    __global_pointer$ = . + 2048;

    /* Small data should come before larger data. This helps to ensure small
     * globals are within 2048 bytes of the value of `gp`, making their accesses
     * hopefully only take one instruction. */
    *(.sdata)
    *(.sdata.*)

    /* Other data will likely need multiple instructions to load, so we're less
     * concerned about address materialisation taking more than one instruction.
     */
    *(.data)
    *(.data.*)

    /* Ensure section end is word-aligned. */
    . = ALIGN(4);
    _data_end = .;
    _data_init_end = LOADADDR(.data) + SIZEOF(.data);

    /* This puts it in ram_main at runtime (for the VMA), but puts the section
     * into flash for load time (for the LMA). This is why `_data_init_*` uses
     * `LOADADDR`.
     *
     * Using `AT>` means we don't have to keep track of the next free part of
     * flash, as we do in our other linker scripts. */
  } > ram_main AT> eflash

  /**
   * Standard BSS section. This will be zeroed at runtime by the CRT.
   */
  .bss : ALIGN(4) {
    _bss_start = .;

    /* Small BSS comes before regular BSS for the same reasons as in the data
     * section */
    *(.sbss)
    *(.sbss.*)
    *(.bss)
    *(.bss.*)

    /* Ensure section end is word-aligned. */
    . = ALIGN(4);
    _bss_end = .;
  } > ram_main

  /* ELF-internal Sections. */
  .symtab 0x0 : { *(.symtab) }
  .strtab 0x0 : { *(.strtab) }
  .shstrtab 0x0 : { *(.shstrtab) }

  /* Preserve RISC-V Attributes */
  .riscv.attributes 0x0 : { *(.riscv.attributes) }

  /* Preserve Debug Info in ELF Files */
  .debug_info 0x0 : { *(.debug_info) }
  .debug_abbrev 0x0 : { *(.debug_abbrev) }
  .debug_aranges 0x0 : { *(.debug_aranges) }
  .debug_line 0x0 : { *(.debug_line) }
  .debug_loc 0x0 : { *(.debug_loc) }
  .debug_ranges 0x0 : { *(.debug_ranges) }
  .debug_str 0x0 : { *(.debug_str) }
  .debug_frame 0x0 : { *(.debug_frame) }

  /* Discarded Sections (Not needed in device images). */
  /DISCARD/ : {
    /* We don't keep unwind information */
    *(.eh_frame)
    *(.eh_frame_hdr)

    /* Compiler Information */
    *(.comment)
    *(.comment.*)

    /* Other Notes */
    *(.note)
    *(.note.*)

    /* Relocations */
    *(.rela.*)
    *(.rela.dyn)

    /* STAB Debugging Info - We Use DWARF */
    *(.stab)
    *(.stab.*)
    *(.stabstr)

    /* COMMON Sections */
    *(COMMON)
  }
}
