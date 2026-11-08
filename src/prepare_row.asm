.segment "FIXED_CODE0"
prepare_row:

  inc row_number
  lda row_number
  cmp #30
  bne dont_reset_row_number
  lda #0
  sta row_number
dont_reset_row_number:

; attribs
  lda do_prep_attrib
  beq dont_prep_attribs

  lda attrib_ptr_lo
  clc
  adc #8
  sta attrib_ptr_lo
  lda attrib_ptr_hi
  adc #0
  sta attrib_ptr_hi

  ;; add some test data to attribs for now, delete this>>>>
  ldy #0
:
  lda (attrib_ptr), y
  sta attrib_data, y
  iny
  cpy #8
  bne :-
  ;;;; add some test data to attribs for now, delete this<<<

  lda #0
  sta do_prep_attrib

dont_prep_attribs:

; tiles
  lda row_number ; Load the number into A
  and #$01 ; Mask all bits except Bit 0
  beq is_even ; If the result is 0, Zero flag is set -> it's even
is_odd:

  lda #0
  sta temp
  ldx #0
:
  ldy temp
  lda (tile_ptr), y
  asl a
  tay
  lda (metatile_bottom_ptr), y
  sta row_data, x
  iny
  inx
  lda (metatile_bottom_ptr), y
  sta row_data, x
  inc temp
  inx
  cpx #32
  bne :-

  lda tile_ptr_lo
  clc
  adc #16
  sta tile_ptr_lo
  lda tile_ptr_hi
  adc #0
  sta tile_ptr_hi

  jmp done

is_even:
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

done:

  lda #$00
  sta do_prep_row
  
  rts