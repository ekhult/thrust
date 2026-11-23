C000  78        sei 
C001  A5 01     lda $01
C003  8D E6 C0  sta $C0E6
C006  A2 00     ldx #$00
C008  B5 00     lda $00,x
C00A  9D 00 C1  sta $C100,x
C00D  E8        inx 
C00E  D0 F8     bne $C008
C010  A9 37     lda #$37
C012  85 01     sta $01
C014  A9 31     lda #$31
C016  8D 14 03  sta $0314
C019  A9 EA     lda #$EA
C01B  8D 15 03  sta $0315
C01E  A9 F0     lda #$F0
C020  8D 1A D0  sta $D01A
C023  A2 00     ldx #$00
C025  8E 0D DC  stx $DC0D
C028  8E 0D DD  stx $DD0D
C02B  E8        inx 
C02C  8E 0E DC  stx $DC0E
C02F  A9 0B     lda #$0B
C031  8D 11 D0  sta $D011
C034  20 A3 FD  jsr $FDA3
C037  58        cli 
C038  A2 1F     ldx #$1F
C03A  BD 30 FD  lda $FD30,x
C03D  9D 14 03  sta $0314,x
C040  CA        dex 
C041  10 F7     bpl $C03A
C043  E8        inx 
C044  BD 00 01  lda $0100,x
C047  9D 00 C2  sta $C200,x
C04A  E8        inx 
C04B  D0 F7     bne $C044
C04D  8A        txa 
C04E  95 90     sta $90,x
C050  E8        inx 
C051  E0 70     cpx #$70
C053  D0 F9     bne $C04E
C055  A9 01     lda #$01
C057  A8        tay 
C058  A2 08     ldx #$08
C05A  20 BA FF  jsr $FFBA
C05D  A9 13     lda #$13
C05F  A2 D3     ldx #$D3
C061  A0 C0     ldy #$C0
C063  20 BD FF  jsr $FFBD
C066  A2 00     ldx #$00
C068  A0 C2     ldy #$C2
C06A  86 FB     stx $FB
C06C  84 FC     sty $FC
C06E  A9 FB     lda #$FB
C070  A2 80     ldx #$80
C072  A0 C2     ldy #$C2
C074  20 D8 FF  jsr $FFD8
C077  78        sei 
C078  AD E6 C0  lda $C0E6
C07B  85 01     sta $01
C07D  A2 00     ldx #$00
C07F  BD 02 C1  lda $C102,x
C082  95 02     sta $02,x
C084  E8        inx 
C085  E0 FD     cpx #$FD
C087  D0 F6     bne $C07F
C089  AD 00 DD  lda $DD00
C08C  29 FC     and #$FC
C08E  09 02     ora #$02
C090  8D 00 DD  sta $DD00
C093  A9 43     lda #$43
C095  8D 14 03  sta $0314
C098  8D 16 03  sta $0316
C09B  A9 89     lda #$89
C09D  8D 15 03  sta $0315
C0A0  8D 17 03  sta $0317
C0A3  A2 00     ldx #$00
C0A5  8E 12 D0  stx $D012
C0A8  8E 0E DC  stx $DC0E
C0AB  E8        inx 
C0AC  8E 1A D0  stx $D01A
C0AF  8E 0E DC  stx $DC0E
C0B2  A2 7E     ldx #$7E
C0B4  8E 0D DC  stx $DC0D
C0B7  E8        inx 
C0B8  8E 0D DD  stx $DD0D
C0BB  A9 6A     lda #$6A
C0BD  8D 04 DC  sta $DC04
C0C0  A9 27     lda #$27
C0C2  8D 05 DC  sta $DC05
C0C5  A9 81     lda #$81
C0C7  8D 0D DC  sta $DC0D
C0CA  A9 3B     lda #$3B
C0CC  8D 11 D0  sta $D011
C0CF  58        cli 
C0D0  4C FE B3  jmp $B3FE
C0D3  40        rti 
C0D4  53        .byte $53
C0D5  3A        .byte $3A
C0D6  54        .byte $54
C0D7  48        pha 
C0D8  52        .byte $52
C0D9  55 53     eor $53,x
C0DB  54        .byte $54
C0DC  20 54 4F  jsr $4F54
C0DF  50 20     bvc $C101
C0E1  38        sec 
C0E2  2F        .byte $2F
C0E3  52        .byte $52
C0E4  45 4D     eor $4D
C0E6  21 04     and ($04,x)
C0E8  0F        .byte $0F
C0E9  0E 05 20  asl $2005
C0EC  02        .byte $02
C0ED  19 20 0A  ora $0A20,y
C0F0  01 03     ora ($03,x)
C0F2  0B        .byte $0B
C0F3  20 01 0C  jsr $0C01
C0F6  09 05     ora #$05
C0F8  0E 20 26  asl $2620
C0FB  20 08 0F  jsr $0F08
C0FE  0B        .byte $0B
C0FF  21 78     and ($78,x)
C101  D8        cld 
C102  A2 FF     ldx #$FF
C104  9A        txs 
C105  E8        inx 
C106  8A        txa 
C107  95 00     sta $00,x
C109  E8        inx 
C10A  D0 FB     bne $C107
C10C  A9 2F     lda #$2F
C10E  85 00     sta $00
C110  A9 37     lda #$37
C112  85 01     sta $01
C114  20 44 E5  jsr $E544
C117  20 BF E3  jsr $E3BF
C11A  A2 1F     ldx #$1F
C11C  BD 30 FD  lda $FD30,x
C11F  9D 14 03  sta $0314,x
C122  CA        dex 
C123  10 F7     bpl $C11C
C125  A9 15     lda #$15
C127  8D 18 D0  sta $D018
C12A  A9 80     lda #$80
C12C  8D 91 02  sta $0291
C12F  A2 01     ldx #$01
C131  86 CC     stx $CC
C133  CA        dex 
C134  8E 20 D0  stx $D020
C137  8E 21 D0  stx $D021
C13A  8E 11 D0  stx $D011
C13D  BD 00 C4  lda $C400,x
C140  9D 00 04  sta $0400,x
C143  A9 01     lda #$01
C145  9D 00 D8  sta $D800,x
C148  E8        inx 
C149  E0 28     cpx #$28
C14B  D0 F0     bne $C13D
C14D  A9 1B     lda #$1B
C14F  8D 11 D0  sta $D011
C152  58        cli 
C153  20 E4 FF  jsr $FFE4
C156  C9 54     cmp #$54
C158  F0 6D     beq $C1C7
C15A  C9 48     cmp #$48
C15C  D0 F5     bne $C153
C15E  A2 27     ldx #$27
C160  BD 28 C4  lda $C428,x
C163  9D 00 04  sta $0400,x
C166  A9 0A     lda #$0A
C168  9D 00 D8  sta $D800,x
C16B  CA        dex 
C16C  10 F2     bpl $C160
C16E  20 E4 FF  jsr $FFE4
C171  C9 4E     cmp #$4E
C173  F0 21     beq $C196
C175  C9 59     cmp #$59
C177  D0 F5     bne $C16E
C179  20 44 E5  jsr $E544
C17C  A9 60     lda #$60
C17E  8D 77 C0  sta $C077
C181  A9 00     lda #$00
C183  85 9D     sta $9D
C185  8D A1 02  sta $02A1
C188  20 55 C0  jsr $C055
C18B  A9 78     lda #$78
C18D  8D 77 C0  sta $C077
C190  EA        nop 
C191  EA        nop 
C192  EA        nop 
C193  4C 24 6C  jmp $6C24
C196  20 44 E5  jsr $E544
C199  A9 01     lda #$01
C19B  A8        tay 
C19C  A2 08     ldx #$08
C19E  20 BA FF  jsr $FFBA
C1A1  A9 10     lda #$10
C1A3  A2 D6     ldx #$D6
C1A5  A0 C0     ldy #$C0
C1A7  20 BD FF  jsr $FFBD
C1AA  A9 00     lda #$00
C1AC  85 9D     sta $9D
C1AE  8D A1 02  sta $02A1
C1B1  20 D5 FF  jsr $FFD5
C1B4  EA        nop 
C1B5  EA        nop 
C1B6  EA        nop 
C1B7  A2 00     ldx #$00
C1B9  BD 00 C2  lda $C200,x
C1BC  9D F5 65  sta $65F5,x
C1BF  E8        inx 
C1C0  E0 80     cpx #$80
C1C2  D0 F5     bne $C1B9
C1C4  4C 24 6C  jmp $6C24
C1C7  A9 FE     lda #$FE
C1C9  8D 78 63  sta $6378
C1CC  A9 B3     lda #$B3
C1CE  8D 79 63  sta $6379
C1D1  A2 27     ldx #$27
C1D3  BD 78 C4  lda $C478,x
C1D6  9D 00 04  sta $0400,x
C1D9  A9 0A     lda #$0A
C1DB  9D 00 D8  sta $D800,x
C1DE  CA        dex 
C1DF  10 F2     bpl $C1D3
C1E1  20 E4 FF  jsr $FFE4
C1E4  C9 4E     cmp #$4E
C1E6  F0 09     beq $C1F1
C1E8  C9 59     cmp #$59
C1EA  D0 F5     bne $C1E1
C1EC  A9 00     lda #$00
C1EE  8D EF 3F  sta $3FEF
C1F1  4C 08 C6  jmp $C608
C1F4  00        brk 
C1F5  00        brk 
C1F6  00        brk 
C1F7  00        brk 
C1F8  00        brk 
C1F9  00        brk 
C1FA  00        brk 
C1FB  00        brk 
C1FC  00        brk 
C1FD  00        brk 
C1FE  00        brk 
C1FF  00        brk 
C200  00        brk 
C201  08        php 
C202  00        brk 
C203  20 20 20  jsr $2020
C206  46 69     lsr $69
C208  72        .byte $72
C209  65 62     adc $62
C20B  69 72     adc #$72
C20D  64        .byte $64
C20E  20 20 00  jsr $0020
C211  07        .byte $07
C212  00        brk 
C213  20 20 20  jsr $2020
C216  46 69     lsr $69
C218  72        .byte $72
C219  65 62     adc $62
C21B  69 72     adc #$72
C21D  64        .byte $64
C21E  20 20 00  jsr $0020
C221  06 00     asl $00
C223  20 20 20  jsr $2020
C226  46 69     lsr $69
C228  72        .byte $72
C229  65 62     adc $62
C22B  69 72     adc #$72
C22D  64        .byte $64
C22E  20 20 00  jsr $0020
C231  05 00     ora $00
C233  20 20 20  jsr $2020
C236  46 69     lsr $69
C238  72        .byte $72
C239  65 62     adc $62
C23B  69 72     adc #$72
C23D  64        .byte $64
C23E  20 20 00  jsr $0020
C241  04        .byte $04
C242  00        brk 
C243  20 20 20  jsr $2020
C246  46 69     lsr $69
C248  72        .byte $72
C249  65 62     adc $62
C24B  69 72     adc #$72
C24D  64        .byte $64
C24E  20 20 00  jsr $0020
C251  03        .byte $03
C252  00        brk 
C253  20 20 20  jsr $2020
C256  46 69     lsr $69
C258  72        .byte $72
C259  65 62     adc $62
C25B  69 72     adc #$72
C25D  64        .byte $64
C25E  20 20 00  jsr $0020
C261  02        .byte $02
C262  00        brk 
C263  20 20 20  jsr $2020
C266  46 69     lsr $69
C268  72        .byte $72
C269  65 62     adc $62
C26B  69 72     adc #$72
C26D  64        .byte $64
C26E  20 20 00  jsr $0020
C271  01 00     ora ($00,x)
C273  20 20 20  jsr $2020
C276  46 69     lsr $69
C278  72        .byte $72
C279  65 62     adc $62
C27B  69 72     adc #$72
C27D  64        .byte $64
C27E  20 20 FF  jsr $FF20
C281  00        brk 
C282  01 02     ora ($02,x)
C284  03        .byte $03
C285  04        .byte $04
C286  FF        .byte $FF
C287  00        brk 
C288  01 02     ora ($02,x)
C28A  03        .byte $03
C28B  04        .byte $04
C28C  FF        .byte $FF
C28D  00        brk 
C28E  01 02     ora ($02,x)
C290  03        .byte $03
C291  04        .byte $04
C292  FF        .byte $FF
C293  00        brk 
C294  01 02     ora ($02,x)
C296  03        .byte $03
C297  04        .byte $04
C298  00        brk 
C299  01 02     ora ($02,x)
C29B  03        .byte $03
C29C  04        .byte $04
C29D  05 06     ora $06
C29F  07        .byte $07
C2A0  08        php 
C2A1  09 10     ora #$10
C2A3  11 12     ora ($12),y
C2A5  13        .byte $13
C2A6  14        .byte $14
C2A7  15 16     ora $16,x
C2A9  17        .byte $17
C2AA  18        clc 
C2AB  19 20 21  ora $2120,y
C2AE  22        .byte $22
C2AF  23        .byte $23
C2B0  00        brk 
C2B1  00        brk 
C2B2  00        brk 
C2B3  00        brk 
C2B4  00        brk 
C2B5  00        brk 
C2B6  FF        .byte $FF
C2B7  FF        .byte $FF
C2B8  FF        .byte $FF
C2B9  FF        .byte $FF
C2BA  FF        .byte $FF
C2BB  FF        .byte $FF
C2BC  00        brk 
C2BD  00        brk 
C2BE  00        brk 
C2BF  00        brk 
C2C0  00        brk 
C2C1  00        brk 
C2C2  FF        .byte $FF
C2C3  FF        .byte $FF
C2C4  FF        .byte $FF
C2C5  FF        .byte $FF
C2C6  FF        .byte $FF
C2C7  FF        .byte $FF
C2C8  00        brk 
C2C9  00        brk 
C2CA  00        brk 
C2CB  00        brk 
C2CC  00        brk 
C2CD  00        brk 
C2CE  00        brk 
C2CF  00        brk 
C2D0  00        brk 
C2D1  00        brk 
C2D2  00        brk 
C2D3  00        brk 
C2D4  FF        .byte $FF
C2D5  FF        .byte $FF
C2D6  FF        .byte $FF
C2D7  FF        .byte $FF
C2D8  FF        .byte $FF
C2D9  FF        .byte $FF
C2DA  FF        .byte $FF
C2DB  FF        .byte $FF
C2DC  FF        .byte $FF
C2DD  FF        .byte $FF
C2DE  FF        .byte $FF
C2DF  FF        .byte $FF
C2E0  00        brk 
C2E1  00        brk 
C2E2  00        brk 
C2E3  00        brk 
C2E4  00        brk 
C2E5  00        brk 
C2E6  00        brk 
C2E7  00        brk 
C2E8  00        brk 
C2E9  00        brk 
C2EA  00        brk 
C2EB  00        brk 
C2EC  00        brk 
C2ED  00        brk 
C2EE  00        brk 
C2EF  00        brk 
C2F0  00        brk 
C2F1  00        brk 
C2F2  00        brk 
C2F3  00        brk 
C2F4  00        brk 
C2F5  00        brk 
C2F6  00        brk 
C2F7  00        brk 
C2F8  00        brk 
C2F9  00        brk 
C2FA  00        brk 
C2FB  00        brk 
C2FC  00        brk 
C2FD  00        brk 
C2FE  00        brk 
C2FF  00        brk 
C300  AD 00 DC  lda $DC00
C303  8D 13 C3  sta $C313
C306  A9 7F     lda #$7F
C308  8D 00 DC  sta $DC00
C30B  AD 01 DC  lda $DC01
C30E  C9 DF     cmp #$DF
C310  F0 09     beq $C31B
C312  A9 7F     lda #$7F
C314  8D 00 DC  sta $DC00
C317  20 D5 B3  jsr $B3D5
C31A  60        rts 
C31B  A9 FF     lda #$FF
C31D  85 22     sta $22
C31F  4C 00 B2  jmp $B200
C322  8D A5 A6  sta $A6A5
C325  A9 FF     lda #$FF
C327  85 A4     sta $A4
C329  A9 FF     lda #$FF
C32B  8D A4 A6  sta $A6A4
C32E  A9 00     lda #$00
C330  8D 81 B6  sta $B681
C333  A9 00     lda #$00
C335  8D A5 A6  sta $A6A5
C338  A9 00     lda #$00
C33A  85 A5     sta $A5
C33C  A9 00     lda #$00
C33E  60        rts 
C33F  20 32 A8  jsr $A832
C342  A9 60     lda #$60
C344  8D 25 C3  sta $C325
C347  60        rts 
C348  AD 02 DD  lda $DD02
C34B  29 3F     and #$3F
C34D  8D 02 DD  sta $DD02
C350  60        rts 
C351  00        brk 
C352  00        brk 
C353  00        brk 
C354  00        brk 
C355  00        brk 
C356  00        brk 
C357  00        brk 
C358  00        brk 
C359  00        brk 
C35A  00        brk 
C35B  00        brk 
C35C  00        brk 
C35D  00        brk 
C35E  00        brk 
C35F  00        brk 
C360  00        brk 
C361  00        brk 
C362  00        brk 
C363  00        brk 
C364  00        brk 
C365  00        brk 
C366  00        brk 
C367  00        brk 
C368  00        brk 
C369  00        brk 
C36A  00        brk 
C36B  00        brk 
C36C  00        brk 
C36D  00        brk 
C36E  00        brk 
C36F  00        brk 
C370  00        brk 
C371  00        brk 
C372  00        brk 
C373  00        brk 
C374  00        brk 
C375  00        brk 
C376  00        brk 
C377  00        brk 
C378  00        brk 
C379  00        brk 
C37A  00        brk 
C37B  00        brk 
C37C  00        brk 
C37D  00        brk 
C37E  00        brk 
C37F  00        brk 
C380  00        brk 
C381  00        brk 
C382  00        brk 
C383  00        brk 
C384  00        brk 
C385  00        brk 
C386  00        brk 
C387  00        brk 
C388  00        brk 
C389  00        brk 
C38A  00        brk 
C38B  00        brk 
C38C  00        brk 
C38D  00        brk 
C38E  00        brk 
C38F  00        brk 
C390  00        brk 
C391  00        brk 
C392  00        brk 
C393  00        brk 
C394  00        brk 
C395  00        brk 
C396  00        brk 
C397  00        brk 
C398  00        brk 
C399  00        brk 
C39A  00        brk 
C39B  00        brk 
C39C  00        brk 
C39D  00        brk 
C39E  00        brk 
C39F  00        brk 
C3A0  00        brk 
C3A1  00        brk 
C3A2  00        brk 
C3A3  00        brk 
C3A4  00        brk 
C3A5  00        brk 
C3A6  00        brk 
C3A7  00        brk 
C3A8  00        brk 
C3A9  00        brk 
C3AA  00        brk 
C3AB  00        brk 
C3AC  00        brk 
C3AD  00        brk 
C3AE  00        brk 
C3AF  00        brk 
C3B0  00        brk 
C3B1  00        brk 
C3B2  00        brk 
C3B3  00        brk 
C3B4  00        brk 
C3B5  00        brk 
C3B6  00        brk 
C3B7  00        brk 
C3B8  00        brk 
C3B9  00        brk 
C3BA  00        brk 
C3BB  00        brk 
C3BC  00        brk 
C3BD  00        brk 
C3BE  00        brk 
C3BF  00        brk 
C3C0  00        brk 
C3C1  00        brk 
C3C2  00        brk 
C3C3  00        brk 
C3C4  00        brk 
C3C5  00        brk 
C3C6  00        brk 
C3C7  00        brk 
C3C8  00        brk 
C3C9  00        brk 
C3CA  00        brk 
C3CB  00        brk 
C3CC  00        brk 
C3CD  00        brk 
C3CE  00        brk 
C3CF  00        brk 
C3D0  00        brk 
C3D1  00        brk 
C3D2  00        brk 
C3D3  00        brk 
C3D4  00        brk 
C3D5  00        brk 
C3D6  00        brk 
C3D7  00        brk 
C3D8  00        brk 
C3D9  00        brk 
C3DA  00        brk 
C3DB  00        brk 
C3DC  00        brk 
C3DD  00        brk 
C3DE  00        brk 
C3DF  00        brk 
C3E0  00        brk 
C3E1  00        brk 
C3E2  00        brk 
C3E3  00        brk 
C3E4  00        brk 
C3E5  00        brk 
C3E6  00        brk 
C3E7  00        brk 
C3E8  00        brk 
C3E9  00        brk 
C3EA  00        brk 
C3EB  00        brk 
C3EC  00        brk 
C3ED  00        brk 
C3EE  00        brk 
C3EF  00        brk 
C3F0  00        brk 
C3F1  00        brk 
C3F2  00        brk 
C3F3  00        brk 
C3F4  00        brk 
C3F5  00        brk 
C3F6  00        brk 
C3F7  00        brk 
C3F8  00        brk 
C3F9  00        brk 
C3FA  00        brk 
C3FB  00        brk 
C3FC  00        brk 
C3FD  00        brk 
C3FE  00        brk 
C3FF  00        brk 
C400  20 10 0C  jsr $0C10
C403  01 19     ora ($19,x)
C405  20 08 09  jsr $0908
C408  07        .byte $07
C409  08        php 
C40A  13        .byte $13
C40B  03        .byte $03
C40C  0F        .byte $0F
C40D  12        .byte $12
C40E  05 20     ora $20
C410  0F        .byte $0F
C411  12        .byte $12
C412  20 14 12  jsr $1214
C415  01 09     ora ($09,x)
C417  0E 05 12  asl $1205
C41A  20 07 01  jsr $0107
C41D  0D 05 20  ora $2005
C420  1B        .byte $1B
C421  08        php 
C422  2F        .byte $2F
C423  14        .byte $14
C424  1D 20 3F  ora $3F20,x
C427  20 04 0F  jsr $0F04
C42A  20 15 20  jsr $2015
C42D  17        .byte $17
C42E  01 0E     ora ($0E,x)
C430  14        .byte $14
C431  20 32 20  jsr $2032
C434  12        .byte $12
C435  05 13     ora $13
C437  05 14     ora $14
C439  20 14 08  jsr $0814
C43C  05 20     ora $20
C43E  08        php 
C43F  09 07     ora #$07
C441  08        php 
C442  13        .byte $13
C443  03        .byte $03
C444  0F        .byte $0F
C445  12        .byte $12
C446  05 13     ora $13
C448  20 1B 19  jsr $191B
C44B  2F        .byte $2F
C44C  0E 1D 20  asl $201D
C44F  3F        .byte $3F
C450  20 20 20  jsr $2020
C453  20 20 20  jsr $2020
C456  20 20 20  jsr $2020
C459  20 20 20  jsr $2020
C45C  20 20 20  jsr $2020
C45F  20 20 20  jsr $2020
C462  20 20 20  jsr $2020
C465  20 20 20  jsr $2020
C468  20 20 20  jsr $2020
C46B  20 20 20  jsr $2020
C46E  20 20 20  jsr $2020
C471  20 20 20  jsr $2020
C474  20 20 20  jsr $2020
C477  20 04 0F  jsr $0F04
C47A  20 15 20  jsr $2015
C47D  17        .byte $17
C47E  01 0E     ora ($0E,x)
C480  14        .byte $14
C481  20 32 20  jsr $2032
C484  08        php 
C485  01 16     ora ($16,x)
C487  05 20     ora $20
C489  15 0E     ora $0E,x
C48B  0C        .byte $0C
C48C  09 0D     ora #$0D
C48E  09 14     ora #$14
C490  05 04     ora $04
C492  20 0C 09  jsr $090C
C495  16 05     asl $05,x
C497  13        .byte $13
C498  20 1B 19  jsr $191B
C49B  2F        .byte $2F
C49C  0E 1D 20  asl $201D
C49F  3F        .byte $3F
C4A0  04        .byte $04
C4A1  0F        .byte $0F
C4A2  20 19 0F  jsr $0F19
C4A5  15 20     ora $20,x
C4A7  17        .byte $17
C4A8  01 0E     ora ($0E,x)
C4AA  14        .byte $14
C4AB  20 14 0F  jsr $0F14
C4AE  20 08 01  jsr $0108
C4B1  16 05     asl $05,x
C4B3  20 05 0E  jsr $0E05
C4B6  04        .byte $04
C4B7  0C        .byte $0C
C4B8  05 13     ora $13
C4BA  13        .byte $13
C4BB  20 06 15  jsr $1506
C4BE  05 0C     ora $0C
C4C0  20 1B 19  jsr $191B
C4C3  2F        .byte $2F
C4C4  0E 1D 20  asl $201D
C4C7  3F        .byte $3F
C4C8  20 13 14  jsr $1413
C4CB  01 12     ora ($12,x)
C4CD  14        .byte $14
C4CE  20 01 14  jsr $1401
C4D1  20 0C 05  jsr $050C
C4D4  16 05     asl $05,x
C4D6  0C        .byte $0C
C4D7  20 30 31  jsr $3130
C4DA  20 1B 03  jsr $031B
C4DD  12        .byte $12
C4DE  13        .byte $13
C4DF  12        .byte $12
C4E0  20 15 10  jsr $1015
C4E3  2F        .byte $2F
C4E4  04        .byte $04
C4E5  0F        .byte $0F
C4E6  17        .byte $17
C4E7  0E 2F 12  asl $122F
C4EA  05 14     ora $14
C4EC  1D 20 3F  ora $3F20,x
C4EF  20 20 20  jsr $2020
C4F2  20 20 20  jsr $2020
C4F5  20 20 20  jsr $2020
C4F8  20 20 20  jsr $2020
C4FB  20 20 20  jsr $2020
C4FE  20 20 20  jsr $2020
C501  20 20 20  jsr $2020
C504  20 20 20  jsr $2020
C507  20 20 20  jsr $2020
C50A  20 20 20  jsr $2020
C50D  20 20 20  jsr $2020
C510  20 20 20  jsr $2020
C513  20 20 20  jsr $2020
C516  20 20 0C  jsr $0C20
C519  05 16     ora $16
C51B  05 0C     ora $0C
C51D  13        .byte $13
C51E  20 30 31  jsr $3130
C521  2D 30 36  and $3630
C524  3A        .byte $3A
C525  0E 0F 12  asl $120F
C528  0D 01 0C  ora $0C01
C52B  20 07 12  jsr $1207
C52E  01 16     ora ($16,x)
C530  09 14     ora #$14
C532  19 20 2B  ora $2B20,y
C535  20 16 09  jsr $0916
C538  13        .byte $13
C539  09 02     ora #$02
C53B  0C        .byte $0C
C53C  05 2E     ora $2E
C53E  20 20 0C  jsr $0C20
C541  05 16     ora $16
C543  05 0C     ora $0C
C545  13        .byte $13
C546  20 30 37  jsr $3730
C549  2D 31 32  and $3231
C54C  3A        .byte $3A
C54D  12        .byte $12
C54E  05 16     ora $16
C550  05 12     ora $12
C552  13        .byte $13
C553  05 20     ora $20
C555  07        .byte $07
C556  12        .byte $12
C557  01 16     ora ($16,x)
C559  09 14     ora #$14
C55B  19 2B 20  ora $202B,y
C55E  16 09     asl $09,x
C560  13        .byte $13
C561  09 02     ora #$02
C563  0C        .byte $0C
C564  05 2E     ora $2E
C566  20 20 0C  jsr $0C20
C569  05 16     ora $16
C56B  05 0C     ora $0C
C56D  13        .byte $13
C56E  20 31 33  jsr $3331
C571  2D 31 38  and $3831
C574  3A        .byte $3A
C575  0E 0F 12  asl $120F
C578  0D 01 0C  ora $0C01
C57B  20 07 12  jsr $1207
C57E  01 16     ora ($16,x)
C580  09 14     ora #$14
C582  19 20 2B  ora $2B20,y
C585  20 09 0E  jsr $0E09
C588  16 09     asl $09,x
C58A  13        .byte $13
C58B  09 02     ora #$02
C58D  0C        .byte $0C
C58E  05 2E     ora $2E
C590  0C        .byte $0C
C591  05 16     ora $16
C593  05 0C     ora $0C
C595  13        .byte $13
C596  20 31 39  jsr $3931
C599  2D 32 34  and $3432
C59C  3A        .byte $3A
C59D  12        .byte $12
C59E  05 16     ora $16
C5A0  05 12     ora $12
C5A2  13        .byte $13
C5A3  05 20     ora $20
C5A5  07        .byte $07
C5A6  12        .byte $12
C5A7  01 16     ora ($16,x)
C5A9  09 14     ora #$14
C5AB  19 2B 20  ora $202B,y
C5AE  09 0E     ora #$0E
C5B0  16 09     asl $09,x
C5B2  13        .byte $13
C5B3  09 02     ora #$02
C5B5  0C        .byte $0C
C5B6  05 2E     ora $2E
C5B8  0C        .byte $0C
C5B9  05 16     ora $16
C5BB  05 0C     ora $0C
C5BD  13        .byte $13
C5BE  20 32 35  jsr $3532
C5C1  2D 18 18  and $1818
C5C4  3A        .byte $3A
C5C5  13        .byte $13
C5C6  14        .byte $14
C5C7  01 12     ora ($12,x)
C5C9  14        .byte $14
C5CA  13        .byte $13
C5CB  20 06 12  jsr $1206
C5CE  0F        .byte $0F
C5CF  0D 20 14  ora $1420
C5D2  08        php 
C5D3  05 20     ora $20
C5D5  02        .byte $02
C5D6  05 07     ora $07
C5D8  09 0E     ora #$0E
C5DA  0E 09 0E  asl $0E09
C5DD  07        .byte $07
C5DE  2E 20 13  rol $1320
C5E1  0B        .byte $0B
C5E2  09 10     ora #$10
C5E4  20 01 20  jsr $2001
C5E7  0C        .byte $0C
C5E8  05 16     ora $16
C5EA  05 0C     ora $0C
C5EC  20 02 19  jsr $1902
C5EF  20 10 12  jsr $1210
C5F2  05 13     ora $13
C5F4  13        .byte $13
C5F5  09 0E     ora #$0E
C5F7  07        .byte $07
C5F8  20 03 02  jsr $0203
C5FB  0D 2D 0B  ora $0B2D
C5FE  05 19     ora $19
C600  20 1B 19  jsr $191B
C603  2F        .byte $2F
C604  0E 1D 20  asl $201D
C607  3F        .byte $3F
C608  A2 27     ldx #$27
C60A  BD A0 C4  lda $C4A0,x
C60D  9D 00 04  sta $0400,x
C610  A9 0D     lda #$0D
C612  9D 00 D8  sta $D800,x
C615  CA        dex 
C616  10 F2     bpl $C60A
C618  20 E4 FF  jsr $FFE4
C61B  C9 4E     cmp #$4E
C61D  F0 0C     beq $C62B
C61F  C9 59     cmp #$59
C621  D0 F5     bne $C618
C623  A9 00     lda #$00
C625  8D E1 40  sta $40E1
C628  8D E3 40  sta $40E3
C62B  20 02 C7  jsr $C702
C62E  EA        nop 
C62F  EA        nop 
C630  EA        nop 
C631  EA        nop 
C632  EA        nop 
C633  EA        nop 
C634  EA        nop 
C635  EA        nop 
C636  EA        nop 
C637  EA        nop 
C638  EA        nop 
C639  EA        nop 
C63A  EA        nop 
C63B  A2 17     ldx #$17
C63D  BD C8 C5  lda $C5C8,x
C640  9D 00 05  sta $0500,x
C643  A9 07     lda #$07
C645  9D 00 D9  sta $D900,x
C648  CA        dex 
C649  10 F2     bpl $C63D
C64B  20 E4 FF  jsr $FFE4
C64E  C9 0D     cmp #$0D
C650  F0 4A     beq $C69C
C652  C9 11     cmp #$11
C654  F0 26     beq $C67C
C656  C9 91     cmp #$91
C658  D0 F1     bne $C64B
C65A  AD 9D C6  lda $C69D
C65D  C9 17     cmp #$17
C65F  F0 EA     beq $C64B
C661  EE 9D C6  inc $C69D
C664  AD 11 04  lda $0411
C667  C9 39     cmp #$39
C669  F0 06     beq $C671
C66B  EE 11 04  inc $0411
C66E  4C 4B C6  jmp $C64B
C671  EE 10 04  inc $0410
C674  A9 30     lda #$30
C676  8D 11 04  sta $0411
C679  4C 4B C6  jmp $C64B
C67C  AD 9D C6  lda $C69D
C67F  F0 CA     beq $C64B
C681  CE 9D C6  dec $C69D
C684  AD 11 04  lda $0411
C687  C9 30     cmp #$30
C689  F0 06     beq $C691
C68B  CE 11 04  dec $0411
C68E  4C 4B C6  jmp $C64B
C691  CE 10 04  dec $0410
C694  A9 39     lda #$39
C696  8D 11 04  sta $0411
C699  4C 4B C6  jmp $C64B
C69C  A2 00     ldx #$00
C69E  BD 80 C2  lda $C280,x
C6A1  8D 2A C3  sta $C32A
C6A4  BD 98 C2  lda $C298,x
C6A7  8D 2F C3  sta $C32F
C6AA  20 E1 C6  jsr $C6E1
C6AD  EA        nop 
C6AE  20 44 E5  jsr $E544
C6B1  A2 27     ldx #$27
C6B3  BD E0 C5  lda $C5E0,x
C6B6  9D 00 04  sta $0400,x
C6B9  A9 0F     lda #$0F
C6BB  9D 00 D8  sta $D800,x
C6BE  CA        dex 
C6BF  10 F2     bpl $C6B3
C6C1  EA        nop 
C6C2  EA        nop 
C6C3  EA        nop 
C6C4  EA        nop 
C6C5  EA        nop 
C6C6  20 E4 FF  jsr $FFE4
C6C9  C9 4E     cmp #$4E
C6CB  F0 0E     beq $C6DB
C6CD  C9 59     cmp #$59
C6CF  D0 F5     bne $C6C6
C6D1  A9 00     lda #$00
C6D3  8D 67 5F  sta $5F67
C6D6  A9 C3     lda #$C3
C6D8  8D 68 5F  sta $5F68
C6DB  20 44 E5  jsr $E544
C6DE  4C 24 6C  jmp $6C24
C6E1  BD B0 C2  lda $C2B0,x
C6E4  8D 34 C3  sta $C334
C6E7  BD C8 C2  lda $C2C8,x
C6EA  8D 39 C3  sta $C339
C6ED  CA        dex 
C6EE  8E 26 C3  stx $C326
C6F1  60        rts 
C6F2  00        brk 
C6F3  00        brk 
C6F4  00        brk 
C6F5  00        brk 
C6F6  00        brk 
C6F7  00        brk 
C6F8  00        brk 
C6F9  00        brk 
C6FA  00        brk 
C6FB  00        brk 
C6FC  00        brk 
C6FD  00        brk 
C6FE  00        brk 
C6FF  00        brk 
C700  00        brk 
C701  00        brk 
C702  A2 00     ldx #$00
C704  BD C8 C4  lda $C4C8,x
C707  9D 00 04  sta $0400,x
C70A  A9 07     lda #$07
C70C  9D 00 D8  sta $D800,x
C70F  E8        inx 
C710  D0 F2     bne $C704
C712  BD 40 C7  lda $C740,x
C715  9D 18 05  sta $0518,x
C718  A9 07     lda #$07
C71A  9D 18 D9  sta $D918,x
C71D  E8        inx 
C71E  D0 F2     bne $C712
C720  BD 40 C8  lda $C840,x
C723  9D 18 06  sta $0618,x
C726  A9 07     lda #$07
C728  9D 18 DA  sta $DA18,x
C72B  E8        inx 
C72C  E0 40     cpx #$40
C72E  D0 F0     bne $C720
C730  60        rts 
C731  00        brk 
C732  00        brk 
C733  00        brk 
C734  00        brk 
C735  00        brk 
C736  00        brk 
C737  00        brk 
C738  00        brk 
C739  00        brk 
C73A  00        brk 
C73B  00        brk 
C73C  00        brk 
C73D  00        brk 
C73E  00        brk 
C73F  00        brk 
C740  20 20 20  jsr $2020
C743  20 20 20  jsr $2020
C746  20 20 20  jsr $2020
C749  20 20 20  jsr $2020
C74C  20 20 20  jsr $2020
C74F  20 20 20  jsr $2020
C752  20 20 20  jsr $2020
C755  20 20 20  jsr $2020
C758  20 20 20  jsr $2020
C75B  20 20 20  jsr $2020
C75E  20 20 20  jsr $2020
C761  20 20 20  jsr $2020
C764  20 20 20  jsr $2020
C767  20 20 14  jsr $1420
C76A  0F        .byte $0F
C76B  20 13 14  jsr $1413
C76E  01 19     ora ($19,x)
C770  20 01 14  jsr $1401
C773  20 14 08  jsr $0814
C776  05 20     ora $20
C778  13        .byte $13
C779  01 0D     ora ($0D,x)
C77B  05 20     ora $20
C77D  13        .byte $13
C77E  14        .byte $14
C77F  01 12     ora ($12,x)
C781  14        .byte $14
C782  09 0E     ora #$0E
C784  07        .byte $07
C785  20 0C 05  jsr $050C
C788  16 05     asl $05,x
C78A  0C        .byte $0C
C78B  20 19 0F  jsr $0F19
C78E  15 20     ora $20,x
C790  20 0D 01  jsr $010D
C793  19 20 10  ora $1020,y
C796  12        .byte $12
C797  05 13     ora $13
C799  13        .byte $13
C79A  20 12 15  jsr $1512
C79D  0E 2F 13  asl $132F
C7A0  14        .byte $14
C7A1  0F        .byte $0F
C7A2  10 20     bpl $C7C4
C7A4  09 0E     ora #$0E
C7A6  20 07 01  jsr $0107
C7A9  0D 05 20  ora $2005
C7AC  09 0E     ora #$0E
C7AE  20 0F 12  jsr $120F
C7B1  04        .byte $04
C7B2  05 12     ora $12
C7B4  20 14 0F  jsr $0F14
C7B7  20 20 11  jsr $1120
C7BA  15 09     ora $09,x
C7BC  14        .byte $14
C7BD  2E 20 14  rol $1420
C7C0  08        php 
C7C1  05 0E     ora $0E
C7C3  20 10 12  jsr $1210
C7C6  05 13     ora $13
C7C8  13        .byte $13
C7C9  20 13 10  jsr $1013
C7CC  01 03     ora ($03,x)
C7CE  05 20     ora $20
C7D0  14        .byte $14
C7D1  0F        .byte $0F
C7D2  20 13 14  jsr $1413
C7D5  01 12     ora ($12,x)
C7D7  14        .byte $14
C7D8  20 01 20  jsr $2001
C7DB  0E 05 17  asl $1705
C7DE  20 20 20  jsr $2020
C7E1  07        .byte $07
C7E2  01 0D     ora ($0D,x)
C7E4  05 20     ora $20
C7E6  01 14     ora ($14,x)
C7E8  20 14 08  jsr $0814
C7EB  05 20     ora $20
C7ED  13        .byte $13
C7EE  01 0D     ora ($0D,x)
C7F0  05 20     ora $20
C7F2  13        .byte $13
C7F3  14        .byte $14
C7F4  01 12     ora ($12,x)
C7F6  14        .byte $14
C7F7  09 0E     ora #$0E
C7F9  07        .byte $07
C7FA  20 0C 05  jsr $050C
C7FD  16 05     asl $05,x
C7FF  0C        .byte $0C
C800  2E 20 14  rol $1420
C803  08        php 
C804  09 13     ora #$13
C806  20 20 20  jsr $2020
C809  06 05     asl $05
C80B  01 14     ora ($14,x)
C80D  15 12     ora $12,x
C80F  05 20     ora $20
C811  17        .byte $17
C812  09 0C     ora #$0C
C814  0C        .byte $0C
C815  20 0E 0F  jsr $0F0E
C818  14        .byte $14
C819  20 17 0F  jsr $0F17
C81C  12        .byte $12
C81D  0B        .byte $0B
C81E  20 01 0E  jsr $0E01
C821  19 0D 0F  ora $0F0D,y
C824  12        .byte $12
C825  05 20     ora $20
C827  0F        .byte $0F
C828  0E 03 05  asl $0503
C82B  20 19 0F  jsr $0F19
C82E  15 20     ora $20,x
C830  20 13 05  jsr $0513
C833  05 20     ora $20
C835  14        .byte $14
C836  08        php 
C837  05 20     ora $20
C839  07        .byte $07
C83A  01 0D     ora ($0D,x)
C83C  05 20     ora $20
C83E  0F        .byte $0F
C83F  16 05     asl $05,x
C841  12        .byte $12
C842  20 0F 0E  jsr $0E0F
C845  20 13 03  jsr $0313
C848  12        .byte $12
C849  05 05     ora $05
C84B  0E 2E 20  asl $202E
C84E  14        .byte $14
C84F  08        php 
C850  05 0E     ora $0E
C852  20 19 0F  jsr $0F19
C855  15 20     ora $20,x
C857  20 20 04  jsr $0420
C85A  0F        .byte $0F
C85B  20 13 14  jsr $1413
C85E  01 12     ora ($12,x)
C860  14        .byte $14
C861  20 01 14  jsr $1401
C864  20 0C 05  jsr $050C
C867  16 05     asl $05,x
C869  0C        .byte $0C
C86A  20 31 20  jsr $2031
C86D  01 07     ora ($07,x)
C86F  01 09     ora ($09,x)
C871  0E 20 01  asl $0120
C874  06 14     asl $14
C876  05 12     ora $12
C878  17        .byte $17
C879  01 12     ora ($12,x)
C87B  04        .byte $04
C87C  13        .byte $13
C87D  2E 20 20  rol $2020
C880  00        brk 
C881  00        brk 
C882  00        brk 
C883  00        brk 
C884  00        brk 
C885  00        brk 
C886  00        brk 
C887  00        brk 
C888  00        brk 
C889  00        brk 
C88A  00        brk 
C88B  00        brk 
C88C  00        brk 
C88D  00        brk 
C88E  00        brk 
C88F  00        brk 
C890  00        brk 
C891  00        brk 
C892  00        brk 
C893  00        brk 
C894  00        brk 
C895  00        brk 
C896  00        brk 
C897  00        brk 
C898  00        brk 
C899  00        brk 
C89A  00        brk 
C89B  00        brk 
C89C  00        brk 
C89D  00        brk 
C89E  00        brk 
C89F  00        brk 
C8A0  00        brk 
C8A1  00        brk 
C8A2  00        brk 
C8A3  00        brk 
C8A4  00        brk 
C8A5  00        brk 
C8A6  00        brk 
C8A7  00        brk 
C8A8  00        brk 
C8A9  00        brk 
C8AA  00        brk 
C8AB  00        brk 
C8AC  00        brk 
C8AD  00        brk 
C8AE  00        brk 
C8AF  00        brk 
C8B0  00        brk 
C8B1  00        brk 
C8B2  00        brk 
C8B3  00        brk 
C8B4  00        brk 
C8B5  00        brk 
C8B6  00        brk 
C8B7  00        brk 
C8B8  00        brk 
C8B9  00        brk 
C8BA  00        brk 
C8BB  00        brk 
C8BC  00        brk 
C8BD  00        brk 
C8BE  00        brk 
C8BF  00        brk 
C8C0  00        brk 
C8C1  00        brk 
C8C2  00        brk 
C8C3  00        brk 
C8C4  00        brk 
C8C5  00        brk 
C8C6  00        brk 
C8C7  00        brk 
C8C8  00        brk 
C8C9  00        brk 
C8CA  00        brk 
C8CB  00        brk 
C8CC  00        brk 
C8CD  00        brk 
C8CE  00        brk 
C8CF  00        brk 
C8D0  00        brk 
C8D1  00        brk 
C8D2  00        brk 
C8D3  00        brk 
C8D4  00        brk 
C8D5  00        brk 
C8D6  00        brk 
C8D7  00        brk 
C8D8  00        brk 
C8D9  00        brk 
C8DA  00        brk 
C8DB  00        brk 
C8DC  00        brk 
C8DD  00        brk 
C8DE  00        brk 
C8DF  00        brk 
C8E0  00        brk 
C8E1  00        brk 
C8E2  00        brk 
C8E3  00        brk 
C8E4  00        brk 
C8E5  00        brk 
C8E6  00        brk 
C8E7  00        brk 
C8E8  00        brk 
C8E9  00        brk 
C8EA  00        brk 
C8EB  00        brk 
C8EC  00        brk 
C8ED  00        brk 
C8EE  00        brk 
C8EF  00        brk 
C8F0  00        brk 
C8F1  00        brk 
C8F2  00        brk 
C8F3  00        brk 
C8F4  00        brk 
C8F5  00        brk 
C8F6  00        brk 
C8F7  00        brk 
C8F8  00        brk 
C8F9  00        brk 
C8FA  00        brk 
C8FB  00        brk 
C8FC  00        brk 
C8FD  00        brk 
C8FE  00        brk 
C8FF  00        brk 
C900  00        brk 
C901  00        brk 
C902  00        brk 
C903  00        brk 
C904  00        brk 
C905  00        brk 
C906  00        brk 
C907  00        brk 
C908  00        brk 
C909  00        brk 
C90A  00        brk 
C90B  00        brk 
C90C  00        brk 
C90D  00        brk 
C90E  00        brk 
C90F  00        brk 
C910  00        brk 
C911  00        brk 
C912  00        brk 
C913  00        brk 
C914  00        brk 
C915  00        brk 
C916  00        brk 
C917  00        brk 
C918  00        brk 
C919  00        brk 
C91A  00        brk 
C91B  00        brk 
C91C  00        brk 
C91D  00        brk 
C91E  00        brk 
C91F  00        brk 
C920  00        brk 
C921  00        brk 
C922  00        brk 
C923  00        brk 
C924  00        brk 
C925  00        brk 
C926  00        brk 
C927  00        brk 
C928  00        brk 
C929  00        brk 
C92A  00        brk 
C92B  00        brk 
C92C  00        brk 
C92D  00        brk 
C92E  00        brk 
C92F  00        brk 
C930  00        brk 
C931  00        brk 
C932  00        brk 
C933  00        brk 
C934  00        brk 
C935  00        brk 
C936  00        brk 
C937  00        brk 
C938  00        brk 
C939  00        brk 
C93A  00        brk 
C93B  00        brk 
C93C  00        brk 
C93D  00        brk 
C93E  00        brk 
C93F  00        brk 
C940  00        brk 
C941  00        brk 
C942  00        brk 
C943  00        brk 
C944  00        brk 
C945  00        brk 
C946  00        brk 
C947  00        brk 
C948  00        brk 
C949  00        brk 
C94A  00        brk 
C94B  00        brk 
C94C  00        brk 
C94D  00        brk 
C94E  00        brk 
C94F  00        brk 
C950  00        brk 
C951  00        brk 
C952  00        brk 
C953  00        brk 
C954  00        brk 
C955  00        brk 
C956  00        brk 
C957  00        brk 
C958  00        brk 
C959  00        brk 
C95A  00        brk 
C95B  00        brk 
C95C  00        brk 
C95D  00        brk 
C95E  00        brk 
C95F  00        brk 
C960  00        brk 
C961  00        brk 
C962  00        brk 
C963  00        brk 
C964  00        brk 
C965  00        brk 
C966  00        brk 
C967  00        brk 
C968  00        brk 
C969  00        brk 
C96A  00        brk 
C96B  00        brk 
C96C  00        brk 
C96D  00        brk 
C96E  00        brk 
C96F  00        brk 
C970  00        brk 
C971  00        brk 
C972  00        brk 
C973  00        brk 
C974  00        brk 
C975  00        brk 
C976  00        brk 
C977  00        brk 
C978  00        brk 
C979  00        brk 
C97A  00        brk 
C97B  00        brk 
C97C  00        brk 
C97D  00        brk 
C97E  00        brk 
C97F  00        brk 
C980  00        brk 
C981  00        brk 
C982  00        brk 
C983  00        brk 
C984  00        brk 
C985  00        brk 
C986  00        brk 
C987  00        brk 
C988  00        brk 
C989  00        brk 
C98A  00        brk 
C98B  00        brk 
C98C  00        brk 
C98D  00        brk 
C98E  00        brk 
C98F  00        brk 
C990  00        brk 
C991  00        brk 
C992  00        brk 
C993  00        brk 
C994  00        brk 
C995  00        brk 
C996  00        brk 
C997  00        brk 
C998  00        brk 
C999  00        brk 
C99A  00        brk 
C99B  00        brk 
C99C  00        brk 
C99D  00        brk 
C99E  00        brk 
C99F  00        brk 
C9A0  00        brk 
C9A1  00        brk 
C9A2  00        brk 
C9A3  00        brk 
C9A4  00        brk 
C9A5  00        brk 
C9A6  00        brk 
C9A7  00        brk 
C9A8  00        brk 
C9A9  00        brk 
C9AA  00        brk 
C9AB  00        brk 
C9AC  00        brk 
C9AD  00        brk 
C9AE  00        brk 
C9AF  00        brk 
C9B0  00        brk 
C9B1  00        brk 
C9B2  00        brk 
C9B3  00        brk 
C9B4  00        brk 
C9B5  00        brk 
C9B6  00        brk 
C9B7  00        brk 
C9B8  00        brk 
C9B9  00        brk 
C9BA  00        brk 
C9BB  00        brk 
C9BC  00        brk 
C9BD  00        brk 
C9BE  00        brk 
C9BF  00        brk 
C9C0  00        brk 
C9C1  00        brk 
C9C2  00        brk 
C9C3  00        brk 
C9C4  00        brk 
C9C5  00        brk 
C9C6  00        brk 
C9C7  00        brk 
C9C8  00        brk 
C9C9  00        brk 
C9CA  00        brk 
C9CB  00        brk 
C9CC  00        brk 
C9CD  00        brk 
C9CE  00        brk 
C9CF  00        brk 
C9D0  00        brk 
C9D1  00        brk 
C9D2  00        brk 
C9D3  00        brk 
C9D4  00        brk 
C9D5  00        brk 
C9D6  00        brk 
C9D7  00        brk 
C9D8  00        brk 
C9D9  00        brk 
C9DA  00        brk 
C9DB  00        brk 
C9DC  00        brk 
C9DD  00        brk 
C9DE  00        brk 
C9DF  00        brk 
C9E0  00        brk 
C9E1  00        brk 
C9E2  00        brk 
C9E3  00        brk 
C9E4  00        brk 
C9E5  00        brk 
C9E6  00        brk 
C9E7  00        brk 
C9E8  00        brk 
C9E9  00        brk 
C9EA  00        brk 
C9EB  00        brk 
C9EC  00        brk 
C9ED  00        brk 
C9EE  00        brk 
C9EF  00        brk 
C9F0  00        brk 
C9F1  00        brk 
C9F2  00        brk 
C9F3  00        brk 
C9F4  00        brk 
C9F5  00        brk 
C9F6  00        brk 
C9F7  00        brk 
C9F8  00        brk 
C9F9  00        brk 
C9FA  00        brk 
C9FB  00        brk 
C9FC  00        brk 
C9FD  00        brk 
C9FE  00        brk 
C9FF  00        brk 
CA00  00        brk 
CA01  00        brk 
CA02  00        brk 
CA03  00        brk 
CA04  00        brk 
CA05  00        brk 
CA06  00        brk 
CA07  00        brk 
CA08  00        brk 
CA09  00        brk 
CA0A  00        brk 
CA0B  00        brk 
CA0C  00        brk 
CA0D  00        brk 
CA0E  00        brk 
CA0F  00        brk 
CA10  00        brk 
CA11  00        brk 
CA12  00        brk 
CA13  00        brk 
CA14  00        brk 
CA15  00        brk 
CA16  00        brk 
CA17  00        brk 
CA18  00        brk 
CA19  00        brk 
CA1A  00        brk 
CA1B  00        brk 
CA1C  00        brk 
CA1D  00        brk 
CA1E  00        brk 
CA1F  00        brk 
CA20  00        brk 
CA21  00        brk 
CA22  00        brk 
CA23  00        brk 
CA24  00        brk 
CA25  00        brk 
CA26  00        brk 
CA27  00        brk 
CA28  00        brk 
CA29  00        brk 
CA2A  00        brk 
CA2B  00        brk 
CA2C  00        brk 
CA2D  00        brk 
CA2E  00        brk 
CA2F  00        brk 
CA30  00        brk 
CA31  00        brk 
CA32  00        brk 
CA33  00        brk 
CA34  00        brk 
CA35  00        brk 
CA36  00        brk 
CA37  00        brk 
CA38  00        brk 
CA39  00        brk 
CA3A  00        brk 
CA3B  00        brk 
CA3C  00        brk 
CA3D  00        brk 
CA3E  00        brk 
CA3F  00        brk 
CA40  00        brk 
CA41  00        brk 
CA42  00        brk 
CA43  00        brk 
CA44  00        brk 
CA45  00        brk 
CA46  00        brk 
CA47  00        brk 
CA48  00        brk 
CA49  00        brk 
CA4A  00        brk 
CA4B  00        brk 
CA4C  00        brk 
CA4D  00        brk 
CA4E  00        brk 
CA4F  00        brk 
CA50  00        brk 
CA51  00        brk 
CA52  00        brk 
CA53  00        brk 
CA54  00        brk 
CA55  00        brk 
CA56  00        brk 
CA57  00        brk 
CA58  00        brk 
CA59  00        brk 
CA5A  00        brk 
CA5B  00        brk 
CA5C  00        brk 
CA5D  00        brk 
CA5E  00        brk 
CA5F  00        brk 
CA60  00        brk 
CA61  00        brk 
CA62  00        brk 
CA63  00        brk 
CA64  00        brk 
CA65  00        brk 
CA66  00        brk 
CA67  00        brk 
CA68  00        brk 
CA69  00        brk 
CA6A  00        brk 
CA6B  00        brk 
CA6C  00        brk 
CA6D  00        brk 
CA6E  00        brk 
CA6F  00        brk 
CA70  00        brk 
CA71  00        brk 
CA72  00        brk 
CA73  00        brk 
CA74  00        brk 
CA75  00        brk 
CA76  00        brk 
CA77  00        brk 
CA78  00        brk 
CA79  00        brk 
CA7A  00        brk 
CA7B  00        brk 
CA7C  00        brk 
CA7D  00        brk 
CA7E  00        brk 
CA7F  00        brk 
CA80  00        brk 
CA81  00        brk 
CA82  00        brk 
CA83  00        brk 
CA84  00        brk 
CA85  00        brk 
CA86  00        brk 
CA87  00        brk 
CA88  00        brk 
CA89  00        brk 
CA8A  00        brk 
CA8B  00        brk 
CA8C  00        brk 
CA8D  00        brk 
CA8E  00        brk 
CA8F  00        brk 
CA90  00        brk 
CA91  00        brk 
CA92  00        brk 
CA93  00        brk 
CA94  00        brk 
CA95  00        brk 
CA96  00        brk 
CA97  00        brk 
CA98  00        brk 
CA99  00        brk 
CA9A  00        brk 
CA9B  00        brk 
CA9C  00        brk 
CA9D  00        brk 
CA9E  00        brk 
CA9F  00        brk 
CAA0  00        brk 
CAA1  00        brk 
CAA2  00        brk 
CAA3  00        brk 
CAA4  00        brk 
CAA5  00        brk 
CAA6  00        brk 
CAA7  00        brk 
CAA8  00        brk 
CAA9  00        brk 
CAAA  00        brk 
CAAB  00        brk 
CAAC  00        brk 
CAAD  00        brk 
CAAE  00        brk 
CAAF  00        brk 
CAB0  00        brk 
CAB1  00        brk 
CAB2  00        brk 
CAB3  00        brk 
CAB4  00        brk 
CAB5  00        brk 
CAB6  00        brk 
CAB7  00        brk 
CAB8  00        brk 
CAB9  00        brk 
CABA  00        brk 
CABB  00        brk 
CABC  00        brk 
CABD  00        brk 
CABE  00        brk 
CABF  00        brk 
CAC0  00        brk 
CAC1  00        brk 
CAC2  00        brk 
CAC3  00        brk 
CAC4  00        brk 
CAC5  00        brk 
CAC6  00        brk 
CAC7  00        brk 
CAC8  00        brk 
CAC9  00        brk 
CACA  00        brk 
CACB  00        brk 
CACC  00        brk 
CACD  00        brk 
CACE  00        brk 
CACF  00        brk 
CAD0  00        brk 
CAD1  00        brk 
CAD2  00        brk 
CAD3  00        brk 
CAD4  00        brk 
CAD5  00        brk 
CAD6  00        brk 
CAD7  00        brk 
CAD8  00        brk 
CAD9  00        brk 
CADA  00        brk 
CADB  00        brk 
CADC  00        brk 
CADD  00        brk 
CADE  00        brk 
CADF  00        brk 
CAE0  00        brk 
CAE1  00        brk 
CAE2  00        brk 
CAE3  00        brk 
CAE4  00        brk 
CAE5  00        brk 
CAE6  00        brk 
CAE7  00        brk 
CAE8  00        brk 
CAE9  00        brk 
CAEA  00        brk 
CAEB  00        brk 
CAEC  00        brk 
CAED  00        brk 
CAEE  00        brk 
CAEF  00        brk 
CAF0  00        brk 
CAF1  00        brk 
CAF2  00        brk 
CAF3  00        brk 
CAF4  00        brk 
CAF5  00        brk 
CAF6  00        brk 
CAF7  00        brk 
CAF8  00        brk 
CAF9  00        brk 
CAFA  00        brk 
CAFB  00        brk 
CAFC  00        brk 
CAFD  00        brk 
CAFE  00        brk 
CAFF  00        brk 
CB00  00        brk 
CB01  00        brk 
CB02  00        brk 
CB03  00        brk 
CB04  00        brk 
CB05  00        brk 
CB06  00        brk 
CB07  00        brk 
CB08  00        brk 
CB09  00        brk 
CB0A  00        brk 
CB0B  00        brk 
CB0C  00        brk 
CB0D  00        brk 
CB0E  00        brk 
CB0F  00        brk 
CB10  00        brk 
CB11  00        brk 
CB12  00        brk 
CB13  00        brk 
CB14  00        brk 
CB15  00        brk 
CB16  00        brk 
CB17  00        brk 
CB18  00        brk 
CB19  00        brk 
CB1A  00        brk 
CB1B  00        brk 
CB1C  00        brk 
CB1D  00        brk 
CB1E  00        brk 
CB1F  00        brk 
CB20  00        brk 
CB21  00        brk 
CB22  00        brk 
CB23  00        brk 
CB24  00        brk 
CB25  00        brk 
CB26  00        brk 
CB27  00        brk 
CB28  00        brk 
CB29  00        brk 
CB2A  00        brk 
CB2B  00        brk 
CB2C  00        brk 
CB2D  00        brk 
CB2E  00        brk 
CB2F  00        brk 
CB30  00        brk 
CB31  00        brk 
CB32  00        brk 
CB33  00        brk 
CB34  00        brk 
CB35  00        brk 
CB36  00        brk 
CB37  00        brk 
CB38  00        brk 
CB39  00        brk 
CB3A  00        brk 
CB3B  00        brk 
CB3C  00        brk 
CB3D  00        brk 
CB3E  00        brk 
CB3F  00        brk 
CB40  00        brk 
CB41  00        brk 
CB42  00        brk 
CB43  00        brk 
CB44  00        brk 
CB45  00        brk 
CB46  00        brk 
CB47  00        brk 
CB48  00        brk 
CB49  00        brk 
CB4A  00        brk 
CB4B  00        brk 
CB4C  00        brk 
CB4D  00        brk 
CB4E  00        brk 
CB4F  00        brk 
CB50  00        brk 
CB51  00        brk 
CB52  00        brk 
CB53  00        brk 
CB54  00        brk 
CB55  00        brk 
CB56  00        brk 
CB57  00        brk 
CB58  00        brk 
CB59  00        brk 
CB5A  00        brk 
CB5B  00        brk 
CB5C  00        brk 
CB5D  00        brk 
CB5E  00        brk 
CB5F  00        brk 
CB60  00        brk 
CB61  00        brk 
CB62  00        brk 
CB63  00        brk 
CB64  00        brk 
CB65  00        brk 
CB66  00        brk 
CB67  00        brk 
CB68  00        brk 
CB69  00        brk 
CB6A  00        brk 
CB6B  00        brk 
CB6C  00        brk 
CB6D  00        brk 
CB6E  00        brk 
CB6F  00        brk 
CB70  00        brk 
CB71  00        brk 
CB72  00        brk 
CB73  00        brk 
CB74  00        brk 
CB75  00        brk 
CB76  00        brk 
CB77  00        brk 
CB78  00        brk 
CB79  00        brk 
CB7A  00        brk 
CB7B  00        brk 
CB7C  00        brk 
CB7D  00        brk 
CB7E  00        brk 
CB7F  00        brk 
CB80  00        brk 
CB81  00        brk 
CB82  00        brk 
CB83  00        brk 
CB84  00        brk 
CB85  00        brk 
CB86  00        brk 
CB87  00        brk 
CB88  00        brk 
CB89  00        brk 
CB8A  00        brk 
CB8B  00        brk 
CB8C  00        brk 
CB8D  00        brk 
CB8E  00        brk 
CB8F  00        brk 
CB90  00        brk 
CB91  00        brk 
CB92  00        brk 
CB93  00        brk 
CB94  00        brk 
CB95  00        brk 
CB96  00        brk 
CB97  00        brk 
CB98  00        brk 
CB99  00        brk 
CB9A  00        brk 
CB9B  00        brk 
CB9C  00        brk 
CB9D  00        brk 
CB9E  00        brk 
CB9F  00        brk 
CBA0  00        brk 
CBA1  00        brk 
CBA2  00        brk 
CBA3  00        brk 
CBA4  00        brk 
CBA5  00        brk 
CBA6  00        brk 
CBA7  00        brk 
CBA8  00        brk 
CBA9  00        brk 
CBAA  00        brk 
CBAB  00        brk 
CBAC  00        brk 
CBAD  00        brk 
CBAE  00        brk 
CBAF  00        brk 
CBB0  00        brk 
CBB1  00        brk 
CBB2  00        brk 
CBB3  00        brk 
CBB4  00        brk 
CBB5  00        brk 
CBB6  00        brk 
CBB7  00        brk 
CBB8  00        brk 
CBB9  00        brk 
CBBA  00        brk 
CBBB  00        brk 
CBBC  00        brk 
CBBD  00        brk 
CBBE  00        brk 
CBBF  00        brk 
CBC0  00        brk 
CBC1  00        brk 
CBC2  00        brk 
CBC3  00        brk 
CBC4  00        brk 
CBC5  00        brk 
CBC6  00        brk 
CBC7  00        brk 
CBC8  00        brk 
CBC9  00        brk 
CBCA  00        brk 
CBCB  00        brk 
CBCC  00        brk 
CBCD  00        brk 
CBCE  00        brk 
CBCF  00        brk 
CBD0  00        brk 
CBD1  00        brk 
CBD2  00        brk 
CBD3  00        brk 
CBD4  00        brk 
CBD5  00        brk 
CBD6  00        brk 
CBD7  00        brk 
CBD8  00        brk 
CBD9  00        brk 
CBDA  00        brk 
CBDB  00        brk 
CBDC  00        brk 
CBDD  00        brk 
CBDE  00        brk 
CBDF  00        brk 
CBE0  00        brk 
CBE1  00        brk 
CBE2  00        brk 
CBE3  00        brk 
CBE4  00        brk 
CBE5  00        brk 
CBE6  00        brk 
CBE7  00        brk 
CBE8  00        brk 
CBE9  00        brk 
CBEA  00        brk 
CBEB  00        brk 
CBEC  00        brk 
CBED  00        brk 
CBEE  00        brk 
CBEF  00        brk 
CBF0  00        brk 
CBF1  00        brk 
CBF2  00        brk 
CBF3  00        brk 
CBF4  00        brk 
CBF5  00        brk 
CBF6  00        brk 
CBF7  00        brk 
CBF8  00        brk 
CBF9  00        brk 
CBFA  00        brk 
CBFB  00        brk 
CBFC  00        brk 
CBFD  00        brk 
CBFE  00        brk 
CBFF  00        brk 
CC00  00        brk 
CC01  00        brk 
CC02  00        brk 
CC03  00        brk 
CC04  00        brk 
CC05  00        brk 
CC06  00        brk 
CC07  00        brk 
CC08  00        brk 
CC09  00        brk 
CC0A  00        brk 
CC0B  00        brk 
CC0C  00        brk 
CC0D  00        brk 
CC0E  00        brk 
CC0F  00        brk 
CC10  00        brk 
CC11  00        brk 
CC12  00        brk 
CC13  00        brk 
CC14  00        brk 
CC15  00        brk 
CC16  00        brk 
CC17  00        brk 
CC18  00        brk 
CC19  00        brk 
CC1A  00        brk 
CC1B  00        brk 
CC1C  00        brk 
CC1D  00        brk 
CC1E  00        brk 
CC1F  00        brk 
CC20  00        brk 
CC21  00        brk 
CC22  00        brk 
CC23  00        brk 
CC24  00        brk 
CC25  00        brk 
CC26  00        brk 
CC27  00        brk 
CC28  00        brk 
CC29  00        brk 
CC2A  00        brk 
CC2B  00        brk 
CC2C  00        brk 
CC2D  00        brk 
CC2E  00        brk 
CC2F  00        brk 
CC30  00        brk 
CC31  00        brk 
CC32  00        brk 
CC33  00        brk 
CC34  00        brk 
CC35  00        brk 
CC36  00        brk 
CC37  00        brk 
CC38  00        brk 
CC39  00        brk 
CC3A  00        brk 
CC3B  00        brk 
CC3C  00        brk 
CC3D  00        brk 
CC3E  00        brk 
CC3F  00        brk 
CC40  00        brk 
CC41  00        brk 
CC42  00        brk 
CC43  00        brk 
CC44  00        brk 
CC45  00        brk 
CC46  00        brk 
CC47  00        brk 
CC48  00        brk 
CC49  00        brk 
CC4A  00        brk 
CC4B  00        brk 
CC4C  00        brk 
CC4D  00        brk 
CC4E  00        brk 
CC4F  00        brk 
CC50  00        brk 
CC51  00        brk 
CC52  00        brk 
CC53  00        brk 
CC54  00        brk 
CC55  00        brk 
CC56  00        brk 
CC57  00        brk 
CC58  00        brk 
CC59  00        brk 
CC5A  00        brk 
CC5B  00        brk 
CC5C  00        brk 
CC5D  00        brk 
CC5E  00        brk 
CC5F  00        brk 
CC60  00        brk 
CC61  00        brk 
CC62  00        brk 
CC63  00        brk 
CC64  00        brk 
CC65  00        brk 
CC66  00        brk 
CC67  00        brk 
CC68  00        brk 
CC69  00        brk 
CC6A  00        brk 
CC6B  00        brk 
CC6C  00        brk 
CC6D  00        brk 
CC6E  00        brk 
CC6F  00        brk 
CC70  00        brk 
CC71  00        brk 
CC72  00        brk 
CC73  00        brk 
CC74  00        brk 
CC75  00        brk 
CC76  00        brk 
CC77  00        brk 
CC78  00        brk 
CC79  00        brk 
CC7A  00        brk 
CC7B  00        brk 
CC7C  00        brk 
CC7D  00        brk 
CC7E  00        brk 
CC7F  00        brk 
CC80  00        brk 
CC81  00        brk 
CC82  00        brk 
CC83  00        brk 
CC84  00        brk 
CC85  00        brk 
CC86  00        brk 
CC87  00        brk 
CC88  00        brk 
CC89  00        brk 
CC8A  00        brk 
CC8B  00        brk 
CC8C  00        brk 
CC8D  00        brk 
CC8E  00        brk 
CC8F  00        brk 
CC90  00        brk 
CC91  00        brk 
CC92  00        brk 
CC93  00        brk 
CC94  00        brk 
CC95  00        brk 
CC96  00        brk 
CC97  00        brk 
CC98  00        brk 
CC99  00        brk 
CC9A  00        brk 
CC9B  00        brk 
CC9C  00        brk 
CC9D  00        brk 
CC9E  00        brk 
CC9F  00        brk 
CCA0  00        brk 
CCA1  00        brk 
CCA2  00        brk 
CCA3  00        brk 
CCA4  00        brk 
CCA5  00        brk 
CCA6  00        brk 
CCA7  00        brk 
CCA8  00        brk 
CCA9  00        brk 
CCAA  00        brk 
CCAB  00        brk 
CCAC  00        brk 
CCAD  00        brk 
CCAE  00        brk 
CCAF  00        brk 
CCB0  00        brk 
CCB1  00        brk 
CCB2  00        brk 
CCB3  00        brk 
CCB4  00        brk 
CCB5  00        brk 
CCB6  00        brk 
CCB7  00        brk 
CCB8  00        brk 
CCB9  00        brk 
CCBA  00        brk 
CCBB  00        brk 
CCBC  00        brk 
CCBD  00        brk 
CCBE  00        brk 
CCBF  00        brk 
CCC0  00        brk 
CCC1  00        brk 
CCC2  00        brk 
CCC3  00        brk 
CCC4  00        brk 
CCC5  00        brk 
CCC6  00        brk 
CCC7  00        brk 
CCC8  00        brk 
CCC9  00        brk 
CCCA  00        brk 
CCCB  00        brk 
CCCC  00        brk 
CCCD  00        brk 
CCCE  00        brk 
CCCF  00        brk 
CCD0  00        brk 
CCD1  00        brk 
CCD2  00        brk 
CCD3  00        brk 
CCD4  00        brk 
CCD5  00        brk 
CCD6  00        brk 
CCD7  00        brk 
CCD8  00        brk 
CCD9  00        brk 
CCDA  00        brk 
CCDB  00        brk 
CCDC  00        brk 
CCDD  00        brk 
CCDE  00        brk 
CCDF  00        brk 
CCE0  00        brk 
CCE1  00        brk 
CCE2  00        brk 
CCE3  00        brk 
CCE4  00        brk 
CCE5  00        brk 
CCE6  00        brk 
CCE7  00        brk 
CCE8  00        brk 
CCE9  00        brk 
CCEA  00        brk 
CCEB  00        brk 
CCEC  00        brk 
CCED  00        brk 
CCEE  00        brk 
CCEF  00        brk 
CCF0  00        brk 
CCF1  00        brk 
CCF2  00        brk 
CCF3  00        brk 
CCF4  00        brk 
CCF5  00        brk 
CCF6  00        brk 
CCF7  00        brk 
CCF8  00        brk 
CCF9  00        brk 
CCFA  00        brk 
CCFB  00        brk 
CCFC  00        brk 
CCFD  00        brk 
CCFE  00        brk 
CCFF  00        brk 
CD00  00        brk 
CD01  00        brk 
CD02  00        brk 
CD03  00        brk 
CD04  00        brk 
CD05  00        brk 
CD06  00        brk 
CD07  00        brk 
CD08  00        brk 
CD09  00        brk 
CD0A  00        brk 
CD0B  00        brk 
CD0C  00        brk 
CD0D  00        brk 
CD0E  00        brk 
CD0F  00        brk 
CD10  00        brk 
CD11  00        brk 
CD12  00        brk 
CD13  00        brk 
CD14  00        brk 
CD15  00        brk 
CD16  00        brk 
CD17  00        brk 
CD18  00        brk 
CD19  00        brk 
CD1A  00        brk 
CD1B  00        brk 
CD1C  00        brk 
CD1D  00        brk 
CD1E  00        brk 
CD1F  00        brk 
CD20  00        brk 
CD21  00        brk 
CD22  00        brk 
CD23  00        brk 
CD24  00        brk 
CD25  00        brk 
CD26  00        brk 
CD27  00        brk 
CD28  00        brk 
CD29  00        brk 
CD2A  00        brk 
CD2B  00        brk 
CD2C  00        brk 
CD2D  00        brk 
CD2E  00        brk 
CD2F  00        brk 
CD30  00        brk 
CD31  00        brk 
CD32  00        brk 
CD33  00        brk 
CD34  00        brk 
CD35  00        brk 
CD36  00        brk 
CD37  00        brk 
CD38  00        brk 
CD39  00        brk 
CD3A  00        brk 
CD3B  00        brk 
CD3C  00        brk 
CD3D  00        brk 
CD3E  00        brk 
CD3F  00        brk 
CD40  00        brk 
CD41  00        brk 
CD42  00        brk 
CD43  00        brk 
CD44  00        brk 
CD45  00        brk 
CD46  00        brk 
CD47  00        brk 
CD48  00        brk 
CD49  00        brk 
CD4A  00        brk 
CD4B  00        brk 
CD4C  00        brk 
CD4D  00        brk 
CD4E  00        brk 
CD4F  00        brk 
CD50  00        brk 
CD51  00        brk 
CD52  00        brk 
CD53  00        brk 
CD54  00        brk 
CD55  00        brk 
CD56  00        brk 
CD57  00        brk 
CD58  00        brk 
CD59  00        brk 
CD5A  00        brk 
CD5B  00        brk 
CD5C  00        brk 
CD5D  00        brk 
CD5E  00        brk 
CD5F  00        brk 
CD60  00        brk 
CD61  00        brk 
CD62  00        brk 
CD63  00        brk 
CD64  00        brk 
CD65  00        brk 
CD66  00        brk 
CD67  00        brk 
CD68  00        brk 
CD69  00        brk 
CD6A  00        brk 
CD6B  00        brk 
CD6C  00        brk 
CD6D  00        brk 
CD6E  00        brk 
CD6F  00        brk 
CD70  00        brk 
CD71  00        brk 
CD72  00        brk 
CD73  00        brk 
CD74  00        brk 
CD75  00        brk 
CD76  00        brk 
CD77  00        brk 
CD78  00        brk 
CD79  00        brk 
CD7A  00        brk 
CD7B  00        brk 
CD7C  00        brk 
CD7D  00        brk 
CD7E  00        brk 
CD7F  00        brk 
CD80  00        brk 
CD81  00        brk 
CD82  00        brk 
CD83  00        brk 
CD84  00        brk 
CD85  00        brk 
CD86  00        brk 
CD87  00        brk 
CD88  00        brk 
CD89  00        brk 
CD8A  00        brk 
CD8B  00        brk 
CD8C  00        brk 
CD8D  00        brk 
CD8E  00        brk 
CD8F  00        brk 
CD90  00        brk 
CD91  00        brk 
CD92  00        brk 
CD93  00        brk 
CD94  00        brk 
CD95  00        brk 
CD96  00        brk 
CD97  00        brk 
CD98  00        brk 
CD99  00        brk 
CD9A  00        brk 
CD9B  00        brk 
CD9C  00        brk 
CD9D  00        brk 
CD9E  00        brk 
CD9F  00        brk 
CDA0  00        brk 
CDA1  00        brk 
CDA2  00        brk 
CDA3  00        brk 
CDA4  00        brk 
CDA5  00        brk 
CDA6  00        brk 
CDA7  00        brk 
CDA8  00        brk 
CDA9  00        brk 
CDAA  00        brk 
CDAB  00        brk 
CDAC  00        brk 
CDAD  00        brk 
CDAE  00        brk 
CDAF  00        brk 
CDB0  00        brk 
CDB1  00        brk 
CDB2  00        brk 
CDB3  00        brk 
CDB4  00        brk 
CDB5  00        brk 
CDB6  00        brk 
CDB7  00        brk 
CDB8  00        brk 
CDB9  00        brk 
CDBA  00        brk 
CDBB  00        brk 
CDBC  00        brk 
CDBD  00        brk 
CDBE  00        brk 
CDBF  00        brk 
CDC0  00        brk 
CDC1  00        brk 
CDC2  00        brk 
CDC3  00        brk 
CDC4  00        brk 
CDC5  00        brk 
CDC6  00        brk 
CDC7  00        brk 
CDC8  00        brk 
CDC9  00        brk 
CDCA  00        brk 
CDCB  00        brk 
CDCC  00        brk 
CDCD  00        brk 
CDCE  00        brk 
CDCF  00        brk 
CDD0  00        brk 
CDD1  00        brk 
CDD2  00        brk 
CDD3  00        brk 
CDD4  00        brk 
CDD5  00        brk 
CDD6  00        brk 
CDD7  00        brk 
CDD8  00        brk 
CDD9  00        brk 
CDDA  00        brk 
CDDB  00        brk 
CDDC  00        brk 
CDDD  00        brk 
CDDE  00        brk 
CDDF  00        brk 
CDE0  00        brk 
CDE1  00        brk 
CDE2  00        brk 
CDE3  00        brk 
CDE4  00        brk 
CDE5  00        brk 
CDE6  00        brk 
CDE7  00        brk 
CDE8  00        brk 
CDE9  00        brk 
CDEA  00        brk 
CDEB  00        brk 
CDEC  00        brk 
CDED  00        brk 
CDEE  00        brk 
CDEF  00        brk 
CDF0  00        brk 
CDF1  00        brk 
CDF2  00        brk 
CDF3  00        brk 
CDF4  00        brk 
CDF5  00        brk 
CDF6  00        brk 
CDF7  00        brk 
CDF8  00        brk 
CDF9  00        brk 
CDFA  00        brk 
CDFB  00        brk 
CDFC  00        brk 
CDFD  00        brk 
CDFE  00        brk 
CDFF  00        brk 
CE00  00        brk 
CE01  00        brk 
CE02  00        brk 
CE03  00        brk 
CE04  00        brk 
CE05  00        brk 
CE06  00        brk 
CE07  00        brk 
CE08  00        brk 
CE09  00        brk 
CE0A  00        brk 
CE0B  00        brk 
CE0C  00        brk 
CE0D  00        brk 
CE0E  00        brk 
CE0F  00        brk 
CE10  00        brk 
CE11  00        brk 
CE12  00        brk 
CE13  00        brk 
CE14  00        brk 
CE15  00        brk 
CE16  00        brk 
CE17  00        brk 
CE18  00        brk 
CE19  00        brk 
CE1A  00        brk 
CE1B  00        brk 
CE1C  00        brk 
CE1D  00        brk 
CE1E  00        brk 
CE1F  00        brk 
CE20  00        brk 
CE21  00        brk 
CE22  00        brk 
CE23  00        brk 
CE24  00        brk 
CE25  00        brk 
CE26  00        brk 
CE27  00        brk 
CE28  00        brk 
CE29  00        brk 
CE2A  00        brk 
CE2B  00        brk 
CE2C  00        brk 
CE2D  00        brk 
CE2E  00        brk 
CE2F  00        brk 
CE30  00        brk 
CE31  00        brk 
CE32  00        brk 
CE33  00        brk 
CE34  00        brk 
CE35  00        brk 
CE36  00        brk 
CE37  00        brk 
CE38  00        brk 
CE39  00        brk 
CE3A  00        brk 
CE3B  00        brk 
CE3C  00        brk 
CE3D  00        brk 
CE3E  00        brk 
CE3F  00        brk 
CE40  00        brk 
CE41  00        brk 
CE42  00        brk 
CE43  00        brk 
CE44  00        brk 
CE45  00        brk 
CE46  00        brk 
CE47  00        brk 
CE48  00        brk 
CE49  00        brk 
CE4A  00        brk 
CE4B  00        brk 
CE4C  00        brk 
CE4D  00        brk 
CE4E  00        brk 
CE4F  00        brk 
CE50  00        brk 
CE51  00        brk 
CE52  00        brk 
CE53  00        brk 
CE54  00        brk 
CE55  00        brk 
CE56  00        brk 
CE57  00        brk 
CE58  00        brk 
CE59  00        brk 
CE5A  00        brk 
CE5B  00        brk 
CE5C  00        brk 
CE5D  00        brk 
CE5E  00        brk 
CE5F  00        brk 
CE60  00        brk 
CE61  00        brk 
CE62  00        brk 
CE63  00        brk 
CE64  00        brk 
CE65  00        brk 
CE66  00        brk 
CE67  00        brk 
CE68  00        brk 
CE69  00        brk 
CE6A  00        brk 
CE6B  00        brk 
CE6C  00        brk 
CE6D  00        brk 
CE6E  00        brk 
CE6F  00        brk 
CE70  00        brk 
CE71  00        brk 
CE72  00        brk 
CE73  00        brk 
CE74  00        brk 
CE75  00        brk 
CE76  00        brk 
CE77  00        brk 
CE78  00        brk 
CE79  00        brk 
CE7A  00        brk 
CE7B  00        brk 
CE7C  00        brk 
CE7D  00        brk 
CE7E  00        brk 
CE7F  00        brk 
CE80  00        brk 
CE81  00        brk 
CE82  00        brk 
CE83  00        brk 
CE84  00        brk 
CE85  00        brk 
CE86  00        brk 
CE87  00        brk 
CE88  00        brk 
CE89  00        brk 
CE8A  00        brk 
CE8B  00        brk 
CE8C  00        brk 
CE8D  00        brk 
CE8E  00        brk 
CE8F  00        brk 
CE90  00        brk 
CE91  00        brk 
CE92  00        brk 
CE93  00        brk 
CE94  00        brk 
CE95  00        brk 
CE96  00        brk 
CE97  00        brk 
CE98  00        brk 
CE99  00        brk 
CE9A  00        brk 
CE9B  00        brk 
CE9C  00        brk 
CE9D  00        brk 
CE9E  00        brk 
CE9F  00        brk 
CEA0  00        brk 
CEA1  00        brk 
CEA2  00        brk 
CEA3  00        brk 
CEA4  00        brk 
CEA5  00        brk 
CEA6  00        brk 
CEA7  00        brk 
CEA8  00        brk 
CEA9  00        brk 
CEAA  00        brk 
CEAB  00        brk 
CEAC  00        brk 
CEAD  00        brk 
CEAE  00        brk 
CEAF  00        brk 
CEB0  00        brk 
CEB1  00        brk 
CEB2  00        brk 
CEB3  00        brk 
CEB4  00        brk 
CEB5  00        brk 
CEB6  00        brk 
CEB7  00        brk 
CEB8  00        brk 
CEB9  00        brk 
CEBA  00        brk 
CEBB  00        brk 
CEBC  00        brk 
CEBD  00        brk 
CEBE  00        brk 
CEBF  00        brk 
CEC0  00        brk 
CEC1  00        brk 
CEC2  00        brk 
CEC3  00        brk 
CEC4  00        brk 
CEC5  00        brk 
CEC6  00        brk 
CEC7  00        brk 
CEC8  00        brk 
CEC9  00        brk 
CECA  00        brk 
CECB  00        brk 
CECC  00        brk 
CECD  00        brk 
CECE  00        brk 
CECF  00        brk 
CED0  00        brk 
CED1  00        brk 
CED2  00        brk 
CED3  00        brk 
CED4  00        brk 
CED5  00        brk 
CED6  00        brk 
CED7  00        brk 
CED8  00        brk 
CED9  00        brk 
CEDA  00        brk 
CEDB  00        brk 
CEDC  00        brk 
CEDD  00        brk 
CEDE  00        brk 
CEDF  00        brk 
CEE0  00        brk 
CEE1  00        brk 
CEE2  00        brk 
CEE3  00        brk 
CEE4  00        brk 
CEE5  00        brk 
CEE6  00        brk 
CEE7  00        brk 
CEE8  00        brk 
CEE9  00        brk 
CEEA  00        brk 
CEEB  00        brk 
CEEC  00        brk 
CEED  00        brk 
CEEE  00        brk 
CEEF  00        brk 
CEF0  00        brk 
CEF1  00        brk 
CEF2  00        brk 
CEF3  00        brk 
CEF4  00        brk 
CEF5  00        brk 
CEF6  00        brk 
CEF7  00        brk 
CEF8  00        brk 
CEF9  00        brk 
CEFA  00        brk 
CEFB  00        brk 
CEFC  00        brk 
CEFD  00        brk 
CEFE  00        brk 
CEFF  00        brk 
CF00  00        brk 
CF01  00        brk 
CF02  00        brk 
CF03  00        brk 
CF04  00        brk 
CF05  00        brk 
CF06  00        brk 
CF07  00        brk 
CF08  00        brk 
CF09  00        brk 
CF0A  00        brk 
CF0B  00        brk 
CF0C  00        brk 
CF0D  00        brk 
CF0E  00        brk 
CF0F  00        brk 
CF10  00        brk 
CF11  00        brk 
CF12  00        brk 
CF13  00        brk 
CF14  00        brk 
CF15  00        brk 
CF16  00        brk 
CF17  00        brk 
CF18  00        brk 
CF19  00        brk 
CF1A  00        brk 
CF1B  00        brk 
CF1C  00        brk 
CF1D  00        brk 
CF1E  00        brk 
CF1F  00        brk 
CF20  00        brk 
CF21  00        brk 
CF22  00        brk 
CF23  00        brk 
CF24  00        brk 
CF25  00        brk 
CF26  00        brk 
CF27  00        brk 
CF28  00        brk 
CF29  00        brk 
CF2A  00        brk 
CF2B  00        brk 
CF2C  00        brk 
CF2D  00        brk 
CF2E  00        brk 
CF2F  00        brk 
CF30  00        brk 
CF31  00        brk 
CF32  00        brk 
CF33  00        brk 
CF34  00        brk 
CF35  00        brk 
CF36  00        brk 
CF37  00        brk 
CF38  00        brk 
CF39  00        brk 
CF3A  00        brk 
CF3B  00        brk 
CF3C  00        brk 
CF3D  00        brk 
CF3E  00        brk 
CF3F  00        brk 
CF40  00        brk 
CF41  00        brk 
CF42  00        brk 
CF43  00        brk 
CF44  00        brk 
CF45  00        brk 
CF46  00        brk 
CF47  00        brk 
CF48  00        brk 
CF49  00        brk 
CF4A  00        brk 
CF4B  00        brk 
CF4C  00        brk 
CF4D  00        brk 
CF4E  00        brk 
CF4F  00        brk 
CF50  00        brk 
CF51  00        brk 
CF52  00        brk 
CF53  00        brk 
CF54  00        brk 
CF55  00        brk 
CF56  00        brk 
CF57  00        brk 
CF58  00        brk 
CF59  00        brk 
CF5A  00        brk 
CF5B  00        brk 
CF5C  00        brk 
CF5D  00        brk 
CF5E  00        brk 
CF5F  00        brk 
CF60  00        brk 
CF61  00        brk 
CF62  00        brk 
CF63  00        brk 
CF64  00        brk 
CF65  00        brk 
CF66  00        brk 
CF67  00        brk 
CF68  00        brk 
CF69  00        brk 
CF6A  00        brk 
CF6B  00        brk 
CF6C  00        brk 
CF6D  00        brk 
CF6E  00        brk 
CF6F  00        brk 
CF70  00        brk 
CF71  00        brk 
CF72  00        brk 
CF73  00        brk 
CF74  00        brk 
CF75  00        brk 
CF76  00        brk 
CF77  00        brk 
CF78  00        brk 
CF79  00        brk 
CF7A  00        brk 
CF7B  00        brk 
CF7C  00        brk 
CF7D  00        brk 
CF7E  00        brk 
CF7F  00        brk 
CF80  00        brk 
CF81  00        brk 
CF82  00        brk 
CF83  00        brk 
CF84  00        brk 
CF85  00        brk 
CF86  00        brk 
CF87  00        brk 
CF88  00        brk 
CF89  00        brk 
CF8A  00        brk 
CF8B  00        brk 
CF8C  00        brk 
CF8D  00        brk 
CF8E  00        brk 
CF8F  00        brk 
CF90  00        brk 
CF91  00        brk 
CF92  00        brk 
CF93  00        brk 
CF94  00        brk 
CF95  00        brk 
CF96  00        brk 
CF97  00        brk 
CF98  00        brk 
CF99  00        brk 
CF9A  00        brk 
CF9B  00        brk 
CF9C  00        brk 
CF9D  00        brk 
CF9E  00        brk 
CF9F  00        brk 
CFA0  00        brk 
CFA1  00        brk 
CFA2  00        brk 
CFA3  00        brk 
CFA4  00        brk 
CFA5  00        brk 
CFA6  00        brk 
CFA7  00        brk 
CFA8  00        brk 
CFA9  00        brk 
CFAA  00        brk 
CFAB  00        brk 
CFAC  00        brk 
CFAD  00        brk 
CFAE  00        brk 
CFAF  00        brk 
CFB0  00        brk 
CFB1  00        brk 
CFB2  00        brk 
CFB3  00        brk 
CFB4  00        brk 
CFB5  00        brk 
CFB6  00        brk 
CFB7  00        brk 
CFB8  00        brk 
CFB9  00        brk 
CFBA  00        brk 
CFBB  00        brk 
CFBC  00        brk 
CFBD  00        brk 
CFBE  00        brk 
CFBF  00        brk 
CFC0  00        brk 
CFC1  00        brk 
CFC2  00        brk 
CFC3  00        brk 
CFC4  00        brk 
CFC5  00        brk 
CFC6  00        brk 
CFC7  00        brk 
CFC8  00        brk 
CFC9  00        brk 
CFCA  00        brk 
CFCB  00        brk 
CFCC  00        brk 
CFCD  00        brk 
CFCE  00        brk 
CFCF  00        brk 
CFD0  00        brk 
CFD1  00        brk 
CFD2  00        brk 
CFD3  00        brk 
CFD4  00        brk 
CFD5  00        brk 
CFD6  00        brk 
CFD7  00        brk 
CFD8  00        brk 
CFD9  00        brk 
CFDA  00        brk 
CFDB  00        brk 
CFDC  00        brk 
CFDD  00        brk 
CFDE  00        brk 
CFDF  00        brk 
CFE0  00        brk 
CFE1  00        brk 
CFE2  00        brk 
CFE3  00        brk 
CFE4  00        brk 
CFE5  00        brk 
CFE6  00        brk 
CFE7  00        brk 
CFE8  00        brk 
CFE9  00        brk 
CFEA  00        brk 
CFEB  00        brk 
CFEC  00        brk 
CFED  00        brk 
CFEE  00        brk 
CFEF  00        brk 
CFF0  00        brk 
CFF1  00        brk 
CFF2  00        brk 
CFF3  00        brk 
CFF4  00        brk 
CFF5  00        brk 
CFF6  00        brk 
CFF7  00        brk 
CFF8  00        brk 
CFF9  00        brk 
CFFA  00        brk 
CFFB  00        brk 
CFFC  00        brk 
CFFD  00        brk 
CFFE  00        brk 
CFFF  00        brk 
