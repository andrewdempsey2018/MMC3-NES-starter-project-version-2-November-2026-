.segment "FIXED_CODE0"
prepare_bottom_row:

  lda #0
  sta temp
  ldx #0
@loop:
  ldy temp
  lda (tile_ptr),y
  asl a
  tay
  lda (metatile_bottom_ptr),y
  sta row_bottom_data,x
  iny
  inx
  lda (metatile_bottom_ptr),y
  sta row_bottom_data,x
  inc temp
  inx
  cpx #32
  bne @loop

  lda tile_ptr_lo
  clc
  adc #16
  sta tile_ptr_lo
  lda tile_ptr_hi
  adc #0
  sta tile_ptr_hi

  lda #$00
  sta do_prep_bottom_row
  
  rts