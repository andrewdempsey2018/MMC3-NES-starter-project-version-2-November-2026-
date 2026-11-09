; --------------------------------------------------
;
;
; Inputs:
; 
; Clobbers: 
;
; Outputs:
;
; Notes:
;
; --------------------------------------------------

.segment "FIXED_CODE1"

.import stage1_metatiles_top_table
.import stage1_metatiles_bottom_table
.import stage1_screen1_table
.import stage1_screen1_attribs_table
.import stage1_screen2_table
.import stage1_screen2_attribs_table
.import stage1_sequence_hi_table
.import stage1_sequence_lo_table
.import stage1_attribs_sequence_hi_table
.import stage1_attribs_sequence_lo_table
.import stage1_palette_table

.import stage2_metatiles_top_table
.import stage2_metatiles_bottom_table
.import stage2_screen1_table
.import stage2_screen1_attribs_table
.import stage2_sequence_hi_table
.import stage2_sequence_lo_table
.import stage2_attribs_sequence_hi_table
.import stage2_attribs_sequence_lo_table
.import stage2_palette_table

.import stage3_metatiles_top_table
.import stage3_metatiles_bottom_table
.import stage3_screen1_table
.import stage3_screen1_attribs_table
.import stage3_sequence_hi_table
.import stage3_sequence_lo_table
.import stage3_attribs_sequence_hi_table
.import stage3_attribs_sequence_lo_table
.import stage3_palette_table

change_level:
; --------------------------------------------------
; Disable nmi/rendering
; --------------------------------------------------
  ldx #$00
  stx PPUCTRL
  stx PPUMASK

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  sta scroll_y
  sta scroll_x
; --------------------------------------------------

  lda scene_number
  cmp #LEVEL_1_SCENE
  bne :+
  jmp @level_1_scene
:
  cmp #LEVEL_2_SCENE
  bne :+
  jmp @level_2_scene
:
  cmp #LEVEL_3_SCENE
  bne :+
  jmp @level_3_scene
:

@level_1_scene:
; prg rom switch
  lda #%00000110
  sta MMC3_BANK_SELECT
  lda #0
  sta MMC3_BANK_DATA

; CHR rom switch
  lda #%00000000
  sta MMC3_BANK_SELECT
  lda #8
  sta MMC3_BANK_DATA
  
  lda #%00000001
  sta MMC3_BANK_SELECT
  lda #10
  sta MMC3_BANK_DATA

  lda #%00000010
  sta MMC3_BANK_SELECT
  lda #12
  sta MMC3_BANK_DATA

  lda #%00000011
  sta MMC3_BANK_SELECT
  lda #13
  sta MMC3_BANK_DATA

  lda #%00000100
  sta MMC3_BANK_SELECT
  lda #14
  sta MMC3_BANK_DATA

  lda #%00000101
  sta MMC3_BANK_SELECT
  lda #15
  sta MMC3_BANK_DATA

; init pointers
  lda #<stage1_screen1_table
  sta tile_ptr_lo
  lda #>stage1_screen1_table
  sta tile_ptr_hi

  lda #<stage1_screen1_attribs_table
  sta attrib_ptr_lo
  lda #>stage1_screen1_attribs_table
  sta attrib_ptr_hi

  lda #<stage1_metatiles_top_table
  sta metatile_top_ptr_lo
  lda #>stage1_metatiles_top_table
  sta metatile_top_ptr_hi

  lda #<stage1_metatiles_bottom_table
  sta metatile_bottom_ptr_lo
  lda #>stage1_metatiles_bottom_table
  sta metatile_bottom_ptr_hi

  ldy #0
:
  lda (attrib_ptr), y
  sta attrib_data, y
  iny
  cpy #8
  bne :-

  lda attrib_ptr_lo
  clc
  adc #8
  sta attrib_ptr_lo
  lda attrib_ptr_hi
  adc #0
  sta attrib_ptr_hi

  lda #0
  sta temp
  ldx #0
:
  ldy temp
  lda (tile_ptr), y
  asl a
  tay
  lda (metatile_top_ptr), y
  sta row_data, x
  iny
  inx
  lda (metatile_top_ptr), y
  sta row_data, x
  inc temp
  inx
  cpx #32
  bne :-

; turn on scrolling & MMC scanline IRQ
  lda #$01
  ;sta do_scroll
  sta do_irq

  jmp level_loaded

@level_2_scene:
; prg rom switch
  lda #%00000111
  sta MMC3_BANK_SELECT
  lda #1
  sta MMC3_BANK_DATA

; change chr
  lda #%00000000
  sta MMC3_BANK_SELECT
  lda #16
  sta MMC3_BANK_DATA
  
  lda #%00000001
  sta MMC3_BANK_SELECT
  lda #18
  sta MMC3_BANK_DATA

  lda #%00000010
  sta MMC3_BANK_SELECT
  lda #20
  sta MMC3_BANK_DATA

  lda #%00000011
  sta MMC3_BANK_SELECT
  lda #21
  sta MMC3_BANK_DATA

  lda #%00000100
  sta MMC3_BANK_SELECT
  lda #22
  sta MMC3_BANK_DATA

  lda #%00000101
  sta MMC3_BANK_SELECT
  lda #23
  sta MMC3_BANK_DATA

; init pointers
  ;lda #<stage2_sequence_lo_table
  ;sta screens_sequence_lo_ptr
  ;lda #>stage2_sequence_lo_table
  ;sta screens_sequence_lo_ptr + 1

  ;lda #<stage2_sequence_hi_table
  ;sta screens_sequence_hi_ptr
  ;lda #>stage2_sequence_hi_table
  ;sta screens_sequence_hi_ptr + 1

  ;lda #<stage2_attribs_sequence_lo_table
  ;sta attribs_sequence_lo_ptr
  ;lda #>stage2_attribs_sequence_lo_table
  ;sta attribs_sequence_lo_ptr + 1

  ;lda #<stage2_attribs_sequence_hi_table
  ;sta attribs_sequence_hi_ptr
  ;lda #>stage2_attribs_sequence_hi_table
  ;sta attribs_sequence_hi_ptr + 1

  ;lda #<stage2_metatiles_top_table
  ;sta metatiles_top_ptr
  ;lda #>stage2_metatiles_top_table
  ;sta metatiles_top_ptr + 1

  ;lda #<stage2_metatiles_bottom_table
  ;sta metatiles_bottom_ptr
  ;lda #>stage2_metatiles_bottom_table
  ;sta metatiles_bottom_ptr + 1

; turn on scrolling & MMC scanline IRQ
  lda #$01
  ;sta do_scroll
  sta do_irq

  jmp level_loaded

@level_3_scene:
  lda #$01
  ;sta do_scroll
  sta do_irq

  jmp level_loaded

level_loaded:

; --------------------------------------------------
; Enable sprites and background
; draw sprites and bg on leftmost side of screen
; NMI on, background at $1000 sprites at $0000
; --------------------------------------------------
  lda #%00011110 
  sta PPUMASK
  lda #%10001000
  sta PPUCTRL
; --------------------------------------------------

  rts