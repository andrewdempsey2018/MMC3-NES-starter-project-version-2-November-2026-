.segment "FIXED_CODE0"
prepare_attributes:

  ldy #0
@loop:
  lda (attrib_ptr),y
  sta attrib_data,y
  iny
  cpy #8
  bne @loop

  lda attrib_ptr_lo
  clc
  adc #8
  sta attrib_ptr_lo
  lda attrib_ptr_hi
  adc #0
  sta attrib_ptr_hi

  lda #0
  sta do_prep_attrib

  rts