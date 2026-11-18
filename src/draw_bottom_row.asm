.segment "RODATA"

row_address_hi_table:
  .byte $20,$20,$20,$20,$20,$20,$20,$20,$21,$21,$21,$21,$21,$21,$21,$21,$22,$22,$22,$22,$22,$22,$22,$22,$23,$23,$23,$23,$23,$23
row_address_lo_table:
  .byte $00,$20,$40,$60,$80,$A0,$C0,$E0,$00,$20,$40,$60,$80,$A0,$C0,$E0,$00,$20,$40,$60,$80,$A0,$C0,$E0,$00,$20,$40,$60,$80,$A0


.segment "FIXED_CODE0"
draw_bottom_row:

; drawing tiles
  ldx row_number

  lda PPUSTATUS
  lda row_address_hi_table,x
  sta PPUADDR
  lda row_address_lo_table,x
  sta PPUADDR

  ldx #$00
@loop:
  lda row_bottom_data,x
  sta PPUDATA
  inx
  cpx #32
  bne @loop

  lda #$01
  sta do_prep_bottom_row
  
  rts