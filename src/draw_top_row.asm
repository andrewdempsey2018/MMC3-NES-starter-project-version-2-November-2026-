.segment "FIXED_CODE0"
draw_top_row:

; drawing tiles
  ldx row_number

  lda PPUSTATUS
  lda row_address_hi_table,x
  sta PPUADDR
  lda row_address_lo_table,x
  sta PPUADDR

  ldx #$00
@loop:
  lda row_top_data,x
  sta PPUDATA
  inx
  cpx #32
  bne @loop

  lda #$01
  sta do_prep_top_row
  
  rts