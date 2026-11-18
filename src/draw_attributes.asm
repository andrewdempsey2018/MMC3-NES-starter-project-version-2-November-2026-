.segment "RODATA"


attribs_address_lo_table:
  .byte $C0,$FF,$FF,$FF,$C8,$FF,$FF,$FF,$D0,$FF,$FF,$FF,$D8,$FF,$FF,$FF,$E0,$FF,$FF,$FF,$E8,$FF,$FF,$FF,$F0,$FF,$FF,$FF,$F8,$FF

.segment "FIXED_CODE0"
draw_attributes:
  ldx row_number

  lda PPUSTATUS
  lda #$23 ; high byte of attribs address for this nametable
  sta PPUADDR
  lda attribs_address_lo_table,x
  sta PPUADDR

  ldx #$00
@loop:
  lda attrib_data,x
  sta PPUDATA
  inx
  cpx #8
  bne @loop

  lda #$01
  sta do_prep_attrib
  
  rts