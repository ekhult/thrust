0400  A9 00     lda #$00
0402  A0 0F     ldy #$0F
0404  99 00 D0  sta $D000,y
0407  88        dey 
0408  10 FA     bpl $0404
040A  A9 FF     lda #$FF
040C  8D 15 D0  sta $D015
040F  A9 00     lda #$00
0411  8D 17 D0  sta $D017
0414  8D 1D D0  sta $D01D
0417  A9 03     lda #$03
0419  20 48 C3  jsr $C348
041C  AD 00 DD  lda $DD00
041F  29 FC     and #$FC
0421  09 02     ora #$02
0423  8D 00 DD  sta $DD00
0426  A9 00     lda #$00
0428  8D 20 D0  sta $D020
042B  AD 11 D0  lda $D011
042E  09 20     ora #$20
0430  29 EF     and #$EF
0432  8D 11 D0  sta $D011
0435  AD 16 D0  lda $D016
0438  09 10     ora #$10
043A  8D 16 D0  sta $D016
043D  A9 70     lda #$70
043F  09 08     ora #$08
0441  8D 18 D0  sta $D018
0444  A9 00     lda #$00
0446  8D 21 D0  sta $D021
0449  8D A4 A6  sta $A6A4
044C  20 5F A7  jsr $A75F
044F  A9 A4     lda #$A4
0451  85 80     sta $80
0453  A9 BB     lda #$BB
0455  85 81     sta $81
0457  A9 00     lda #$00
0459  85 82     sta $82
045B  A9 58     lda #$58
045D  85 83     sta $83
045F  A9 00     lda #$00
0461  85 84     sta $84
0463  A9 60     lda #$60
0465  85 85     sta $85
0467  A0 00     ldy #$00
0469  A2 03     ldx #$03
046B  B1 80     lda ($80),y
046D  91 82     sta ($82),y
046F  91 84     sta ($84),y
0471  C8        iny 
0472  D0 F7     bne $046B
0474  E6 81     inc $81
0476  E6 83     inc $83
0478  E6 85     inc $85
047A  CA        dex 
047B  D0 EE     bne $046B
047D  20 FE B3  jsr $B3FE
0480  20 41 8B  jsr $8B41
0483  20 E8 8B  jsr $8BE8
0486  20 9B 8C  jsr $8C9B
0489  AD 14 03  lda $0314
048C  8D C0 08  sta $08C0
048F  AD 15 03  lda $0315
0492  8D C1 08  sta $08C1
0495  78        sei 
0496  A9 43     lda #$43
0498  8D 14 03  sta $0314
049B  8D 16 03  sta $0316
049E  A9 89     lda #$89
04A0  8D 15 03  sta $0315
04A3  8D 17 03  sta $0317
04A6  A9 00     lda #$00
04A8  8D 12 D0  sta $D012
04AB  AD 11 D0  lda $D011
04AE  29 7F     and #$7F
04B0  8D 11 D0  sta $D011
04B3  A9 01     lda #$01
04B5  8D 1A D0  sta $D01A
04B8  A9 00     lda #$00
04BA  8D 0E DC  sta $DC0E
04BD  A9 6A     lda #$6A
04BF  8D 04 DC  sta $DC04
04C2  A9 27     lda #$27
04C4  8D 05 DC  sta $DC05
04C7  A9 81     lda #$81
04C9  8D 0D DC  sta $DC0D
04CC  A9 01     lda #$01
04CE  8D 0E DC  sta $DC0E
04D1  A9 7E     lda #$7E
04D3  8D 0D DC  sta $DC0D
04D6  A9 7F     lda #$7F
04D8  8D 0D DD  sta $DD0D
04DB  58        cli 
04DC  A0 14     ldy #$14
04DE  A9 00     lda #$00
04E0  99 00 D4  sta $D400,y
04E3  88        dey 
04E4  10 FA     bpl $04E0
04E6  8D 17 D4  sta $D417
04E9  A9 0F     lda #$0F
04EB  8D 44 9B  sta $9B44
04EE  8D 18 D4  sta $D418
04F1  4C 82 AF  jmp $AF82
04F4  00        brk 
04F5  08        php 
04F6  00        brk 
04F7  20 20 20  jsr $2020
04FA  46 69     lsr $69
04FC  72        .byte $72
04FD  65 62     adc $62
04FF  69 72     adc #$72
0501  64        .byte $64
0502  20 20 00  jsr $0020
0505  07        .byte $07
0506  00        brk 
0507  20 20 20  jsr $2020
050A  46 69     lsr $69
050C  72        .byte $72
050D  65 62     adc $62
050F  69 72     adc #$72
0511  64        .byte $64
0512  20 20 00  jsr $0020
0515  06 00     asl $00
0517  20 20 20  jsr $2020
051A  46 69     lsr $69
051C  72        .byte $72
051D  65 62     adc $62
051F  69 72     adc #$72
0521  64        .byte $64
0522  20 20 00  jsr $0020
0525  05 00     ora $00
0527  20 20 20  jsr $2020
052A  46 69     lsr $69
052C  72        .byte $72
052D  65 62     adc $62
052F  69 72     adc #$72
0531  64        .byte $64
0532  20 20 00  jsr $0020
0535  04        .byte $04
0536  00        brk 
0537  20 20 20  jsr $2020
053A  46 69     lsr $69
053C  72        .byte $72
053D  65 62     adc $62
053F  69 72     adc #$72
0541  64        .byte $64
0542  20 20 00  jsr $0020
0545  03        .byte $03
0546  00        brk 
0547  20 20 20  jsr $2020
054A  46 69     lsr $69
054C  72        .byte $72
054D  65 62     adc $62
054F  69 72     adc #$72
0551  64        .byte $64
0552  20 20 00  jsr $0020
0555  02        .byte $02
0556  00        brk 
0557  20 20 20  jsr $2020
055A  46 69     lsr $69
055C  72        .byte $72
055D  65 62     adc $62
055F  69 72     adc #$72
0561  64        .byte $64
0562  20 20 00  jsr $0020
0565  01 00     ora ($00,x)
0567  20 20 20  jsr $2020
056A  46 69     lsr $69
056C  72        .byte $72
056D  65 62     adc $62
056F  69 72     adc #$72
0571  64        .byte $64
0572  20 20 80  jsr $8020
0575  8D B1 EC  sta $ECB1
0578  3C        .byte $3C
0579  9D 0C 84  sta $840C,x
057C  00        brk 
057D  7C        .byte $7C
057E  F4        .byte $F4
057F  63        .byte $63
0580  C4 14     cpy $14
0582  4F        .byte $4F
0583  73        .byte $73
0584  80        .byte $80
0585  73        .byte $73
0586  4F        .byte $4F
0587  14        .byte $14
0588  C4 63     cpy $63
058A  F4        .byte $F4
058B  7C        .byte $7C
058C  00        brk 
058D  84 0C     sty $0C
058F  9D 3C EC  sta $EC3C,x
0592  B1 8D     lda ($8D),y
0594  FD FD FD  sbc $FDFD,x
0597  FD FE FE  sbc $FEFE,x
059A  FF        .byte $FF
059B  FF        .byte $FF
059C  00        brk 
059D  00        brk 
059E  00        brk 
059F  01 01     ora ($01,x)
05A1  02        .byte $02
05A2  02        .byte $02
05A3  02        .byte $02
05A4  02        .byte $02
05A5  02        .byte $02
05A6  02        .byte $02
05A7  02        .byte $02
05A8  01 01     ora ($01,x)
05AA  00        brk 
05AB  00        brk 
05AC  00        brk 
05AD  FF        .byte $FF
05AE  FF        .byte $FF
05AF  FE FE FD  inc $FDFE,x
05B2  FD FD 00  sbc $00FD,x
05B5  3E 7A B1  rol $B17A,x
05B8  E2        .byte $E2
05B9  0A        asl a
05BA  27        .byte $27
05BB  39 40 39  and $3940,y
05BE  27        .byte $27
05BF  0A        asl a
05C0  E2        .byte $E2
05C1  B1 7A     lda ($7A),y
05C3  3E 00 C2  rol $C200,x
05C6  86 4F     stx $4F
05C8  1E F6 D9  asl $D9F6,x
05CB  C7        .byte $C7
05CC  C0 C7     cpy #$C7
05CE  D9 F6 1E  cmp $1EF6,y
05D1  4F        .byte $4F
05D2  86 C2     stx $C2
05D4  00        brk 
05D5  00        brk 
05D6  00        brk 
05D7  00        brk 
05D8  00        brk 
05D9  01 01     ora ($01,x)
05DB  01 01     ora ($01,x)
05DD  01 01     ora ($01,x)
05DF  01 00     ora ($00,x)
05E1  00        brk 
05E2  00        brk 
05E3  00        brk 
05E4  00        brk 
05E5  FF        .byte $FF
05E6  FF        .byte $FF
05E7  FF        .byte $FF
05E8  FF        .byte $FF
05E9  FE FE FE  inc $FEFE,x
05EC  FE FE FE  inc $FEFE,x
05EF  FE FF FF  inc $FFFF,x
05F2  FF        .byte $FF
05F3  FF        .byte $FF
05F4  38        sec 
05F5  6E 47 61  ror $6147
05F8  6D 65 20  adc $2065
05FB  4F        .byte $4F
05FC  76 65     ror $65,x
05FE  72        .byte $72
05FF  FF        .byte $FF
0600  50 65     bvc $0667
0602  54        .byte $54
0603  6F        .byte $6F
0604  70 20     bvs $0626
0606  45 69     eor $69
0608  67        .byte $67
0609  68        pla 
060A  74        .byte $74
060B  20 54 68  jsr $6854
060E  72        .byte $72
060F  75 73     adc $73,x
0611  74        .byte $74
0612  65 72     adc $72
0614  73        .byte $73
0615  FF        .byte $FF
0616  60        rts 
0617  65 43     adc $43
0619  6F        .byte $6F
061A  6E 67 72  ror $7267
061D  61 74     adc ($74,x)
061F  75 6C     adc $6C,x
0621  61 74     adc ($74,x)
0623  69 6F     adc #$6F
0625  6E 73 FF  ror $FF73
0628  48        pha 
0629  74        .byte $74
062A  50 6C     bvc $0698
062C  65 61     adc $61
062E  73        .byte $73
062F  65 20     adc $20
0631  65 6E     adc $6E
0633  74        .byte $74
0634  65 72     adc $72
0636  20 79 6F  jsr $6F79
0639  75 72     adc $72,x
063B  20 6E 61  jsr $616E
063E  6D 65 FF  adc $FF65
0641  38        sec 
0642  74        .byte $74
0643  50 72     bvc $06B7
0645  65 73     adc $73
0647  73        .byte $73
0648  20 53 50  jsr $5053
064B  41 43     eor ($43,x)
064D  45 20     eor $20
064F  42        .byte $42
0650  41 52     eor ($52,x)
0652  20 74 6F  jsr $6F74
0655  20 73 74  jsr $7473
0658  61 72     adc ($72,x)
065A  74        .byte $74
065B  FF        .byte $FF
065C  B0 6B     bcs $06C9
065E  4F        .byte $4F
065F  75 74     adc $74,x
0661  20 6F 66  jsr $666F
0664  20 66 75  jsr $7566
0667  65 6C     adc $6C
0669  FF        .byte $FF
066A  16 07     asl $07,x
066C  84 9D     sty $9D
066E  83        .byte $83
066F  8D 20 20  sta $2020
0672  20 20 20  jsr $2020
0675  4A        lsr a
0676  65 72     adc $72
0678  65 6D     adc $6D
067A  79 27 73  adc $7327,y
067D  20 54 68  jsr $6854
0680  72        .byte $72
0681  75 73     adc $73,x
0683  74        .byte $74
0684  65 72     adc $72
0686  20 47 61  jsr $6147
0689  6D 65 0A  adc $0A65
068C  0D 84 9D  ora $9D84
068F  83        .byte $83
0690  8D 20 20  sta $2020
0693  20 20 20  jsr $2020
0696  4A        lsr a
0697  65 72     adc $72
0699  65 6D     adc $6D
069B  79 27 73  adc $7327,y
069E  20 54 68  jsr $6854
06A1  72        .byte $72
06A2  75 73     adc $73,x
06A4  74        .byte $74
06A5  65 72     adc $72
06A7  20 47 61  jsr $6147
06AA  6D 65 0D  adc $0D65
06AD  0A        asl a
06AE  0A        asl a
06AF  0A        asl a
06B0  83        .byte $83
06B1  54        .byte $54
06B2  68        pla 
06B3  65 20     adc $20
06B5  6B        .byte $6B
06B6  65 79     adc $79
06B8  73        .byte $73
06B9  20 61 72  jsr $7261
06BC  65 3A     adc $3A
06BE  0D 0A 0A  ora $0A0A
06C1  0A        asl a
06C2  85 20     sta $20
06C4  20 20 20  jsr $2020
06C7  20 20 20  jsr $2020
06CA  43        .byte $43
06CB  41 50     eor ($50,x)
06CD  53        .byte $53
06CE  20 4C 4F  jsr $4F4C
06D1  43        .byte $43
06D2  4B        .byte $4B
06D3  20 20 5F  jsr $5F20
06D6  20 20 52  jsr $5220
06D9  6F        .byte $6F
06DA  74        .byte $74
06DB  61 74     adc ($74,x)
06DD  65 20     adc $20
06DF  4C 65 66  jmp $6665
06E2  74        .byte $74
06E3  0D 0A 85  ora $850A
06E6  20 20 20  jsr $2020
06E9  20 20 20  jsr $2020
06EC  20 20 20  jsr $2020
06EF  20 20 20  jsr $2020
06F2  43        .byte $43
06F3  54        .byte $54
06F4  52        .byte $52
06F5  4C 20 20  jmp $2020
06F8  5F        .byte $5F
06F9  20 20 52  jsr $5220
06FC  6F        .byte $6F
06FD  74        .byte $74
06FE  61 74     adc ($74,x)
0700  A0 82     ldy #$82
0702  85 85     sta $85
0704  8E A0 83  stx $83A0
0707  8F        .byte $8F
0708  8D 8D 89  sta $898D
070B  93        .byte $93
070C  93        .byte $93
070D  89        .byte $89
070E  8F        .byte $8F
070F  8E 85 84  stx $8485
0712  A0 82     ldy #$82
0714  99 A0 94  sta $94A0,y
0717  88        dey 
0718  85 A0     sta $A0
071A  A0 A0     ldy #$A0
071C  A0 A0     ldy #$A0
071E  A0 A0     ldy #$A0
0720  00        brk 
0721  00        brk 
0722  00        brk 
0723  00        brk 
0724  00        brk 
0725  00        brk 
0726  00        brk 
0727  00        brk 
0728  00        brk 
0729  00        brk 
072A  00        brk 
072B  00        brk 
072C  00        brk 
072D  00        brk 
072E  00        brk 
072F  00        brk 
0730  00        brk 
0731  00        brk 
0732  00        brk 
0733  00        brk 
0734  00        brk 
0735  00        brk 
0736  00        brk 
0737  00        brk 
0738  00        brk 
0739  00        brk 
073A  00        brk 
073B  00        brk 
073C  00        brk 
073D  00        brk 
073E  00        brk 
073F  00        brk 
0740  00        brk 
0741  8F        .byte $8F
0742  8D A0 94  sta $94A0
0745  88        dey 
0746  85 A0     sta $A0
0748  C5 8D     cmp $8D
074A  90 89     bcc $06D5
074C  92        .byte $92
074D  85 A7     sta $A7
074F  93        .byte $93
0750  A0 93     ldy #$93
0752  94 8F     sty $8F,x
0754  92        .byte $92
0755  81 87     sta ($87,x)
0757  85 A0     sta $A0
0759  90 8C     bcc $06E7
075B  81 8E     sta ($8E,x)
075D  85 94     sta $94
075F  93        .byte $93
0760  AE A0 A0  ldx $A0A0
0763  A0 A0     ldy #$A0
0765  A0 A0     ldy #$A0
0767  A0 A0     ldy #$A0
0769  A0 A0     ldy #$A0
076B  A0 A0     ldy #$A0
076D  A0 A0     ldy #$A0
076F  A0 A0     ldy #$A0
0771  A0 A0     ldy #$A0
0773  A0 A0     ldy #$A0
0775  A0 A0     ldy #$A0
0777  A0 A0     ldy #$A0
0779  A0 A0     ldy #$A0
077B  A0 A0     ldy #$A0
077D  A0 A0     ldy #$A0
077F  A0 A0     ldy #$A0
0781  A0 A0     ldy #$A0
0783  A0 A0     ldy #$A0
0785  A0 A0     ldy #$A0
0787  A0 A0     ldy #$A0
0789  A0 A0     ldy #$A0
078B  A0 A0     ldy #$A0
078D  A0 A0     ldy #$A0
078F  A0 A0     ldy #$A0
0791  A0 A0     ldy #$A0
0793  A0 A0     ldy #$A0
0795  A0 A0     ldy #$A0
0797  A0 A0     ldy #$A0
0799  A0 A0     ldy #$A0
079B  A0 A0     ldy #$A0
079D  A0 A0     ldy #$A0
079F  A0 A0     ldy #$A0
07A1  A0 D3     ldy #$D3
07A3  D0 C1     bne $0766
07A5  C3        .byte $C3
07A6  C5 A0     cmp $A0
07A8  AE AE AE  ldx $AEAE
07AB  A0 CE     ldy #$CE
07AD  85 98     sta $98
07AF  94 A0     sty $A0,x
07B1  90 81     bcc $0734
07B3  87        .byte $87
07B4  85 A0     sta $A0
07B6  A0 A0     ldy #$A0
07B8  A0 A0     ldy #$A0
07BA  A0 A0     ldy #$A0
07BC  A0 A0     ldy #$A0
07BE  A0 A0     ldy #$A0
07C0  FF        .byte $FF
07C1  A0 A0     ldy #$A0
07C3  A0 A0     ldy #$A0
07C5  A0 A0     ldy #$A0
07C7  A0 D2     ldy #$D2
07C9  D5 CE     cmp $CE,x
07CB  AF        .byte $AF
07CC  D3        .byte $D3
07CD  D4        .byte $D4
07CE  CF        .byte $CF
07CF  D0 A0     bne $0771
07D1  AE AE AE  ldx $AEAE
07D4  A0 D3     ldy #$D3
07D6  94 81     sty $81,x
07D8  92        .byte $92
07D9  94 A0     sty $A0,x
07DB  87        .byte $87
07DC  81 8D     sta ($8D,x)
07DE  85 A0     sta $A0
07E0  A0 A0     ldy #$A0
07E2  A0 A0     ldy #$A0
07E4  A0 A0     ldy #$A0
07E6  A0 A0     ldy #$A0
07E8  45 1F     eor $1F
07EA  62        .byte $62
07EB  EE D1 73  inc $73D1
07EE  7E 3B F0  ror $F03B,x
07F1  F8        sed 
07F2  3D AD 54  and $54AD,x
07F5  91 0F     sta ($0F),y
07F7  73        .byte $73
07F8  9C        .byte $9C
07F9  9C        .byte $9C
07FA  9D AD 01  sta $01AD,x
07FD  DC        .byte $DC
07FE  C9 7F     cmp #$7F
