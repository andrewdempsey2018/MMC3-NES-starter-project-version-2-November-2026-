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

;.segment "RODATA"



.segment "FIXED_CODE1"

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
  ;lda #<stage1_sequence_lo_table
  ;sta screens_sequence_lo_ptr
  ;lda #>stage1_sequence_lo_table
  ;sta screens_sequence_lo_ptr + 1

  ;lda #<stage1_sequence_hi_table
  ;sta screens_sequence_hi_ptr
  ;lda #>stage1_sequence_hi_table
  ;sta screens_sequence_hi_ptr + 1

  ;lda #<stage1_attribs_sequence_lo_table
  ;sta attribs_sequence_lo_ptr
  ;lda #>stage1_attribs_sequence_lo_table
  ;sta attribs_sequence_lo_ptr + 1

  ;lda #<stage1_attribs_sequence_hi_table
  ;sta attribs_sequence_hi_ptr
  ;lda #>stage1_attribs_sequence_hi_table
  ;sta attribs_sequence_hi_ptr + 1

  ;lda #<stage1_metatiles_top_table
  ;sta metatiles_top_ptr
  ;lda #>stage1_metatiles_top_table
  ;sta metatiles_top_ptr + 1

  ;lda #<stage1_metatiles_bottom_table
  ;sta metatiles_bottom_ptr
  ;lda #>stage1_metatiles_bottom_table
  ;sta metatiles_bottom_ptr + 1

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