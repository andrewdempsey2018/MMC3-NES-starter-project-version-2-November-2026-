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

clear_nametable:
; Clear PPU address latch and set destination address to $2000 (Start of Nametable 0)
  lda PPUSTATUS
  lda #$20
  sta PPUADDR
  lda #$00
  sta PPUADDR

  lda #$00

  ldx #$04
outer_loop:
  ldy #240

inner_loop:
  sta PPUDATA
  dey
  bne inner_loop
  dex
  bne outer_loop
; loop ends of 960 iterations

  ; 64 attribute bytes
  ldx #0
@attributes:
  lda #$00
  sta PPUDATA
  inx
  cpx #64
  bne @attributes

  rts