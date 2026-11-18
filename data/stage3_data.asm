.segment "CODE2"

.export stage3_metatiles_top_table
.export stage3_metatiles_bottom_table
.export stage3_sequence_hi_table
.export stage3_sequence_lo_table
.export stage3_attribs_sequence_hi_table
.export stage3_attribs_sequence_lo_table
.export stage3_palette_table

stage3_metatiles_top_table:
  .byte $00,$00
  .byte $02,$03

stage3_metatiles_bottom_table:
  .byte $00,$00
  .byte $12,$13

stage3_screen1_table:
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

stage3_screen1_attribs_table:
  .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
  .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
  .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
  .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
  .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
  .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
  .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
  .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA

stage3_screen2_table:
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

stage3_screen2_attribs_table:
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00

stage3_screen3_table:
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$01,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$01,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

stage3_screen3_attribs_table:
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55

stage3_screen4_table:
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

stage3_screen4_attribs_table:
  .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

stage3_sequence_hi_table:
  .byte >stage3_screen1_table,>stage3_screen2_table,>stage3_screen3_table,>stage3_screen4_table
  .byte >stage3_screen1_table,>stage3_screen2_table,>stage3_screen3_table,>stage3_screen4_table
  .byte >stage3_screen1_table,>stage3_screen2_table,>stage3_screen3_table,>stage3_screen4_table
  .byte >stage3_screen1_table,>stage3_screen2_table,>stage3_screen3_table,>stage3_screen4_table
  .byte >stage3_screen1_table,>stage3_screen2_table,>stage3_screen3_table,>stage3_screen4_table
  .byte >stage3_screen1_table,>stage3_screen2_table,>stage3_screen3_table,>stage3_screen4_table
  .byte >stage3_screen1_table,>stage3_screen2_table,>stage3_screen3_table,>stage3_screen4_table
  .byte >stage3_screen1_table,>stage3_screen2_table,>stage3_screen3_table,>stage3_screen4_table
  .byte >stage3_screen1_table,>stage3_screen2_table,>stage3_screen3_table,>stage3_screen4_table
  .byte >stage3_screen1_table,>stage3_screen2_table,>stage3_screen3_table,>stage3_screen4_table
  .byte >stage3_screen1_table,>stage3_screen2_table,>stage3_screen3_table,>stage3_screen4_table
  .byte >stage3_screen1_table,>stage3_screen2_table,>stage3_screen3_table,>stage3_screen4_table
stage3_sequence_lo_table:
  .byte <stage3_screen1_table,<stage3_screen2_table,<stage3_screen3_table,<stage3_screen4_table
  .byte <stage3_screen1_table,<stage3_screen2_table,<stage3_screen3_table,<stage3_screen4_table
  .byte <stage3_screen1_table,<stage3_screen2_table,<stage3_screen3_table,<stage3_screen4_table
  .byte <stage3_screen1_table,<stage3_screen2_table,<stage3_screen3_table,<stage3_screen4_table
  .byte <stage3_screen1_table,<stage3_screen2_table,<stage3_screen3_table,<stage3_screen4_table
  .byte <stage3_screen1_table,<stage3_screen2_table,<stage3_screen3_table,<stage3_screen4_table
  .byte <stage3_screen1_table,<stage3_screen2_table,<stage3_screen3_table,<stage3_screen4_table
  .byte <stage3_screen1_table,<stage3_screen2_table,<stage3_screen3_table,<stage3_screen4_table
  .byte <stage3_screen1_table,<stage3_screen2_table,<stage3_screen3_table,<stage3_screen4_table
  .byte <stage3_screen1_table,<stage3_screen2_table,<stage3_screen3_table,<stage3_screen4_table
  .byte <stage3_screen1_table,<stage3_screen2_table,<stage3_screen3_table,<stage3_screen4_table
  .byte <stage3_screen1_table,<stage3_screen2_table,<stage3_screen3_table,<stage3_screen4_table
