; --------------------------------------------------
; Constants
; --------------------------------------------------
LEVEL_1_SCENE = 0
LEVEL_2_SCENE = 1
LEVEL_3_SCENE = 2

.segment "ZEROPAGE"
sleeping: .res 1
scroll_x: .res 1
scroll_y: .res 1
row_number: .res 1
do_irq: .res 1
scene_number: .res 1

tile_ptr: .res 2
tile_ptr_lo = tile_ptr
tile_ptr_hi = tile_ptr + 1

attrib_ptr: .res 2
attrib_ptr_lo = attrib_ptr
attrib_ptr_hi = attrib_ptr + 1

do_prep_row: .res 1
do_prep_attrib: .res 1

temp: .res 1
ptr: .res 2
ptr_lo = ptr
ptr_hi = ptr + 1

;;;
metatile_top_ptr: .res 2
metatile_top_ptr_lo = metatile_top_ptr
metatile_top_ptr_hi = metatile_top_ptr + 1

metatile_bottom_ptr: .res 2
metatile_bottom_ptr_lo = metatile_bottom_ptr
metatile_bottom_ptr_hi = metatile_bottom_ptr + 1

.segment "BSS"
row_data: .res 32
attrib_data: .res 8

.segment "RODATA"
palette_table:
; background
  .byte $0F,$00,$10,$30
  .byte $0F,$01,$21,$31
  .byte $0F,$06,$16,$26
  .byte $0F,$09,$19,$29
; sprites
  .byte $0F,$00,$10,$30
  .byte $0F,$01,$21,$31
  .byte $0F,$06,$16,$26
  .byte $0F,$09,$19,$29

;.include "../data/stage1_data.asm"
;.include "../data/stage2_data.asm"
;.include "../data/stage3_data.asm"
.include "../data/statusbar_data.asm"

.segment "FIXED_CODE1"
; --------------------------------------------------
; Includes for fixed bank
; --------------------------------------------------
.include "header.asm"
.include "macros.asm"
.include "constants.asm"
.include "reset.asm"
.include "nmi.asm"
.include "irq.asm"
.include "controllers.asm"
.include "change_level.asm"
.include "prepare_row.asm"
.include "draw_row.asm"

main:
; --------------------------------------------------
; Disable nmi/rendering
; --------------------------------------------------
  ldx #$00
  stx PPUCTRL
  stx PPUMASK

; --------------------------------------------------
; Load initial palette
; --------------------------------------------------
  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

  ldx #$00
:
  lda palette_table, x
  sta PPUDATA
  inx
  cpx #$20
  bne :-

; --------------------------------------------------
; Init zeropage/bss memory to initial state
; --------------------------------------------------

  lda #$00
  sta sleeping
  sta buttons_held
  sta buttons_pressed
  sta scroll_x
  sta scroll_y
  sta do_irq
  sta row_number
  sta tile_ptr_lo
  sta tile_ptr_hi
  sta attrib_ptr_lo
  sta attrib_ptr_hi
  sta do_prep_row
  sta do_prep_attrib

  sta temp
  sta ptr_lo
  sta ptr_hi

  sta metatile_top_ptr_lo
  sta metatile_top_ptr_hi
  sta metatile_bottom_ptr_lo
  sta metatile_bottom_ptr_hi

; --------------------------------------------------
; Load status bar into nametable 01 ($2400)
; --------------------------------------------------
  lda #<statusbar_table
  sta ptr_lo
  lda #>statusbar_table
  sta ptr_hi

  lda PPUSTATUS
  lda #$24
  sta PPUADDR
  lda #$00
  sta PPUADDR

  ldx #$00
  ldy #$00

:
  lda (ptr), y
  sta PPUDATA
  iny
  cpy #0
  bne :-

  inc ptr_hi
  inx
  cpx #4
  bne :-

; --------------------------------------------------
; start first level
; --------------------------------------------------

  lda #0
  sta scene_number
  jsr change_level

; --------------------------------------------------
; Enable maskable interrupts
; --------------------------------------------------
  cli

; --------------------------------------------------
; Enable sprites and background
; draw sprites and bg on leftmost side of screen
; --------------------------------------------------
  lda #%00011110 
  sta PPUMASK

; --------------------------------------------------
; NMI on, background at $1000 sprites at $0000
; --------------------------------------------------
  lda #%10001000
  sta PPUCTRL

main_loop:

; --------------------------------------------------
; Update current scene
; --------------------------------------------------
  lda scene_number
  cmp #LEVEL_1_SCENE
  beq @level_1_scene
  cmp #LEVEL_2_SCENE
  beq @level_2_scene

@level_1_scene:
  lda buttons_pressed
  and #BTN_START
  beq finished_updating_scene
  lda #$01
  sta scene_number
  jsr change_level
  jmp finished_updating_scene

@level_2_scene:
  lda buttons_pressed
  and #BTN_START
  beq finished_updating_scene
  lda #$02
  sta scene_number
  jsr change_level
  jmp finished_updating_scene

@level_3_scene:
  ; do stuff
  jmp finished_updating_scene

finished_updating_scene:

; --------------------------------------------------
; If NMI has set the prep_next_row flag then update
; tile pointer and attributes pointer in preparation
; for next row drawing opration in NMI.
; If the row_number returns to 0, this means the
; next screen should be loaded.
; Reset prep_next_row flag when done.
; --------------------------------------------------
; --------------------------------------------------
; Rendering
; --------------------------------------------------
  lda do_prep_row
  beq dont_prepare_row
  jsr prepare_row
dont_prepare_row:

; --------------------------------------------------
; Wait until NMI resets 'sleeping' to 0
; --------------------------------------------------
  lda #$01
  sta sleeping

sleep:
  lda sleeping
  bne sleep

  jmp main_loop

.segment "VECTORS"
  .word nmi
  .word reset
  .word irq

.segment "CHR_ROM"
  .incbin "../chr/gfx_other.chr" ; CHR banks 0,2,4,5,6,7
  .incbin "../chr/gfx_lev1.chr" ; CHR banks 8,10,12,13,14,15
  .incbin "../chr/gfx_lev2.chr" ; CHR banks 16,18,20,21,22,23
  .incbin "../chr/gfx_lev3.chr" ; CHR banks 24,26,28,29,30,31

.segment "CODE0"
.segment "CODE1"
.segment "CODE2"
.segment "CODE3"
.segment "CODE4"
.segment "CODE5"
.segment "FIXED_CODE0"
