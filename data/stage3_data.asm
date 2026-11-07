.segment "FIXED_CODE0"

stage3_metatiles_top_table:
  .byte $00,$00
  .byte $02,$03

stage3_metatiles_bottom_table:
  .byte $00,$00
  .byte $12,$13

stage3_screen_table:
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

stage3_screen_attribs_table:
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00

stage3_sequence_hi_table:
  .byte >stage3_screen_table,>stage3_screen_table,>stage3_screen_table,>stage3_screen_table,>stage3_screen_table
stage3_sequence_lo_table:
  .byte <stage3_screen_table,<stage3_screen_table,<stage3_screen_table,<stage3_screen_table,<stage3_screen_table
stage3_attribs_sequence_hi_table:
  .byte >stage3_screen_attribs_table,>stage3_screen_attribs_table,>stage3_screen_attribs_table,>stage3_screen_attribs_table,>stage3_screen_attribs_table
stage3_attribs_sequence_lo_table:
  .byte <stage3_screen_attribs_table,<stage3_screen_attribs_table,<stage3_screen_attribs_table,<stage3_screen_attribs_table,<stage3_screen_attribs_table

stage3_palette_table:
  .byte $21,$07,$17,$27 ; bg
  .byte $21,$0f,$22,$20
  .byte $21,$04,$14,$34
  .byte $21,$19,$29,$39

  .byte $21,$00,$10,$20 ; sprites
  .byte $21,$09,$1a,$3a
  .byte $21,$17,$27,$38
  .byte $21,$15,$25,$35