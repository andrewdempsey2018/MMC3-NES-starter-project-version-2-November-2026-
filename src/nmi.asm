.segment "FIXED_CODE1"
nmi:
  SAVE_REGISTERS

  ldx #$00
  stx PPUCTRL
  stx PPUMASK
  lda PPUSTATUS

; --------------------------------------------------
; IRQ only tasks
; Code that executes when MMC3 scanline IRQ is on.
; --------------------------------------------------
  lda do_irq
  beq no_irq

; IRQ changes some palette values to colors needed
; for status bar, restore these to orignal values.
  ;lda #$3F
  ;sta PPUADDR
  ;lda #$01
  ;sta PPUADDR
  ;lda #$00
  ;sta PPUDATA
  ;lda #$10
  ;sta PPUDATA

; draw some demo text to status bar
; inefficient code, for demo purposes
; value to be displayed should be calculated outside of NMI
  ;lda PPUSTATUS
  ;lda #$24
  ;sta PPUADDR
  ;lda #$4F
  ;sta PPUADDR
  ;lda scroll_y
  ;and #%11110000
  ;lsr a
  ;lsr a
  ;lsr a
  ;lsr a
  ;clc
  ;adc #$40
  ;sta PPUDATA
  ;lda scroll_y
  ;and #%00001111
  ;clc
  ;adc #$40
  ;sta PPUDATA

no_irq:

; --------------------------------------------------
; Trigger sprite DMA transfer
; --------------------------------------------------
  lda #$02
  sta OAMDMA

; --------------------------------------------------
; Reset OAM address
; --------------------------------------------------
  lda #$00
  sta OAMADDR

; --------------------------------------------------
; Read player input
; --------------------------------------------------
  jsr read_controller

; --------------------------------------------------
; Draw tile
; --------------------------------------------------

  lda do_scroll
  beq dont_scroll

  lda scroll_y
  and #%00000111 ; multiple of 8
  bne dont_draw_row

  inc row_number
  lda row_number
  cmp #30
  bne :+
  lda #0
  sta row_number
:
  
; at row 28, everything for the current sreen is prepared in ram
; change sequece in preparation for the next screen of assets
  lda row_number
  cmp #28
  bne dont_set_sequence_flag
  lda #1
  sta do_inc_sequence
dont_set_sequence_flag:

; is row_number odd or even
  lda row_number
  and #$01
  beq is_even
is_odd:
  jsr draw_bottom_row
  jmp dont_draw_row
is_even:
  jsr draw_top_row
dont_draw_row:

  lda scroll_y
  and #%00011111 ; multiple of 32
  bne dont_draw_attribs
  jsr draw_attributes
dont_draw_attribs:

; --------------------------------------------------
; Handle scrolling
; --------------------------------------------------
  inc scroll_y
  lda scroll_y
  cmp #240
  bne dont_reset_scroll_value
  lda #0
  sta scroll_y
dont_reset_scroll_value:

dont_scroll:
  lda scroll_x
  sta PPUSCROLL
  lda scroll_y
  sta PPUSCROLL

; --------------------------------------------------
; Toggle sleeping flag
; --------------------------------------------------
  lda #$00
  sta sleeping

; --------------------------------------------------
; If IRQ is on,
; --------------------------------------------------
  lda do_irq
  beq no_irq_reload
  sta MMC3_IRQ_ENABLE
  sta MMC3_IRQ_RELOAD
no_irq_reload:

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

  RESTORE_REGISTERS

  rti