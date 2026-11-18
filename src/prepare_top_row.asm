.segment "FIXED_CODE0"
prepare_top_row:

  lda #0
  sta temp
  ldx #0
@loop:
  ldy temp
  lda (tile_ptr),y
  asl a
  tay
  lda (metatile_top_ptr),y
  sta row_top_data,x
  iny
  inx
  lda (metatile_top_ptr),y
  sta row_top_data,x
  inc temp
  inx
  cpx #32
  bne @loop

  lda #$00
  sta do_prep_top_row
  
  rts