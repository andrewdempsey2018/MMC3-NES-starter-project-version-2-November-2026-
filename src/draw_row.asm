.segment "RODATA"

row_address_hi_table:
  .byte $20,$20,$20,$20,$20,$20,$20,$20,$21,$21,$21,$21,$21,$21,$21,$21,$22,$22,$22,$22,$22,$22,$22,$22,$23,$23,$23,$23,$23,$23
row_address_lo_table:
  .byte $00,$20,$40,$60,$80,$A0,$C0,$E0,$00,$20,$40,$60,$80,$A0,$C0,$E0,$00,$20,$40,$60,$80,$A0,$C0,$E0,$00,$20,$40,$60,$80,$A0

attribs_address_lo_table:
  .byte $C0,$FF,$FF,$FF,$C8,$FF,$FF,$FF,$D0,$FF,$FF,$FF,$D8,$FF,$FF,$FF,$E0,$FF,$FF,$FF,$E8,$FF,$FF,$FF,$F0,$FF,$FF,$FF,$F8,$FF

.segment "FIXED_CODE0"
draw_row:
  lda row_number
  tax

; drawing attribs
  and #%00000011 ; multiple of 4
  bne dont_draw_attribs

  lda PPUSTATUS
  lda #$23 ; high byte of attribs address for this nametable
  sta PPUADDR
  lda attribs_address_lo_table, x
  sta PPUADDR

  ldx #$00
:
  lda attrib_data, x
  sta PPUDATA
  inx
  cpx #8
  bne :-

  lda #$01
  sta do_prep_attrib

dont_draw_attribs:

; drawing tiles
  ldx row_number

  lda PPUSTATUS
  lda row_address_hi_table, x
  sta PPUADDR
  lda row_address_lo_table, x
  sta PPUADDR

  ldx #$00
:
  lda row_data, x
  sta PPUDATA
  inx
  cpx #32
  bne :-

  lda #$01
  sta do_prep_row
  
  rts