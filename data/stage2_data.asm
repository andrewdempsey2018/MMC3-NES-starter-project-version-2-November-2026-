.segment "CODE1"

.export stage2_metatiles_top_table
.export stage2_metatiles_bottom_table
.export stage2_sequence_hi_table
.export stage2_sequence_lo_table
.export stage2_attribs_sequence_hi_table
.export stage2_attribs_sequence_lo_table
.export stage2_palette_table

stage2_metatiles_top_table:
  .byte $00,$00
  .byte $02,$03

stage2_metatiles_bottom_table:
  .byte $00,$00
  .byte $12,$13

stage2_screen1_table:
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

stage2_screen1_attribs_table:
  .byte $00,$55,$AA,$FF,$00,$55,$AA,$FF
  .byte $55,$AA,$FF,$00,$55,$AA,$FF,$00
  .byte $00,$55,$AA,$FF,$00,$55,$AA,$FF
  .byte $55,$AA,$FF,$00,$55,$AA,$FF,$00
  .byte $00,$55,$AA,$FF,$00,$55,$AA,$FF
  .byte $55,$AA,$FF,$00,$55,$AA,$FF,$00
  .byte $00,$55,$AA,$FF,$00,$55,$AA,$FF
  .byte $55,$AA,$FF,$00,$55,$AA,$FF,$00

stage2_sequence_hi_table:
  .byte >stage2_screen1_table,>stage2_screen1_table,>stage2_screen1_table,>stage2_screen1_table,>stage2_screen1_table
stage2_sequence_lo_table:
  .byte <stage2_screen1_table,<stage2_screen1_table,<stage2_screen1_table,<stage2_screen1_table,<stage2_screen1_table
stage2_attribs_sequence_hi_table:
  .byte >stage2_screen1_attribs_table,>stage2_screen1_attribs_table,>stage2_screen1_attribs_table,>stage2_screen1_attribs_table,>stage2_screen1_attribs_table
stage2_attribs_sequence_lo_table:
  .byte <stage2_screen1_attribs_table,<stage2_screen1_attribs_table,<stage2_screen1_attribs_table,<stage2_screen1_attribs_table,<stage2_screen1_attribs_table

stage2_palette_table:
  .byte $0F,$11,$21,$31
  .byte $0F,$12,$22,$32
  .byte $0F,$13,$23,$33
  .byte $0F,$14,$24,$34

  .byte $0F,$11,$21,$31
  .byte $0F,$12,$22,$32
  .byte $0F,$13,$23,$33
  .byte $0F,$14,$24,$34