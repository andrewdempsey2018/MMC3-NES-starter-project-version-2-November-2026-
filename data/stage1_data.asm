.segment "CODE0"

.export stage1_metatiles_top_table
.export stage1_metatiles_bottom_table
.export stage1_screen1_table
.export stage1_screen1_attribs_table
.export stage1_screen2_table
.export stage1_screen2_attribs_table
.export stage1_sequence_hi_table
.export stage1_sequence_lo_table
.export stage1_attribs_sequence_hi_table
.export stage1_attribs_sequence_lo_table
.export stage1_palette_table

stage1_metatiles_top_table:
  .byte $00,$00
  .byte $02,$03

stage1_metatiles_bottom_table:
  .byte $00,$00
  .byte $12,$13

stage1_screen1_table:
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

stage1_screen1_attribs_table:
  .byte $00,$55,$AA,$FF,$00,$55,$AA,$FF
  .byte $55,$AA,$FF,$00,$55,$AA,$FF,$00
  .byte $00,$55,$AA,$FF,$00,$55,$AA,$FF
  .byte $55,$AA,$FF,$00,$55,$AA,$FF,$00
  .byte $00,$55,$AA,$FF,$00,$55,$AA,$FF
  .byte $55,$AA,$FF,$00,$55,$AA,$FF,$00
  .byte $00,$55,$AA,$FF,$00,$55,$AA,$FF
  .byte $55,$AA,$FF,$00,$55,$AA,$FF,$00

stage1_screen2_table:
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$01,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

stage1_screen2_attribs_table:
  .byte $00,$55,$AA,$FF,$00,$55,$AA,$FF
  .byte $55,$AA,$FF,$00,$55,$AA,$FF,$00
  .byte $00,$55,$AA,$FF,$00,$55,$AA,$FF
  .byte $55,$AA,$FF,$00,$55,$AA,$FF,$00
  .byte $00,$55,$AA,$FF,$00,$55,$AA,$FF
  .byte $55,$AA,$FF,$00,$55,$AA,$FF,$00
  .byte $00,$55,$AA,$FF,$00,$55,$AA,$FF
  .byte $55,$AA,$FF,$00,$55,$AA,$FF,$00

stage1_sequence_hi_table:
  .byte >stage1_screen1_table,>stage1_screen2_table,>stage1_screen1_table,>stage1_screen2_table,>stage1_screen1_table
  .byte >stage1_screen2_table,>stage1_screen1_table,>stage1_screen2_table,>stage1_screen1_table,>stage1_screen2_table
stage1_sequence_lo_table:
  .byte <stage1_screen1_table,<stage1_screen2_table,<stage1_screen1_table,<stage1_screen2_table,<stage1_screen1_table
  .byte <stage1_screen2_table,<stage1_screen1_table,<stage1_screen2_table,<stage1_screen1_table,<stage1_screen2_table
stage1_attribs_sequence_hi_table:
  .byte >stage1_screen1_attribs_table,>stage1_screen2_attribs_table,>stage1_screen1_attribs_table,>stage1_screen2_attribs_table,>stage1_screen1_attribs_table
  .byte >stage1_screen2_attribs_table,>stage1_screen1_attribs_table,>stage1_screen2_attribs_table,>stage1_screen1_attribs_table,>stage1_screen2_attribs_table
stage1_attribs_sequence_lo_table:
  .byte <stage1_screen1_attribs_table,<stage1_screen2_attribs_table,<stage1_screen1_attribs_table,<stage1_screen2_attribs_table,<stage1_screen1_attribs_table
  .byte <stage1_screen2_attribs_table,<stage1_screen1_attribs_table,<stage1_screen2_attribs_table,<stage1_screen1_attribs_table,<stage1_screen2_attribs_table

stage1_palette_table:
  .byte $21,$07,$17,$27 ; bg
  .byte $21,$0f,$22,$20
  .byte $21,$04,$14,$34
  .byte $21,$19,$29,$39

  .byte $21,$00,$10,$20 ; sprites
  .byte $21,$09,$1a,$3a
  .byte $21,$17,$27,$38
  .byte $21,$15,$25,$35