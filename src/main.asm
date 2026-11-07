; --------------------------------------------------
; Constants
; --------------------------------------------------
TITLE_SCREEN_SCENE = 0
LEVEL_1_SCENE = 1
LEVEL_2_SCENE = 2

.segment "ZEROPAGE"
sleeping: .res 1
scroll_x: .res 1
scroll_y: .res 1
ptr: .res 2
ptr_lo = ptr
ptr_hi = ptr+1
row_number: .res 1
row_tile_ptr: .res 2
row_tile_ptr_lo = row_tile_ptr
row_tile_ptr_hi = row_tile_ptr+1
row_attrib_ptr: .res 2
row_attrib_ptr_lo = row_attrib_ptr
row_attrib_ptr_hi = row_attrib_ptr+1
prep_next_row: .res 1
screen_number: .res 1
do_scroll: .res 1
do_irq: .res 1
scene_number: .res 1

screens_sequence_lo_ptr: .res 2
screens_sequence_hi_ptr: .res 2

attribs_sequence_lo_ptr: .res 2
attribs_sequence_hi_ptr: .res 2

metatiles_top_ptr: .res 2
metatiles_bottom_ptr: .res 2


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

.include "../data/title_data.asm"
.include "../data/stage1_data.asm"
.include "../data/stage2_data.asm"
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
.include "prepare_row.asm"
.include "draw_row.asm"
.include "change_level.asm"

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
  sta ptr_lo
  sta ptr_hi
  sta prep_next_row
  sta screen_number
  sta do_scroll
  sta do_irq
  sta row_number

  sta screens_sequence_lo_ptr
  sta screens_sequence_lo_ptr + 1
  sta screens_sequence_hi_ptr
  sta screens_sequence_hi_ptr + 1

  sta attribs_sequence_lo_ptr
  sta attribs_sequence_lo_ptr + 1
  sta attribs_sequence_hi_ptr
  sta attribs_sequence_hi_ptr + 1

  sta metatiles_top_ptr
  sta metatiles_top_ptr + 1
  sta metatiles_bottom_ptr
  sta metatiles_bottom_ptr + 1

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

  lda #1
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
  cmp #TITLE_SCREEN_SCENE
  beq @title_screen_scene
  cmp #LEVEL_1_SCENE
  beq @level_1_scene
  cmp #LEVEL_2_SCENE
  beq @level_2_scene

@title_screen_scene:
  lda buttons_pressed
  and #BTN_START
  beq finished_updating_scene
  lda #$01
  sta scene_number
  jsr change_level
  jmp finished_updating_scene

@level_1_scene:
  lda buttons_pressed
  and #BTN_START
  beq finished_updating_scene
  lda #$02
  sta scene_number
  jsr change_level
  jmp finished_updating_scene

@level_2_scene:
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
  lda prep_next_row
  beq dont_prepare_row
  jsr prepare_row

  lda #$00
  sta prep_next_row

  dec row_number

  lda row_number
  cmp #255
  bne dont_reset_row_number
  lda #14
  sta row_number
  
  inc screen_number

  ldy screen_number
  lda (screens_sequence_lo_ptr), y
  sta row_tile_ptr_lo
  lda (screens_sequence_hi_ptr), y
  sta row_tile_ptr_hi


; attribs
  ;lda (stage1_attribs_sequence_lo_table), y
  ;sta row_attrib_ptr_lo
  ;lda (stage1_attribs_sequence_hi_table), y
  ;sta row_attrib_ptr_hi

dont_reset_row_number:

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
  .incbin "../chr/gfx_title.chr"
  .incbin "../chr/gfx_lev1.chr"
  .incbin "../chr/gfx_lev2.chr"
  .incbin "../chr/gfx_lev3.chr"

.segment "CODE0"
.segment "CODE1"
.segment "CODE2"
.segment "CODE3"
.segment "CODE4"
.segment "CODE5"