stage3_attribs_sequence_hi_table:
  .byte >stage3_screen1_attribs_table,>stage3_screen2_attribs_table,>stage3_screen3_attribs_table,>stage3_screen4_attribs_table
  .byte >stage3_screen1_attribs_table,>stage3_screen2_attribs_table,>stage3_screen3_attribs_table,>stage3_screen4_attribs_table
  .byte >stage3_screen1_attribs_table,>stage3_screen2_attribs_table,>stage3_screen3_attribs_table,>stage3_screen4_attribs_table
  .byte >stage3_screen1_attribs_table,>stage3_screen2_attribs_table,>stage3_screen3_attribs_table,>stage3_screen4_attribs_table
  .byte >stage3_screen1_attribs_table,>stage3_screen2_attribs_table,>stage3_screen3_attribs_table,>stage3_screen4_attribs_table
  .byte >stage3_screen1_attribs_table,>stage3_screen2_attribs_table,>stage3_screen3_attribs_table,>stage3_screen4_attribs_table
  .byte >stage3_screen1_attribs_table,>stage3_screen2_attribs_table,>stage3_screen3_attribs_table,>stage3_screen4_attribs_table
  .byte >stage3_screen1_attribs_table,>stage3_screen2_attribs_table,>stage3_screen3_attribs_table,>stage3_screen4_attribs_table
  .byte >stage3_screen1_attribs_table,>stage3_screen2_attribs_table,>stage3_screen3_attribs_table,>stage3_screen4_attribs_table
  .byte >stage3_screen1_attribs_table,>stage3_screen2_attribs_table,>stage3_screen3_attribs_table,>stage3_screen4_attribs_table
  .byte >stage3_screen1_attribs_table,>stage3_screen2_attribs_table,>stage3_screen3_attribs_table,>stage3_screen4_attribs_table
  .byte >stage3_screen1_attribs_table,>stage3_screen2_attribs_table,>stage3_screen3_attribs_table,>stage3_screen4_attribs_table
stage3_attribs_sequence_lo_table:
  .byte <stage3_screen1_attribs_table,<stage3_screen2_attribs_table,<stage3_screen3_attribs_table,<stage3_screen4_attribs_table
  .byte <stage3_screen1_attribs_table,<stage3_screen2_attribs_table,<stage3_screen3_attribs_table,<stage3_screen4_attribs_table
  .byte <stage3_screen1_attribs_table,<stage3_screen2_attribs_table,<stage3_screen3_attribs_table,<stage3_screen4_attribs_table
  .byte <stage3_screen1_attribs_table,<stage3_screen2_attribs_table,<stage3_screen3_attribs_table,<stage3_screen4_attribs_table
  .byte <stage3_screen1_attribs_table,<stage3_screen2_attribs_table,<stage3_screen3_attribs_table,<stage3_screen4_attribs_table
  .byte <stage3_screen1_attribs_table,<stage3_screen2_attribs_table,<stage3_screen3_attribs_table,<stage3_screen4_attribs_table
  .byte <stage3_screen1_attribs_table,<stage3_screen2_attribs_table,<stage3_screen3_attribs_table,<stage3_screen4_attribs_table
  .byte <stage3_screen1_attribs_table,<stage3_screen2_attribs_table,<stage3_screen3_attribs_table,<stage3_screen4_attribs_table
  .byte <stage3_screen1_attribs_table,<stage3_screen2_attribs_table,<stage3_screen3_attribs_table,<stage3_screen4_attribs_table
  .byte <stage3_screen1_attribs_table,<stage3_screen2_attribs_table,<stage3_screen3_attribs_table,<stage3_screen4_attribs_table
  .byte <stage3_screen1_attribs_table,<stage3_screen2_attribs_table,<stage3_screen3_attribs_table,<stage3_screen4_attribs_table
  .byte <stage3_screen1_attribs_table,<stage3_screen2_attribs_table,<stage3_screen3_attribs_table,<stage3_screen4_attribs_table

stage3_palette_table:
  .byte $0F,$15,$25,$35
  .byte $0F,$16,$26,$36
  .byte $0F,$17,$27,$37
  .byte $0F,$18,$28,$38

  .byte $0F,$15,$25,$35
  .byte $0F,$16,$26,$36
  .byte $0F,$17,$27,$37
  .byte $0F,$18,$28,$38