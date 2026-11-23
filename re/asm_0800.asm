0800  00        brk 
0801  00        brk 
0802  00        brk 
0803  00        brk 
0804  00        brk 
0805  00        brk 
0806  00        brk 
0807  00        brk 
0808  00        brk 
0809  00        brk 
080A  00        brk 
080B  00        brk 
080C  00        brk 
080D  00        brk 
080E  00        brk 
080F  00        brk 
0810  00        brk 
0811  00        brk 
0812  00        brk 
0813  00        brk 
0814  00        brk 
0815  00        brk 
0816  00        brk 
0817  00        brk 
0818  00        brk 
0819  00        brk 
081A  00        brk 
081B  00        brk 
081C  00        brk 
081D  00        brk 
081E  00        brk 
081F  00        brk 
0820  00        brk 
0821  00        brk 
0822  00        brk 
0823  00        brk 
0824  00        brk 
0825  00        brk 
0826  00        brk 
0827  00        brk 
0828  00        brk 
0829  00        brk 
082A  00        brk 
082B  00        brk 
082C  00        brk 
082D  00        brk 
082E  00        brk 
082F  00        brk 
0830  00        brk 
0831  00        brk 
0832  00        brk 
0833  00        brk 
0834  00        brk 
0835  00        brk 
0836  00        brk 
0837  00        brk 
0838  00        brk 
0839  00        brk 
083A  00        brk 
083B  00        brk 
083C  00        brk 
083D  00        brk 
083E  00        brk 
083F  00        brk 
0840  00        brk 
0841  00        brk 
0842  00        brk 
0843  00        brk 
0844  00        brk 
0845  00        brk 
0846  00        brk 
0847  00        brk 
0848  00        brk 
0849  00        brk 
084A  00        brk 
084B  00        brk 
084C  00        brk 
084D  00        brk 
084E  00        brk 
084F  00        brk 
0850  00        brk 
0851  00        brk 
0852  00        brk 
0853  00        brk 
0854  00        brk 
0855  00        brk 
0856  00        brk 
0857  00        brk 
0858  00        brk 
0859  00        brk 
085A  00        brk 
085B  00        brk 
085C  00        brk 
085D  00        brk 
085E  00        brk 
085F  00        brk 
0860  00        brk 
0861  00        brk 
0862  00        brk 
0863  00        brk 
0864  00        brk 
0865  00        brk 
0866  00        brk 
0867  00        brk 
0868  00        brk 
0869  00        brk 
086A  00        brk 
086B  00        brk 
086C  00        brk 
086D  00        brk 
086E  00        brk 
086F  00        brk 
0870  00        brk 
0871  00        brk 
0872  00        brk 
0873  00        brk 
0874  00        brk 
0875  00        brk 
0876  00        brk 
0877  00        brk 
0878  00        brk 
0879  00        brk 
087A  00        brk 
087B  00        brk 
087C  00        brk 
087D  00        brk 
087E  00        brk 
087F  00        brk 
0880  80        .byte $80
0881  8D B1 EC  sta $ECB1
0884  3C        .byte $3C
0885  9D 0C 84  sta $840C,x
0888  00        brk 
0889  7C        .byte $7C
088A  F4        .byte $F4
088B  63        .byte $63
088C  C4 14     cpy $14
088E  4F        .byte $4F
088F  73        .byte $73
0890  80        .byte $80
0891  73        .byte $73
0892  4F        .byte $4F
0893  14        .byte $14
0894  C4 63     cpy $63
0896  F4        .byte $F4
0897  7C        .byte $7C
0898  00        brk 
0899  84 0C     sty $0C
089B  9D 3C EC  sta $EC3C,x
089E  B1 8D     lda ($8D),y
08A0  FD FD FD  sbc $FDFD,x
08A3  FD FE FE  sbc $FEFE,x
08A6  FF        .byte $FF
08A7  FF        .byte $FF
08A8  00        brk 
08A9  00        brk 
08AA  00        brk 
08AB  01 01     ora ($01,x)
08AD  02        .byte $02
08AE  02        .byte $02
08AF  02        .byte $02
08B0  02        .byte $02
08B1  02        .byte $02
08B2  02        .byte $02
08B3  02        .byte $02
08B4  01 01     ora ($01,x)
08B6  00        brk 
08B7  00        brk 
08B8  00        brk 
08B9  FF        .byte $FF
08BA  FF        .byte $FF
08BB  FE FE FD  inc $FDFE,x
08BE  FD FD 31  sbc $31FD,x
08C1  EA        nop 
08C2  00        brk 
08C3  00        brk 
08C4  00        brk 
08C5  00        brk 
08C6  00        brk 
08C7  00        brk 
08C8  00        brk 
08C9  00        brk 
08CA  00        brk 
08CB  00        brk 
08CC  00        brk 
08CD  00        brk 
08CE  00        brk 
08CF  00        brk 
08D0  00        brk 
08D1  00        brk 
08D2  00        brk 
08D3  00        brk 
08D4  00        brk 
08D5  00        brk 
08D6  00        brk 
08D7  00        brk 
08D8  00        brk 
08D9  00        brk 
08DA  00        brk 
08DB  00        brk 
08DC  00        brk 
08DD  00        brk 
08DE  00        brk 
08DF  00        brk 
08E0  00        brk 
08E1  00        brk 
08E2  00        brk 
08E3  00        brk 
08E4  00        brk 
08E5  00        brk 
08E6  00        brk 
08E7  00        brk 
08E8  00        brk 
08E9  00        brk 
08EA  00        brk 
08EB  00        brk 
08EC  00        brk 
08ED  00        brk 
08EE  00        brk 
08EF  00        brk 
08F0  00        brk 
08F1  00        brk 
08F2  00        brk 
08F3  00        brk 
08F4  00        brk 
08F5  00        brk 
08F6  00        brk 
08F7  00        brk 
08F8  00        brk 
08F9  00        brk 
08FA  00        brk 
08FB  00        brk 
08FC  00        brk 
08FD  00        brk 
08FE  00        brk 
08FF  00        brk 
0900  38        sec 
0901  6E 47 61  ror $6147
0904  6D 65 20  adc $2065
0907  4F        .byte $4F
0908  76 65     ror $65,x
090A  72        .byte $72
090B  FF        .byte $FF
090C  50 65     bvc $0973
090E  54        .byte $54
090F  6F        .byte $6F
0910  70 20     bvs $0932
0912  45 69     eor $69
0914  67        .byte $67
0915  68        pla 
0916  74        .byte $74
0917  20 54 68  jsr $6854
091A  72        .byte $72
091B  75 73     adc $73,x
091D  74        .byte $74
091E  65 72     adc $72
0920  73        .byte $73
0921  FF        .byte $FF
0922  60        rts 
0923  65 43     adc $43
0925  6F        .byte $6F
0926  6E 67 72  ror $7267
0929  61 74     adc ($74,x)
092B  75 6C     adc $6C,x
092D  61 74     adc ($74,x)
092F  69 6F     adc #$6F
0931  6E 73 FF  ror $FF73
0934  48        pha 
0935  74        .byte $74
0936  50 6C     bvc $09A4
0938  65 61     adc $61
093A  73        .byte $73
093B  65 20     adc $20
093D  65 6E     adc $6E
093F  74        .byte $74
0940  65 72     adc $72
0942  20 79 6F  jsr $6F79
0945  75 72     adc $72,x
0947  20 6E 61  jsr $616E
094A  6D 65 FF  adc $FF65
094D  38        sec 
094E  74        .byte $74
094F  50 72     bvc $09C3
0951  65 73     adc $73
0953  73        .byte $73
0954  20 53 50  jsr $5053
0957  41 43     eor ($43,x)
0959  45 20     eor $20
095B  42        .byte $42
095C  41 52     eor ($52,x)
095E  20 74 6F  jsr $6F74
0961  20 73 74  jsr $7473
0964  61 72     adc ($72,x)
0966  74        .byte $74
0967  FF        .byte $FF
0968  B0 6B     bcs $09D5
096A  4F        .byte $4F
096B  75 74     adc $74,x
096D  20 6F 66  jsr $666F
0970  20 66 75  jsr $7566
0973  65 6C     adc $6C
0975  FF        .byte $FF
0976  16 07     asl $07,x
0978  84 9D     sty $9D
097A  83        .byte $83
097B  8D 20 20  sta $2020
097E  00        brk 
097F  00        brk 
0980  00        brk 
0981  3E 7A B1  rol $B17A,x
0984  E2        .byte $E2
0985  0A        asl a
0986  27        .byte $27
0987  39 40 39  and $3940,y
098A  27        .byte $27
098B  0A        asl a
098C  E2        .byte $E2
098D  B1 7A     lda ($7A),y
098F  3E 00 C2  rol $C200,x
0992  86 4F     stx $4F
0994  1E F6 D9  asl $D9F6,x
0997  C7        .byte $C7
0998  C0 C7     cpy #$C7
099A  D9 F6 1E  cmp $1EF6,y
099D  4F        .byte $4F
099E  86 C2     stx $C2
09A0  00        brk 
09A1  00        brk 
09A2  00        brk 
09A3  00        brk 
09A4  00        brk 
09A5  01 01     ora ($01,x)
09A7  01 01     ora ($01,x)
09A9  01 01     ora ($01,x)
09AB  01 00     ora ($00,x)
09AD  00        brk 
09AE  00        brk 
09AF  00        brk 
09B0  00        brk 
09B1  FF        .byte $FF
09B2  FF        .byte $FF
09B3  FF        .byte $FF
09B4  FF        .byte $FF
09B5  FE FE FE  inc $FEFE,x
09B8  FE FE FE  inc $FEFE,x
09BB  FE FF FF  inc $FFFF,x
09BE  FF        .byte $FF
09BF  FF        .byte $FF
09C0  00        brk 
09C1  00        brk 
09C2  00        brk 
09C3  00        brk 
09C4  00        brk 
09C5  00        brk 
09C6  00        brk 
09C7  00        brk 
09C8  00        brk 
09C9  00        brk 
09CA  00        brk 
09CB  00        brk 
09CC  00        brk 
09CD  00        brk 
09CE  00        brk 
09CF  00        brk 
09D0  00        brk 
09D1  00        brk 
09D2  00        brk 
09D3  00        brk 
09D4  00        brk 
09D5  00        brk 
09D6  00        brk 
09D7  00        brk 
09D8  00        brk 
09D9  00        brk 
09DA  00        brk 
09DB  00        brk 
09DC  00        brk 
09DD  00        brk 
09DE  00        brk 
09DF  00        brk 
09E0  00        brk 
09E1  00        brk 
09E2  00        brk 
09E3  00        brk 
09E4  00        brk 
09E5  00        brk 
09E6  00        brk 
09E7  00        brk 
09E8  00        brk 
09E9  00        brk 
09EA  00        brk 
09EB  00        brk 
09EC  00        brk 
09ED  00        brk 
09EE  00        brk 
09EF  00        brk 
09F0  00        brk 
09F1  00        brk 
09F2  00        brk 
09F3  00        brk 
09F4  00        brk 
09F5  00        brk 
09F6  00        brk 
09F7  00        brk 
09F8  00        brk 
09F9  00        brk 
09FA  00        brk 
09FB  00        brk 
09FC  00        brk 
09FD  00        brk 
09FE  00        brk 
09FF  00        brk 
0A00  00        brk 
0A01  00        brk 
0A02  00        brk 
0A03  00        brk 
0A04  00        brk 
0A05  00        brk 
0A06  00        brk 
0A07  00        brk 
0A08  00        brk 
0A09  00        brk 
0A0A  00        brk 
0A0B  00        brk 
0A0C  00        brk 
0A0D  00        brk 
0A0E  00        brk 
0A0F  00        brk 
0A10  00        brk 
0A11  00        brk 
0A12  00        brk 
0A13  00        brk 
0A14  00        brk 
0A15  00        brk 
0A16  00        brk 
0A17  00        brk 
0A18  00        brk 
0A19  00        brk 
0A1A  00        brk 
0A1B  00        brk 
0A1C  00        brk 
0A1D  00        brk 
0A1E  00        brk 
0A1F  00        brk 
0A20  00        brk 
0A21  00        brk 
0A22  00        brk 
0A23  00        brk 
0A24  00        brk 
0A25  00        brk 
0A26  00        brk 
0A27  00        brk 
0A28  00        brk 
0A29  00        brk 
0A2A  00        brk 
0A2B  00        brk 
0A2C  00        brk 
0A2D  00        brk 
0A2E  00        brk 
0A2F  00        brk 
0A30  00        brk 
0A31  00        brk 
0A32  00        brk 
0A33  00        brk 
0A34  00        brk 
0A35  00        brk 
0A36  00        brk 
0A37  00        brk 
0A38  00        brk 
0A39  00        brk 
0A3A  00        brk 
0A3B  00        brk 
0A3C  00        brk 
0A3D  00        brk 
0A3E  00        brk 
0A3F  00        brk 
0A40  00        brk 
0A41  00        brk 
0A42  00        brk 
0A43  00        brk 
0A44  00        brk 
0A45  00        brk 
0A46  00        brk 
0A47  00        brk 
0A48  00        brk 
0A49  00        brk 
0A4A  00        brk 
0A4B  00        brk 
0A4C  00        brk 
0A4D  00        brk 
0A4E  00        brk 
0A4F  00        brk 
0A50  00        brk 
0A51  00        brk 
0A52  00        brk 
0A53  00        brk 
0A54  00        brk 
0A55  00        brk 
0A56  00        brk 
0A57  00        brk 
0A58  00        brk 
0A59  00        brk 
0A5A  00        brk 
0A5B  00        brk 
0A5C  00        brk 
0A5D  00        brk 
0A5E  00        brk 
0A5F  00        brk 
0A60  00        brk 
0A61  00        brk 
0A62  00        brk 
0A63  00        brk 
0A64  00        brk 
0A65  00        brk 
0A66  00        brk 
0A67  00        brk 
0A68  00        brk 
0A69  00        brk 
0A6A  00        brk 
0A6B  00        brk 
0A6C  00        brk 
0A6D  00        brk 
0A6E  00        brk 
0A6F  00        brk 
0A70  00        brk 
0A71  00        brk 
0A72  00        brk 
0A73  00        brk 
0A74  00        brk 
0A75  00        brk 
0A76  00        brk 
0A77  00        brk 
0A78  00        brk 
0A79  00        brk 
0A7A  00        brk 
0A7B  00        brk 
0A7C  00        brk 
0A7D  00        brk 
0A7E  00        brk 
0A7F  00        brk 
0A80  50 50     bvc $0AD2
0A82  50 50     bvc $0AD4
0A84  50 50     bvc $0AD6
0A86  50 50     bvc $0AD8
0A88  50 50     bvc $0ADA
0A8A  50 50     bvc $0ADC
0A8C  50 50     bvc $0ADE
0A8E  50 50     bvc $0AE0
0A90  50 50     bvc $0AE2
0A92  50 50     bvc $0AE4
0A94  50 50     bvc $0AE6
0A96  50 50     bvc $0AE8
0A98  50 50     bvc $0AEA
0A9A  50 50     bvc $0AEC
0A9C  50 50     bvc $0AEE
0A9E  50 50     bvc $0AF0
0AA0  50 50     bvc $0AF2
0AA2  50 50     bvc $0AF4
0AA4  50 50     bvc $0AF6
0AA6  50 50     bvc $0AF8
0AA8  50 50     bvc $0AFA
0AAA  50 50     bvc $0AFC
0AAC  50 50     bvc $0AFE
0AAE  50 50     bvc $0B00
0AB0  50 50     bvc $0B02
0AB2  50 50     bvc $0B04
0AB4  50 50     bvc $0B06
0AB6  50 50     bvc $0B08
0AB8  50 50     bvc $0B0A
0ABA  50 50     bvc $0B0C
0ABC  50 50     bvc $0B0E
0ABE  50 50     bvc $0B10
0AC0  50 50     bvc $0B12
0AC2  50 50     bvc $0B14
0AC4  50 50     bvc $0B16
0AC6  50 50     bvc $0B18
0AC8  50 50     bvc $0B1A
0ACA  50 50     bvc $0B1C
0ACC  50 50     bvc $0B1E
0ACE  50 50     bvc $0B20
0AD0  50 50     bvc $0B22
0AD2  50 50     bvc $0B24
0AD4  50 50     bvc $0B26
0AD6  50 50     bvc $0B28
0AD8  50 50     bvc $0B2A
0ADA  50 50     bvc $0B2C
0ADC  50 50     bvc $0B2E
0ADE  50 50     bvc $0B30
0AE0  50 50     bvc $0B32
0AE2  50 50     bvc $0B34
0AE4  50 50     bvc $0B36
0AE6  50 50     bvc $0B38
0AE8  50 50     bvc $0B3A
0AEA  50 50     bvc $0B3C
0AEC  50 50     bvc $0B3E
0AEE  50 50     bvc $0B40
0AF0  50 50     bvc $0B42
0AF2  50 50     bvc $0B44
0AF4  50 50     bvc $0B46
0AF6  50 00     bvc $0AF8
0AF8  00        brk 
0AF9  00        brk 
0AFA  00        brk 
0AFB  00        brk 
0AFC  00        brk 
0AFD  00        brk 
0AFE  00        brk 
0AFF  00        brk 
0B00  00        brk 
0B01  00        brk 
0B02  08        php 
0B03  08        php 
0B04  10 10     bpl $0B16
0B06  18        clc 
0B07  18        clc 
0B08  20 20 28  jsr $2820
0B0B  28        plp 
0B0C  30 30     bmi $0B3E
0B0E  38        sec 
0B0F  38        sec 
0B10  40        rti 
0B11  40        rti 
0B12  48        pha 
0B13  48        pha 
0B14  50 50     bvc $0B66
0B16  58        cli 
0B17  58        cli 
0B18  60        rts 
0B19  60        rts 
0B1A  68        pla 
0B1B  68        pla 
0B1C  70 70     bvs $0B8E
0B1E  78        sei 
0B1F  78        sei 
0B20  80        .byte $80
0B21  80        .byte $80
0B22  88        dey 
0B23  88        dey 
0B24  90 90     bcc $0AB6
0B26  98        tya 
0B27  98        tya 
0B28  A0 A0     ldy #$A0
0B2A  A8        tay 
0B2B  A8        tay 
0B2C  B0 B0     bcs $0ADE
0B2E  B8        clv 
0B2F  B8        clv 
0B30  C0 C0     cpy #$C0
0B32  C8        iny 
0B33  C8        iny 
0B34  D0 D0     bne $0B06
0B36  D8        cld 
0B37  D8        cld 
0B38  E0 E0     cpx #$E0
0B3A  E8        inx 
0B3B  E8        inx 
0B3C  F0 F0     beq $0B2E
0B3E  F8        sed 
0B3F  F8        sed 
0B40  00        brk 
0B41  00        brk 
0B42  08        php 
0B43  08        php 
0B44  10 10     bpl $0B56
0B46  18        clc 
0B47  18        clc 
0B48  20 20 28  jsr $2820
0B4B  28        plp 
0B4C  30 30     bmi $0B7E
0B4E  38        sec 
0B4F  38        sec 
0B50  00        brk 
0B51  00        brk 
0B52  00        brk 
0B53  00        brk 
0B54  00        brk 
0B55  00        brk 
0B56  00        brk 
0B57  00        brk 
0B58  00        brk 
0B59  00        brk 
0B5A  00        brk 
0B5B  00        brk 
0B5C  00        brk 
0B5D  00        brk 
0B5E  00        brk 
0B5F  00        brk 
0B60  00        brk 
0B61  00        brk 
0B62  00        brk 
0B63  00        brk 
0B64  00        brk 
0B65  00        brk 
0B66  00        brk 
0B67  00        brk 
0B68  00        brk 
0B69  00        brk 
0B6A  00        brk 
0B6B  00        brk 
0B6C  00        brk 
0B6D  00        brk 
0B6E  00        brk 
0B6F  00        brk 
0B70  00        brk 
0B71  00        brk 
0B72  00        brk 
0B73  00        brk 
0B74  00        brk 
0B75  00        brk 
0B76  00        brk 
0B77  00        brk 
0B78  00        brk 
0B79  00        brk 
0B7A  00        brk 
0B7B  00        brk 
0B7C  00        brk 
0B7D  00        brk 
0B7E  00        brk 
0B7F  00        brk 
0B80  00        brk 
0B81  00        brk 
0B82  00        brk 
0B83  00        brk 
0B84  00        brk 
0B85  00        brk 
0B86  00        brk 
0B87  00        brk 
0B88  00        brk 
0B89  00        brk 
0B8A  00        brk 
0B8B  00        brk 
0B8C  00        brk 
0B8D  00        brk 
0B8E  00        brk 
0B8F  00        brk 
0B90  01 01     ora ($01,x)
0B92  01 01     ora ($01,x)
0B94  01 01     ora ($01,x)
0B96  01 01     ora ($01,x)
0B98  01 01     ora ($01,x)
0B9A  01 01     ora ($01,x)
0B9C  01 01     ora ($01,x)
0B9E  01 01     ora ($01,x)
0BA0  A0 0A     ldy #$0A
0BA2  A0 0A     ldy #$0A
0BA4  A0 0A     ldy #$0A
0BA6  A0 0A     ldy #$0A
0BA8  A0 0A     ldy #$0A
0BAA  A0 0A     ldy #$0A
0BAC  A0 0A     ldy #$0A
0BAE  A0 0A     ldy #$0A
0BB0  A0 0A     ldy #$0A
0BB2  A0 0A     ldy #$0A
0BB4  A0 0A     ldy #$0A
0BB6  A0 0A     ldy #$0A
0BB8  A0 0A     ldy #$0A
0BBA  A0 0A     ldy #$0A
0BBC  A0 0A     ldy #$0A
0BBE  A0 0A     ldy #$0A
0BC0  A0 0A     ldy #$0A
0BC2  A0 0A     ldy #$0A
0BC4  A0 0A     ldy #$0A
0BC6  A0 0A     ldy #$0A
0BC8  A0 0A     ldy #$0A
0BCA  A0 0A     ldy #$0A
0BCC  A0 0A     ldy #$0A
0BCE  A0 0A     ldy #$0A
0BD0  A0 0A     ldy #$0A
0BD2  A0 0A     ldy #$0A
0BD4  A0 0A     ldy #$0A
0BD6  A0 0A     ldy #$0A
0BD8  A0 0A     ldy #$0A
0BDA  A0 0A     ldy #$0A
0BDC  A0 0A     ldy #$0A
0BDE  A0 0A     ldy #$0A
0BE0  A0 0A     ldy #$0A
0BE2  A0 0A     ldy #$0A
0BE4  A0 0A     ldy #$0A
0BE6  A0 0A     ldy #$0A
0BE8  A0 0A     ldy #$0A
0BEA  A0 0A     ldy #$0A
0BEC  A0 0A     ldy #$0A
0BEE  A0 0A     ldy #$0A
0BF0  00        brk 
0BF1  00        brk 
0BF2  00        brk 
0BF3  00        brk 
0BF4  00        brk 
0BF5  00        brk 
0BF6  00        brk 
0BF7  00        brk 
0BF8  00        brk 
0BF9  00        brk 
0BFA  00        brk 
0BFB  00        brk 
0BFC  00        brk 
0BFD  00        brk 
0BFE  00        brk 
0BFF  00        brk 
0C00  00        brk 
0C01  FF        .byte $FF
0C02  05 08     ora $08
0C04  01 F0     ora ($F0,x)
0C06  2A        rol a
0C07  07        .byte $07
0C08  08        php 
0C09  01 F0     ora ($F0,x)
0C0B  FF        .byte $FF
0C0C  00        brk 
0C0D  27        .byte $27
0C0E  03        .byte $03
0C0F  54        .byte $54
0C10  00        brk 
0C11  F0 26     beq $0C39
0C13  07        .byte $07
0C14  54        .byte $54
0C15  00        brk 
0C16  F0 FF     beq $0C17
0C18  00        brk 
0C19  22        .byte $22
0C1A  05 A4     ora $A4
0C1C  00        brk 
0C1D  F0 FF     beq $0C1E
0C1F  05 F0     ora $F0
0C21  00        brk 
0C22  F0 28     beq $0C4C
0C24  05 F0     ora $F0
0C26  00        brk 
0C27  F0 FF     beq $0C28
0C29  00        brk 
0C2A  00        brk 
0C2B  00        brk 
0C2C  00        brk 
0C2D  00        brk 
0C2E  00        brk 
0C2F  00        brk 
0C30  00        brk 
0C31  00        brk 
0C32  00        brk 
0C33  00        brk 
0C34  00        brk 
0C35  00        brk 
0C36  00        brk 
0C37  00        brk 
0C38  00        brk 
0C39  00        brk 
0C3A  00        brk 
0C3B  00        brk 
0C3C  00        brk 
0C3D  00        brk 
0C3E  00        brk 
0C3F  00        brk 
0C40  00        brk 
0C41  00        brk 
0C42  00        brk 
0C43  00        brk 
0C44  00        brk 
0C45  00        brk 
0C46  00        brk 
0C47  00        brk 
0C48  00        brk 
0C49  00        brk 
0C4A  00        brk 
0C4B  00        brk 
0C4C  00        brk 
0C4D  00        brk 
0C4E  00        brk 
0C4F  00        brk 
0C50  00        brk 
0C51  00        brk 
0C52  00        brk 
0C53  00        brk 
0C54  00        brk 
0C55  00        brk 
0C56  00        brk 
0C57  00        brk 
0C58  00        brk 
0C59  00        brk 
0C5A  00        brk 
0C5B  00        brk 
0C5C  00        brk 
0C5D  00        brk 
0C5E  00        brk 
0C5F  00        brk 
0C60  00        brk 
0C61  00        brk 
0C62  00        brk 
0C63  00        brk 
0C64  00        brk 
0C65  00        brk 
0C66  00        brk 
0C67  00        brk 
0C68  00        brk 
0C69  00        brk 
0C6A  00        brk 
0C6B  00        brk 
0C6C  00        brk 
0C6D  00        brk 
0C6E  00        brk 
0C6F  00        brk 
0C70  00        brk 
0C71  00        brk 
0C72  00        brk 
0C73  00        brk 
0C74  00        brk 
0C75  00        brk 
0C76  00        brk 
0C77  00        brk 
0C78  00        brk 
0C79  00        brk 
0C7A  00        brk 
0C7B  00        brk 
0C7C  00        brk 
0C7D  00        brk 
0C7E  00        brk 
0C7F  00        brk 
0C80  00        brk 
0C81  00        brk 
0C82  00        brk 
0C83  00        brk 
0C84  00        brk 
0C85  00        brk 
0C86  00        brk 
0C87  00        brk 
0C88  00        brk 
0C89  00        brk 
0C8A  00        brk 
0C8B  00        brk 
0C8C  00        brk 
0C8D  00        brk 
0C8E  00        brk 
0C8F  00        brk 
0C90  00        brk 
0C91  00        brk 
0C92  00        brk 
0C93  00        brk 
0C94  00        brk 
0C95  00        brk 
0C96  00        brk 
0C97  00        brk 
0C98  00        brk 
0C99  00        brk 
0C9A  00        brk 
0C9B  00        brk 
0C9C  00        brk 
0C9D  00        brk 
0C9E  00        brk 
0C9F  00        brk 
0CA0  00        brk 
0CA1  00        brk 
0CA2  00        brk 
0CA3  00        brk 
0CA4  00        brk 
0CA5  00        brk 
0CA6  00        brk 
0CA7  00        brk 
0CA8  00        brk 
0CA9  00        brk 
0CAA  00        brk 
0CAB  00        brk 
0CAC  00        brk 
0CAD  00        brk 
0CAE  00        brk 
0CAF  00        brk 
0CB0  00        brk 
0CB1  00        brk 
0CB2  00        brk 
0CB3  00        brk 
0CB4  00        brk 
0CB5  00        brk 
0CB6  00        brk 
0CB7  00        brk 
0CB8  00        brk 
0CB9  00        brk 
0CBA  00        brk 
0CBB  00        brk 
0CBC  00        brk 
0CBD  00        brk 
0CBE  00        brk 
0CBF  00        brk 
0CC0  00        brk 
0CC1  00        brk 
0CC2  00        brk 
0CC3  00        brk 
0CC4  00        brk 
0CC5  00        brk 
0CC6  00        brk 
0CC7  00        brk 
0CC8  00        brk 
0CC9  00        brk 
0CCA  00        brk 
0CCB  00        brk 
0CCC  00        brk 
0CCD  00        brk 
0CCE  00        brk 
0CCF  00        brk 
0CD0  00        brk 
0CD1  00        brk 
0CD2  00        brk 
0CD3  00        brk 
0CD4  00        brk 
0CD5  00        brk 
0CD6  00        brk 
0CD7  00        brk 
0CD8  00        brk 
0CD9  00        brk 
0CDA  00        brk 
0CDB  00        brk 
0CDC  00        brk 
0CDD  00        brk 
0CDE  00        brk 
0CDF  00        brk 
0CE0  00        brk 
0CE1  00        brk 
0CE2  00        brk 
0CE3  00        brk 
0CE4  00        brk 
0CE5  00        brk 
0CE6  00        brk 
0CE7  00        brk 
0CE8  00        brk 
0CE9  00        brk 
0CEA  00        brk 
0CEB  00        brk 
0CEC  00        brk 
0CED  00        brk 
0CEE  00        brk 
0CEF  00        brk 
0CF0  00        brk 
0CF1  00        brk 
0CF2  00        brk 
0CF3  00        brk 
0CF4  00        brk 
0CF5  00        brk 
0CF6  00        brk 
0CF7  00        brk 
0CF8  00        brk 
0CF9  00        brk 
0CFA  00        brk 
0CFB  00        brk 
0CFC  00        brk 
0CFD  00        brk 
0CFE  00        brk 
0CFF  00        brk 
0D00  00        brk 
0D01  FF        .byte $FF
0D02  05 08     ora $08
0D04  01 F0     ora ($F0,x)
0D06  2A        rol a
0D07  07        .byte $07
0D08  08        php 
0D09  01 F0     ora ($F0,x)
0D0B  FF        .byte $FF
0D0C  00        brk 
0D0D  27        .byte $27
0D0E  03        .byte $03
0D0F  54        .byte $54
0D10  00        brk 
0D11  F0 26     beq $0D39
0D13  07        .byte $07
0D14  54        .byte $54
0D15  00        brk 
0D16  F0 FF     beq $0D17
0D18  00        brk 
0D19  22        .byte $22
0D1A  05 A4     ora $A4
0D1C  00        brk 
0D1D  F0 FF     beq $0D1E
0D1F  05 F0     ora $F0
0D21  00        brk 
0D22  F0 28     beq $0D4C
0D24  05 F0     ora $F0
0D26  00        brk 
0D27  F0 FF     beq $0D28
0D29  00        brk 
0D2A  00        brk 
0D2B  00        brk 
0D2C  00        brk 
0D2D  00        brk 
0D2E  00        brk 
0D2F  00        brk 
0D30  00        brk 
0D31  00        brk 
0D32  00        brk 
0D33  00        brk 
0D34  00        brk 
0D35  00        brk 
0D36  00        brk 
0D37  00        brk 
0D38  00        brk 
0D39  00        brk 
0D3A  00        brk 
0D3B  00        brk 
0D3C  00        brk 
0D3D  00        brk 
0D3E  00        brk 
0D3F  00        brk 
0D40  00        brk 
0D41  00        brk 
0D42  00        brk 
0D43  00        brk 
0D44  00        brk 
0D45  00        brk 
0D46  00        brk 
0D47  00        brk 
0D48  00        brk 
0D49  00        brk 
0D4A  00        brk 
0D4B  00        brk 
0D4C  00        brk 
0D4D  00        brk 
0D4E  00        brk 
0D4F  00        brk 
0D50  00        brk 
0D51  00        brk 
0D52  00        brk 
0D53  00        brk 
0D54  00        brk 
0D55  00        brk 
0D56  00        brk 
0D57  00        brk 
0D58  00        brk 
0D59  00        brk 
0D5A  00        brk 
0D5B  00        brk 
0D5C  00        brk 
0D5D  00        brk 
0D5E  00        brk 
0D5F  00        brk 
0D60  00        brk 
0D61  00        brk 
0D62  00        brk 
0D63  00        brk 
0D64  00        brk 
0D65  00        brk 
0D66  00        brk 
0D67  00        brk 
0D68  00        brk 
0D69  00        brk 
0D6A  00        brk 
0D6B  00        brk 
0D6C  00        brk 
0D6D  00        brk 
0D6E  00        brk 
0D6F  00        brk 
0D70  00        brk 
0D71  00        brk 
0D72  00        brk 
0D73  00        brk 
0D74  00        brk 
0D75  00        brk 
0D76  00        brk 
0D77  00        brk 
0D78  00        brk 
0D79  00        brk 
0D7A  00        brk 
0D7B  00        brk 
0D7C  00        brk 
0D7D  00        brk 
0D7E  00        brk 
0D7F  00        brk 
0D80  00        brk 
0D81  00        brk 
0D82  00        brk 
0D83  00        brk 
0D84  00        brk 
0D85  00        brk 
0D86  00        brk 
0D87  00        brk 
0D88  00        brk 
0D89  00        brk 
0D8A  00        brk 
0D8B  00        brk 
0D8C  00        brk 
0D8D  00        brk 
0D8E  00        brk 
0D8F  00        brk 
0D90  00        brk 
0D91  00        brk 
0D92  00        brk 
0D93  00        brk 
0D94  00        brk 
0D95  00        brk 
0D96  00        brk 
0D97  00        brk 
0D98  00        brk 
0D99  00        brk 
0D9A  00        brk 
0D9B  00        brk 
0D9C  00        brk 
0D9D  00        brk 
0D9E  00        brk 
0D9F  00        brk 
0DA0  00        brk 
0DA1  00        brk 
0DA2  00        brk 
0DA3  00        brk 
0DA4  00        brk 
0DA5  00        brk 
0DA6  00        brk 
0DA7  00        brk 
0DA8  00        brk 
0DA9  00        brk 
0DAA  00        brk 
0DAB  00        brk 
0DAC  00        brk 
0DAD  00        brk 
0DAE  00        brk 
0DAF  00        brk 
0DB0  00        brk 
0DB1  00        brk 
0DB2  00        brk 
0DB3  00        brk 
0DB4  00        brk 
0DB5  00        brk 
0DB6  00        brk 
0DB7  00        brk 
0DB8  00        brk 
0DB9  00        brk 
0DBA  00        brk 
0DBB  00        brk 
0DBC  00        brk 
0DBD  00        brk 
0DBE  00        brk 
0DBF  00        brk 
0DC0  00        brk 
0DC1  00        brk 
0DC2  00        brk 
0DC3  00        brk 
0DC4  00        brk 
0DC5  00        brk 
0DC6  00        brk 
0DC7  00        brk 
0DC8  00        brk 
0DC9  00        brk 
0DCA  00        brk 
0DCB  00        brk 
0DCC  00        brk 
0DCD  00        brk 
0DCE  00        brk 
0DCF  00        brk 
0DD0  00        brk 
0DD1  00        brk 
0DD2  00        brk 
0DD3  00        brk 
0DD4  00        brk 
0DD5  00        brk 
0DD6  00        brk 
0DD7  00        brk 
0DD8  00        brk 
0DD9  00        brk 
0DDA  00        brk 
0DDB  00        brk 
0DDC  00        brk 
0DDD  00        brk 
0DDE  00        brk 
0DDF  00        brk 
0DE0  00        brk 
0DE1  00        brk 
0DE2  00        brk 
0DE3  00        brk 
0DE4  00        brk 
0DE5  00        brk 
0DE6  00        brk 
0DE7  00        brk 
0DE8  00        brk 
0DE9  00        brk 
0DEA  00        brk 
0DEB  00        brk 
0DEC  00        brk 
0DED  00        brk 
0DEE  00        brk 
0DEF  00        brk 
0DF0  00        brk 
0DF1  00        brk 
0DF2  00        brk 
0DF3  00        brk 
0DF4  00        brk 
0DF5  00        brk 
0DF6  00        brk 
0DF7  00        brk 
0DF8  00        brk 
0DF9  00        brk 
0DFA  00        brk 
0DFB  00        brk 
0DFC  00        brk 
0DFD  00        brk 
0DFE  00        brk 
0DFF  00        brk 
0E00  31 02     and ($02),y
0E02  00        brk 
0E03  3F        .byte $3F
0E04  03        .byte $03
0E05  00        brk 
0E06  B8        clv 
0E07  04        .byte $04
0E08  00        brk 
0E09  FF        .byte $FF
0E0A  00        brk 
0E0B  FF        .byte $FF
0E0C  FF        .byte $FF
0E0D  00        brk 
0E0E  FF        .byte $FF
0E0F  FF        .byte $FF
0E10  00        brk 
0E11  FF        .byte $FF
0E12  00        brk 
0E13  00        brk 
0E14  00        brk 
0E15  00        brk 
0E16  00        brk 
0E17  00        brk 
0E18  00        brk 
0E19  00        brk 
0E1A  00        brk 
0E1B  00        brk 
0E1C  00        brk 
0E1D  00        brk 
0E1E  00        brk 
0E1F  00        brk 
0E20  00        brk 
0E21  00        brk 
0E22  00        brk 
0E23  00        brk 
0E24  00        brk 
0E25  00        brk 
0E26  00        brk 
0E27  00        brk 
0E28  00        brk 
0E29  00        brk 
0E2A  00        brk 
0E2B  00        brk 
0E2C  00        brk 
0E2D  00        brk 
0E2E  00        brk 
0E2F  00        brk 
0E30  00        brk 
0E31  00        brk 
0E32  00        brk 
0E33  00        brk 
0E34  00        brk 
0E35  00        brk 
0E36  00        brk 
0E37  00        brk 
0E38  00        brk 
0E39  00        brk 
0E3A  00        brk 
0E3B  00        brk 
0E3C  00        brk 
0E3D  00        brk 
0E3E  00        brk 
0E3F  00        brk 
0E40  00        brk 
0E41  00        brk 
0E42  00        brk 
0E43  00        brk 
0E44  00        brk 
0E45  00        brk 
0E46  00        brk 
0E47  00        brk 
0E48  00        brk 
0E49  00        brk 
0E4A  00        brk 
0E4B  00        brk 
0E4C  00        brk 
0E4D  00        brk 
0E4E  00        brk 
0E4F  00        brk 
0E50  00        brk 
0E51  00        brk 
0E52  00        brk 
0E53  00        brk 
0E54  00        brk 
0E55  00        brk 
0E56  00        brk 
0E57  00        brk 
0E58  00        brk 
0E59  00        brk 
0E5A  00        brk 
0E5B  00        brk 
0E5C  00        brk 
0E5D  00        brk 
0E5E  00        brk 
0E5F  00        brk 
0E60  00        brk 
0E61  00        brk 
0E62  00        brk 
0E63  00        brk 
0E64  00        brk 
0E65  00        brk 
0E66  00        brk 
0E67  00        brk 
0E68  00        brk 
0E69  00        brk 
0E6A  00        brk 
0E6B  00        brk 
0E6C  00        brk 
0E6D  00        brk 
0E6E  00        brk 
0E6F  00        brk 
0E70  00        brk 
0E71  00        brk 
0E72  00        brk 
0E73  00        brk 
0E74  00        brk 
0E75  00        brk 
0E76  00        brk 
0E77  00        brk 
0E78  00        brk 
0E79  00        brk 
0E7A  00        brk 
0E7B  00        brk 
0E7C  00        brk 
0E7D  00        brk 
0E7E  00        brk 
0E7F  00        brk 
0E80  FF        .byte $FF
0E81  00        brk 
0E82  FF        .byte $FF
0E83  FF        .byte $FF
0E84  00        brk 
0E85  FF        .byte $FF
0E86  FF        .byte $FF
0E87  00        brk 
0E88  FF        .byte $FF
0E89  00        brk 
0E8A  00        brk 
0E8B  00        brk 
0E8C  00        brk 
0E8D  00        brk 
0E8E  00        brk 
0E8F  00        brk 
0E90  00        brk 
0E91  00        brk 
0E92  00        brk 
0E93  00        brk 
0E94  00        brk 
0E95  00        brk 
0E96  00        brk 
0E97  00        brk 
0E98  00        brk 
0E99  00        brk 
0E9A  00        brk 
0E9B  00        brk 
0E9C  00        brk 
0E9D  00        brk 
0E9E  00        brk 
0E9F  00        brk 
0EA0  00        brk 
0EA1  00        brk 
0EA2  00        brk 
0EA3  00        brk 
0EA4  00        brk 
0EA5  00        brk 
0EA6  00        brk 
0EA7  00        brk 
0EA8  00        brk 
0EA9  00        brk 
0EAA  00        brk 
0EAB  00        brk 
0EAC  00        brk 
0EAD  00        brk 
0EAE  00        brk 
0EAF  00        brk 
0EB0  00        brk 
0EB1  00        brk 
0EB2  00        brk 
0EB3  00        brk 
0EB4  00        brk 
0EB5  00        brk 
0EB6  00        brk 
0EB7  00        brk 
0EB8  00        brk 
0EB9  00        brk 
0EBA  00        brk 
0EBB  00        brk 
0EBC  00        brk 
0EBD  00        brk 
0EBE  00        brk 
0EBF  00        brk 
0EC0  00        brk 
0EC1  00        brk 
0EC2  00        brk 
0EC3  00        brk 
0EC4  00        brk 
0EC5  00        brk 
0EC6  00        brk 
0EC7  00        brk 
0EC8  00        brk 
0EC9  00        brk 
0ECA  00        brk 
0ECB  00        brk 
0ECC  00        brk 
0ECD  00        brk 
0ECE  00        brk 
0ECF  00        brk 
0ED0  00        brk 
0ED1  00        brk 
0ED2  00        brk 
0ED3  00        brk 
0ED4  00        brk 
0ED5  00        brk 
0ED6  00        brk 
0ED7  00        brk 
0ED8  00        brk 
0ED9  00        brk 
0EDA  00        brk 
0EDB  00        brk 
0EDC  00        brk 
0EDD  00        brk 
0EDE  00        brk 
0EDF  00        brk 
0EE0  00        brk 
0EE1  00        brk 
0EE2  00        brk 
0EE3  00        brk 
0EE4  00        brk 
0EE5  00        brk 
0EE6  00        brk 
0EE7  00        brk 
0EE8  00        brk 
0EE9  00        brk 
0EEA  00        brk 
0EEB  00        brk 
0EEC  00        brk 
0EED  00        brk 
0EEE  00        brk 
0EEF  00        brk 
0EF0  00        brk 
0EF1  00        brk 
0EF2  00        brk 
0EF3  00        brk 
0EF4  00        brk 
0EF5  00        brk 
0EF6  00        brk 
0EF7  00        brk 
0EF8  00        brk 
0EF9  00        brk 
0EFA  00        brk 
0EFB  00        brk 
0EFC  00        brk 
0EFD  00        brk 
0EFE  00        brk 
0EFF  00        brk 
0F00  FF        .byte $FF
0F01  07        .byte $07
0F02  08        php 
0F03  01 F0     ora ($F0,x)
0F05  2B        .byte $2B
0F06  05 08     ora $08
0F08  01 F0     ora ($F0,x)
0F0A  FF        .byte $FF
0F0B  07        .byte $07
0F0C  54        .byte $54
0F0D  00        brk 
0F0E  F0 27     beq $0F37
0F10  03        .byte $03
0F11  54        .byte $54
0F12  00        brk 
0F13  F0 FF     beq $0F14
0F15  05 A4     ora $A4
0F17  00        brk 
0F18  F0 FF     beq $0F19
0F1A  03        .byte $03
0F1B  6C 00 DC  jmp ($DC00)
0F1E  22        .byte $22
0F1F  05 A8     ora $A8
0F21  00        brk 
0F22  EC FF 00  cpx $00FF
0F25  00        brk 
0F26  00        brk 
0F27  00        brk 
0F28  00        brk 
0F29  00        brk 
0F2A  00        brk 
0F2B  00        brk 
0F2C  00        brk 
0F2D  00        brk 
0F2E  00        brk 
0F2F  00        brk 
0F30  00        brk 
0F31  00        brk 
0F32  00        brk 
0F33  00        brk 
0F34  00        brk 
0F35  00        brk 
0F36  00        brk 
0F37  00        brk 
0F38  00        brk 
0F39  00        brk 
0F3A  00        brk 
0F3B  00        brk 
0F3C  00        brk 
0F3D  00        brk 
0F3E  00        brk 
0F3F  00        brk 
0F40  00        brk 
0F41  00        brk 
0F42  00        brk 
0F43  00        brk 
0F44  00        brk 
0F45  00        brk 
0F46  00        brk 
0F47  00        brk 
0F48  00        brk 
0F49  00        brk 
0F4A  00        brk 
0F4B  00        brk 
0F4C  00        brk 
0F4D  00        brk 
0F4E  00        brk 
0F4F  00        brk 
0F50  00        brk 
0F51  00        brk 
0F52  00        brk 
0F53  00        brk 
0F54  00        brk 
0F55  00        brk 
0F56  00        brk 
0F57  00        brk 
0F58  00        brk 
0F59  00        brk 
0F5A  00        brk 
0F5B  00        brk 
0F5C  00        brk 
0F5D  00        brk 
0F5E  00        brk 
0F5F  00        brk 
0F60  00        brk 
0F61  00        brk 
0F62  00        brk 
0F63  00        brk 
0F64  00        brk 
0F65  00        brk 
0F66  00        brk 
0F67  00        brk 
0F68  00        brk 
0F69  00        brk 
0F6A  00        brk 
0F6B  00        brk 
0F6C  00        brk 
0F6D  00        brk 
0F6E  00        brk 
0F6F  00        brk 
0F70  00        brk 
0F71  00        brk 
0F72  00        brk 
0F73  00        brk 
0F74  00        brk 
0F75  00        brk 
0F76  00        brk 
0F77  00        brk 
0F78  00        brk 
0F79  00        brk 
0F7A  00        brk 
0F7B  00        brk 
0F7C  00        brk 
0F7D  00        brk 
0F7E  00        brk 
0F7F  00        brk 
0F80  00        brk 
0F81  00        brk 
0F82  00        brk 
0F83  00        brk 
0F84  00        brk 
0F85  00        brk 
0F86  00        brk 
0F87  00        brk 
0F88  00        brk 
0F89  00        brk 
0F8A  00        brk 
0F8B  00        brk 
0F8C  00        brk 
0F8D  00        brk 
0F8E  00        brk 
0F8F  00        brk 
0F90  00        brk 
0F91  00        brk 
0F92  00        brk 
0F93  00        brk 
0F94  00        brk 
0F95  00        brk 
0F96  00        brk 
0F97  00        brk 
0F98  00        brk 
0F99  00        brk 
0F9A  00        brk 
0F9B  00        brk 
0F9C  00        brk 
0F9D  00        brk 
0F9E  00        brk 
0F9F  00        brk 
0FA0  00        brk 
0FA1  00        brk 
0FA2  00        brk 
0FA3  00        brk 
0FA4  00        brk 
0FA5  00        brk 
0FA6  00        brk 
0FA7  00        brk 
0FA8  00        brk 
0FA9  00        brk 
0FAA  00        brk 
0FAB  00        brk 
0FAC  00        brk 
0FAD  00        brk 
0FAE  00        brk 
0FAF  00        brk 
0FB0  00        brk 
0FB1  00        brk 
0FB2  00        brk 
0FB3  00        brk 
0FB4  00        brk 
0FB5  00        brk 
0FB6  00        brk 
0FB7  00        brk 
0FB8  00        brk 
0FB9  00        brk 
0FBA  00        brk 
0FBB  00        brk 
0FBC  00        brk 
0FBD  00        brk 
0FBE  00        brk 
0FBF  00        brk 
0FC0  00        brk 
0FC1  00        brk 
0FC2  00        brk 
0FC3  00        brk 
0FC4  00        brk 
0FC5  00        brk 
0FC6  00        brk 
0FC7  00        brk 
0FC8  00        brk 
0FC9  00        brk 
0FCA  00        brk 
0FCB  00        brk 
0FCC  00        brk 
0FCD  00        brk 
0FCE  00        brk 
0FCF  00        brk 
0FD0  00        brk 
0FD1  00        brk 
0FD2  00        brk 
0FD3  00        brk 
0FD4  00        brk 
0FD5  00        brk 
0FD6  00        brk 
0FD7  00        brk 
0FD8  00        brk 
0FD9  00        brk 
0FDA  00        brk 
0FDB  00        brk 
0FDC  00        brk 
0FDD  00        brk 
0FDE  00        brk 
0FDF  00        brk 
0FE0  00        brk 
0FE1  00        brk 
0FE2  00        brk 
0FE3  00        brk 
0FE4  00        brk 
0FE5  00        brk 
0FE6  00        brk 
0FE7  00        brk 
0FE8  00        brk 
0FE9  00        brk 
0FEA  00        brk 
0FEB  00        brk 
0FEC  00        brk 
0FED  00        brk 
0FEE  00        brk 
0FEF  00        brk 
0FF0  00        brk 
0FF1  00        brk 
0FF2  00        brk 
0FF3  00        brk 
0FF4  00        brk 
0FF5  00        brk 
0FF6  00        brk 
0FF7  00        brk 
0FF8  00        brk 
0FF9  00        brk 
0FFA  00        brk 
0FFB  00        brk 
0FFC  00        brk 
0FFD  00        brk 
0FFE  00        brk 
0FFF  00        brk 
1000  00        brk 
1001  00        brk 
1002  00        brk 
1003  00        brk 
1004  00        brk 
1005  00        brk 
1006  00        brk 
1007  00        brk 
1008  00        brk 
1009  00        brk 
100A  00        brk 
100B  00        brk 
100C  00        brk 
100D  00        brk 
100E  00        brk 
100F  00        brk 
1010  00        brk 
1011  00        brk 
1012  00        brk 
1013  00        brk 
1014  00        brk 
1015  00        brk 
1016  00        brk 
1017  00        brk 
1018  00        brk 
1019  00        brk 
101A  00        brk 
101B  00        brk 
101C  00        brk 
101D  00        brk 
101E  00        brk 
101F  00        brk 
1020  00        brk 
1021  00        brk 
1022  00        brk 
1023  00        brk 
1024  00        brk 
1025  00        brk 
1026  00        brk 
1027  00        brk 
1028  00        brk 
1029  00        brk 
102A  00        brk 
102B  00        brk 
102C  00        brk 
102D  00        brk 
102E  00        brk 
102F  00        brk 
1030  00        brk 
1031  00        brk 
1032  00        brk 
1033  00        brk 
1034  00        brk 
1035  00        brk 
1036  00        brk 
1037  00        brk 
1038  00        brk 
1039  00        brk 
103A  00        brk 
103B  00        brk 
103C  00        brk 
103D  00        brk 
103E  00        brk 
103F  00        brk 
1040  00        brk 
1041  00        brk 
1042  00        brk 
1043  00        brk 
1044  00        brk 
1045  00        brk 
1046  00        brk 
1047  00        brk 
1048  00        brk 
1049  00        brk 
104A  00        brk 
104B  00        brk 
104C  00        brk 
104D  00        brk 
104E  00        brk 
104F  00        brk 
1050  00        brk 
1051  00        brk 
1052  00        brk 
1053  00        brk 
1054  00        brk 
1055  00        brk 
1056  00        brk 
1057  00        brk 
1058  00        brk 
1059  00        brk 
105A  00        brk 
105B  00        brk 
105C  00        brk 
105D  00        brk 
105E  00        brk 
105F  00        brk 
1060  00        brk 
1061  00        brk 
1062  00        brk 
1063  00        brk 
1064  00        brk 
1065  00        brk 
1066  00        brk 
1067  00        brk 
1068  00        brk 
1069  00        brk 
106A  00        brk 
106B  00        brk 
106C  00        brk 
106D  00        brk 
106E  00        brk 
106F  00        brk 
1070  00        brk 
1071  00        brk 
1072  00        brk 
1073  00        brk 
1074  00        brk 
1075  00        brk 
1076  00        brk 
1077  00        brk 
1078  00        brk 
1079  00        brk 
107A  00        brk 
107B  00        brk 
107C  00        brk 
107D  00        brk 
107E  00        brk 
107F  00        brk 
1080  00        brk 
1081  00        brk 
1082  00        brk 
1083  00        brk 
1084  00        brk 
1085  00        brk 
1086  00        brk 
1087  00        brk 
1088  00        brk 
1089  00        brk 
108A  00        brk 
108B  00        brk 
108C  00        brk 
108D  00        brk 
108E  00        brk 
108F  00        brk 
1090  00        brk 
1091  00        brk 
1092  00        brk 
1093  00        brk 
1094  00        brk 
1095  00        brk 
1096  00        brk 
1097  00        brk 
1098  00        brk 
1099  00        brk 
109A  00        brk 
109B  00        brk 
109C  00        brk 
109D  00        brk 
109E  00        brk 
109F  00        brk 
10A0  00        brk 
10A1  00        brk 
10A2  00        brk 
10A3  00        brk 
10A4  00        brk 
10A5  00        brk 
10A6  00        brk 
10A7  00        brk 
10A8  00        brk 
10A9  00        brk 
10AA  00        brk 
10AB  00        brk 
10AC  00        brk 
10AD  00        brk 
10AE  00        brk 
10AF  00        brk 
10B0  00        brk 
10B1  00        brk 
10B2  00        brk 
10B3  00        brk 
10B4  00        brk 
10B5  00        brk 
10B6  00        brk 
10B7  00        brk 
10B8  00        brk 
10B9  00        brk 
10BA  00        brk 
10BB  00        brk 
10BC  00        brk 
10BD  00        brk 
10BE  00        brk 
10BF  00        brk 
10C0  00        brk 
10C1  00        brk 
10C2  00        brk 
10C3  00        brk 
10C4  00        brk 
10C5  00        brk 
10C6  00        brk 
10C7  00        brk 
10C8  00        brk 
10C9  00        brk 
10CA  00        brk 
10CB  00        brk 
10CC  00        brk 
10CD  00        brk 
10CE  00        brk 
10CF  00        brk 
10D0  00        brk 
10D1  00        brk 
10D2  00        brk 
10D3  00        brk 
10D4  00        brk 
10D5  00        brk 
10D6  00        brk 
10D7  00        brk 
10D8  00        brk 
10D9  00        brk 
10DA  00        brk 
10DB  00        brk 
10DC  00        brk 
10DD  00        brk 
10DE  00        brk 
10DF  00        brk 
10E0  00        brk 
10E1  00        brk 
10E2  00        brk 
10E3  00        brk 
10E4  00        brk 
10E5  00        brk 
10E6  00        brk 
10E7  00        brk 
10E8  00        brk 
10E9  00        brk 
10EA  00        brk 
10EB  00        brk 
10EC  00        brk 
10ED  00        brk 
10EE  00        brk 
10EF  00        brk 
10F0  00        brk 
10F1  00        brk 
10F2  00        brk 
10F3  00        brk 
10F4  00        brk 
10F5  00        brk 
10F6  00        brk 
10F7  00        brk 
10F8  00        brk 
10F9  00        brk 
10FA  00        brk 
10FB  00        brk 
10FC  00        brk 
10FD  00        brk 
10FE  00        brk 
10FF  00        brk 
1100  00        brk 
1101  00        brk 
1102  00        brk 
1103  00        brk 
1104  00        brk 
1105  00        brk 
1106  00        brk 
1107  00        brk 
1108  00        brk 
1109  00        brk 
110A  00        brk 
110B  00        brk 
110C  00        brk 
110D  00        brk 
110E  00        brk 
110F  00        brk 
1110  00        brk 
1111  00        brk 
1112  00        brk 
1113  00        brk 
1114  00        brk 
1115  00        brk 
1116  00        brk 
1117  00        brk 
1118  00        brk 
1119  00        brk 
111A  00        brk 
111B  00        brk 
111C  00        brk 
111D  00        brk 
111E  00        brk 
111F  00        brk 
1120  00        brk 
1121  00        brk 
1122  00        brk 
1123  00        brk 
1124  00        brk 
1125  00        brk 
1126  00        brk 
1127  00        brk 
1128  00        brk 
1129  00        brk 
112A  00        brk 
112B  00        brk 
112C  00        brk 
112D  00        brk 
112E  00        brk 
112F  00        brk 
1130  00        brk 
1131  00        brk 
1132  00        brk 
1133  00        brk 
1134  00        brk 
1135  00        brk 
1136  00        brk 
1137  00        brk 
1138  00        brk 
1139  00        brk 
113A  00        brk 
113B  00        brk 
113C  00        brk 
113D  00        brk 
113E  00        brk 
113F  00        brk 
1140  00        brk 
1141  00        brk 
1142  00        brk 
1143  00        brk 
1144  00        brk 
1145  00        brk 
1146  00        brk 
1147  00        brk 
1148  00        brk 
1149  00        brk 
114A  00        brk 
114B  00        brk 
114C  00        brk 
114D  00        brk 
114E  00        brk 
114F  00        brk 
1150  00        brk 
1151  00        brk 
1152  00        brk 
1153  00        brk 
1154  00        brk 
1155  00        brk 
1156  00        brk 
1157  00        brk 
1158  00        brk 
1159  00        brk 
115A  00        brk 
115B  00        brk 
115C  00        brk 
115D  00        brk 
115E  00        brk 
115F  00        brk 
1160  00        brk 
1161  00        brk 
1162  00        brk 
1163  00        brk 
1164  00        brk 
1165  00        brk 
1166  00        brk 
1167  00        brk 
1168  00        brk 
1169  00        brk 
116A  00        brk 
116B  00        brk 
116C  00        brk 
116D  00        brk 
116E  00        brk 
116F  00        brk 
1170  00        brk 
1171  00        brk 
1172  00        brk 
1173  00        brk 
1174  00        brk 
1175  00        brk 
1176  00        brk 
1177  00        brk 
1178  00        brk 
1179  00        brk 
117A  00        brk 
117B  00        brk 
117C  00        brk 
117D  00        brk 
117E  00        brk 
117F  00        brk 
1180  00        brk 
1181  00        brk 
1182  00        brk 
1183  00        brk 
1184  00        brk 
1185  00        brk 
1186  00        brk 
1187  00        brk 
1188  00        brk 
1189  00        brk 
118A  00        brk 
118B  00        brk 
118C  00        brk 
118D  00        brk 
118E  00        brk 
118F  00        brk 
1190  00        brk 
1191  00        brk 
1192  00        brk 
1193  00        brk 
1194  00        brk 
1195  00        brk 
1196  00        brk 
1197  00        brk 
1198  00        brk 
1199  00        brk 
119A  00        brk 
119B  00        brk 
119C  00        brk 
119D  00        brk 
119E  00        brk 
119F  00        brk 
11A0  00        brk 
11A1  00        brk 
11A2  00        brk 
11A3  00        brk 
11A4  00        brk 
11A5  00        brk 
11A6  00        brk 
11A7  00        brk 
11A8  00        brk 
11A9  00        brk 
11AA  00        brk 
11AB  00        brk 
11AC  00        brk 
11AD  00        brk 
11AE  00        brk 
11AF  00        brk 
11B0  00        brk 
11B1  00        brk 
11B2  00        brk 
11B3  00        brk 
11B4  00        brk 
11B5  00        brk 
11B6  00        brk 
11B7  00        brk 
11B8  00        brk 
11B9  00        brk 
11BA  00        brk 
11BB  00        brk 
11BC  00        brk 
11BD  00        brk 
11BE  00        brk 
11BF  00        brk 
11C0  00        brk 
11C1  00        brk 
11C2  00        brk 
11C3  00        brk 
11C4  00        brk 
11C5  00        brk 
11C6  00        brk 
11C7  00        brk 
11C8  00        brk 
11C9  00        brk 
11CA  00        brk 
11CB  00        brk 
11CC  00        brk 
11CD  00        brk 
11CE  00        brk 
11CF  00        brk 
11D0  00        brk 
11D1  00        brk 
11D2  00        brk 
11D3  00        brk 
11D4  00        brk 
11D5  00        brk 
11D6  00        brk 
11D7  00        brk 
11D8  00        brk 
11D9  00        brk 
11DA  00        brk 
11DB  00        brk 
11DC  00        brk 
11DD  00        brk 
11DE  00        brk 
11DF  00        brk 
11E0  00        brk 
11E1  00        brk 
11E2  00        brk 
11E3  00        brk 
11E4  00        brk 
11E5  00        brk 
11E6  00        brk 
11E7  00        brk 
11E8  00        brk 
11E9  00        brk 
11EA  00        brk 
11EB  00        brk 
11EC  00        brk 
11ED  00        brk 
11EE  00        brk 
11EF  00        brk 
11F0  00        brk 
11F1  00        brk 
11F2  00        brk 
11F3  00        brk 
11F4  00        brk 
11F5  00        brk 
11F6  00        brk 
11F7  00        brk 
11F8  00        brk 
11F9  00        brk 
11FA  00        brk 
11FB  00        brk 
11FC  00        brk 
11FD  00        brk 
11FE  00        brk 
11FF  00        brk 
1200  00        brk 
1201  00        brk 
1202  00        brk 
1203  00        brk 
1204  00        brk 
1205  00        brk 
1206  00        brk 
1207  00        brk 
1208  00        brk 
1209  00        brk 
120A  00        brk 
120B  00        brk 
120C  00        brk 
120D  00        brk 
120E  00        brk 
120F  00        brk 
1210  00        brk 
1211  00        brk 
1212  00        brk 
1213  00        brk 
1214  00        brk 
1215  00        brk 
1216  00        brk 
1217  00        brk 
1218  00        brk 
1219  00        brk 
121A  00        brk 
121B  00        brk 
121C  00        brk 
121D  00        brk 
121E  00        brk 
121F  00        brk 
1220  00        brk 
1221  00        brk 
1222  00        brk 
1223  00        brk 
1224  00        brk 
1225  00        brk 
1226  00        brk 
1227  00        brk 
1228  00        brk 
1229  00        brk 
122A  00        brk 
122B  00        brk 
122C  00        brk 
122D  00        brk 
122E  00        brk 
122F  00        brk 
1230  00        brk 
1231  00        brk 
1232  00        brk 
1233  00        brk 
1234  00        brk 
1235  00        brk 
1236  00        brk 
1237  00        brk 
1238  00        brk 
1239  00        brk 
123A  00        brk 
123B  00        brk 
123C  00        brk 
123D  00        brk 
123E  00        brk 
123F  00        brk 
1240  00        brk 
1241  00        brk 
1242  00        brk 
1243  00        brk 
1244  00        brk 
1245  00        brk 
1246  00        brk 
1247  00        brk 
1248  00        brk 
1249  00        brk 
124A  00        brk 
124B  00        brk 
124C  00        brk 
124D  00        brk 
124E  00        brk 
124F  00        brk 
1250  00        brk 
1251  00        brk 
1252  00        brk 
1253  00        brk 
1254  00        brk 
1255  00        brk 
1256  00        brk 
1257  00        brk 
1258  00        brk 
1259  00        brk 
125A  00        brk 
125B  00        brk 
125C  00        brk 
125D  00        brk 
125E  00        brk 
125F  00        brk 
1260  00        brk 
1261  00        brk 
1262  00        brk 
1263  00        brk 
1264  00        brk 
1265  00        brk 
1266  00        brk 
1267  00        brk 
1268  00        brk 
1269  00        brk 
126A  00        brk 
126B  00        brk 
126C  00        brk 
126D  00        brk 
126E  00        brk 
126F  00        brk 
1270  00        brk 
1271  00        brk 
1272  00        brk 
1273  00        brk 
1274  00        brk 
1275  00        brk 
1276  00        brk 
1277  00        brk 
1278  00        brk 
1279  00        brk 
127A  00        brk 
127B  00        brk 
127C  00        brk 
127D  00        brk 
127E  00        brk 
127F  00        brk 
1280  00        brk 
1281  00        brk 
1282  00        brk 
1283  00        brk 
1284  00        brk 
1285  00        brk 
1286  00        brk 
1287  00        brk 
1288  00        brk 
1289  00        brk 
128A  00        brk 
128B  00        brk 
128C  00        brk 
128D  00        brk 
128E  00        brk 
128F  00        brk 
1290  00        brk 
1291  00        brk 
1292  00        brk 
1293  00        brk 
1294  00        brk 
1295  00        brk 
1296  00        brk 
1297  00        brk 
1298  00        brk 
1299  00        brk 
129A  00        brk 
129B  00        brk 
129C  00        brk 
129D  00        brk 
129E  00        brk 
129F  00        brk 
12A0  00        brk 
12A1  00        brk 
12A2  00        brk 
12A3  00        brk 
12A4  00        brk 
12A5  00        brk 
12A6  00        brk 
12A7  00        brk 
12A8  00        brk 
12A9  00        brk 
12AA  00        brk 
12AB  00        brk 
12AC  00        brk 
12AD  00        brk 
12AE  00        brk 
12AF  00        brk 
12B0  00        brk 
12B1  00        brk 
12B2  00        brk 
12B3  00        brk 
12B4  00        brk 
12B5  00        brk 
12B6  00        brk 
12B7  00        brk 
12B8  00        brk 
12B9  00        brk 
12BA  00        brk 
12BB  00        brk 
12BC  00        brk 
12BD  00        brk 
12BE  00        brk 
12BF  00        brk 
12C0  00        brk 
12C1  00        brk 
12C2  00        brk 
12C3  00        brk 
12C4  00        brk 
12C5  00        brk 
12C6  00        brk 
12C7  00        brk 
12C8  00        brk 
12C9  00        brk 
12CA  00        brk 
12CB  00        brk 
12CC  00        brk 
12CD  00        brk 
12CE  00        brk 
12CF  00        brk 
12D0  00        brk 
12D1  00        brk 
12D2  00        brk 
12D3  00        brk 
12D4  00        brk 
12D5  00        brk 
12D6  00        brk 
12D7  00        brk 
12D8  00        brk 
12D9  00        brk 
12DA  00        brk 
12DB  00        brk 
12DC  00        brk 
12DD  00        brk 
12DE  00        brk 
12DF  00        brk 
12E0  00        brk 
12E1  00        brk 
12E2  00        brk 
12E3  00        brk 
12E4  00        brk 
12E5  00        brk 
12E6  00        brk 
12E7  00        brk 
12E8  00        brk 
12E9  00        brk 
12EA  00        brk 
12EB  00        brk 
12EC  00        brk 
12ED  00        brk 
12EE  00        brk 
12EF  00        brk 
12F0  00        brk 
12F1  00        brk 
12F2  00        brk 
12F3  00        brk 
12F4  00        brk 
12F5  00        brk 
12F6  00        brk 
12F7  00        brk 
12F8  00        brk 
12F9  00        brk 
12FA  00        brk 
12FB  00        brk 
12FC  00        brk 
12FD  00        brk 
12FE  00        brk 
12FF  00        brk 
1300  00        brk 
1301  00        brk 
1302  00        brk 
1303  00        brk 
1304  00        brk 
1305  00        brk 
1306  00        brk 
1307  00        brk 
1308  00        brk 
1309  00        brk 
130A  00        brk 
130B  00        brk 
130C  00        brk 
130D  00        brk 
130E  00        brk 
130F  00        brk 
1310  00        brk 
1311  00        brk 
1312  00        brk 
1313  00        brk 
1314  00        brk 
1315  00        brk 
1316  00        brk 
1317  00        brk 
1318  00        brk 
1319  00        brk 
131A  00        brk 
131B  00        brk 
131C  00        brk 
131D  00        brk 
131E  00        brk 
131F  00        brk 
1320  00        brk 
1321  00        brk 
1322  00        brk 
1323  00        brk 
1324  00        brk 
1325  00        brk 
1326  00        brk 
1327  00        brk 
1328  00        brk 
1329  00        brk 
132A  00        brk 
132B  00        brk 
132C  00        brk 
132D  00        brk 
132E  00        brk 
132F  00        brk 
1330  00        brk 
1331  00        brk 
1332  00        brk 
1333  00        brk 
1334  00        brk 
1335  00        brk 
1336  00        brk 
1337  00        brk 
1338  00        brk 
1339  00        brk 
133A  00        brk 
133B  00        brk 
133C  00        brk 
133D  00        brk 
133E  00        brk 
133F  00        brk 
1340  00        brk 
1341  00        brk 
1342  00        brk 
1343  00        brk 
1344  00        brk 
1345  00        brk 
1346  00        brk 
1347  00        brk 
1348  00        brk 
1349  00        brk 
134A  00        brk 
134B  00        brk 
134C  00        brk 
134D  00        brk 
134E  00        brk 
134F  00        brk 
1350  00        brk 
1351  00        brk 
1352  00        brk 
1353  00        brk 
1354  00        brk 
1355  00        brk 
1356  00        brk 
1357  00        brk 
1358  00        brk 
1359  00        brk 
135A  00        brk 
135B  00        brk 
135C  00        brk 
135D  00        brk 
135E  00        brk 
135F  00        brk 
1360  00        brk 
1361  00        brk 
1362  00        brk 
1363  00        brk 
1364  00        brk 
1365  00        brk 
1366  00        brk 
1367  00        brk 
1368  00        brk 
1369  00        brk 
136A  00        brk 
136B  00        brk 
136C  00        brk 
136D  00        brk 
136E  00        brk 
136F  00        brk 
1370  00        brk 
1371  00        brk 
1372  00        brk 
1373  00        brk 
1374  00        brk 
1375  00        brk 
1376  00        brk 
1377  00        brk 
1378  00        brk 
1379  00        brk 
137A  00        brk 
137B  00        brk 
137C  00        brk 
137D  00        brk 
137E  00        brk 
137F  00        brk 
1380  00        brk 
1381  00        brk 
1382  00        brk 
1383  00        brk 
1384  00        brk 
1385  00        brk 
1386  00        brk 
1387  00        brk 
1388  00        brk 
1389  00        brk 
138A  00        brk 
138B  00        brk 
138C  00        brk 
138D  00        brk 
138E  00        brk 
138F  00        brk 
1390  00        brk 
1391  00        brk 
1392  00        brk 
1393  00        brk 
1394  00        brk 
1395  00        brk 
1396  00        brk 
1397  00        brk 
1398  00        brk 
1399  00        brk 
139A  00        brk 
139B  00        brk 
139C  00        brk 
139D  00        brk 
139E  00        brk 
139F  00        brk 
13A0  00        brk 
13A1  00        brk 
13A2  00        brk 
13A3  00        brk 
13A4  00        brk 
13A5  00        brk 
13A6  00        brk 
13A7  00        brk 
13A8  00        brk 
13A9  00        brk 
13AA  00        brk 
13AB  00        brk 
13AC  00        brk 
13AD  00        brk 
13AE  00        brk 
13AF  00        brk 
13B0  00        brk 
13B1  00        brk 
13B2  00        brk 
13B3  00        brk 
13B4  00        brk 
13B5  00        brk 
13B6  00        brk 
13B7  00        brk 
13B8  00        brk 
13B9  00        brk 
13BA  00        brk 
13BB  00        brk 
13BC  00        brk 
13BD  00        brk 
13BE  00        brk 
13BF  00        brk 
13C0  00        brk 
13C1  00        brk 
13C2  00        brk 
13C3  00        brk 
13C4  00        brk 
13C5  00        brk 
13C6  00        brk 
13C7  00        brk 
13C8  00        brk 
13C9  00        brk 
13CA  00        brk 
13CB  00        brk 
13CC  00        brk 
13CD  00        brk 
13CE  00        brk 
13CF  00        brk 
13D0  00        brk 
13D1  00        brk 
13D2  00        brk 
13D3  00        brk 
13D4  00        brk 
13D5  00        brk 
13D6  00        brk 
13D7  00        brk 
13D8  00        brk 
13D9  00        brk 
13DA  00        brk 
13DB  00        brk 
13DC  00        brk 
13DD  00        brk 
13DE  00        brk 
13DF  00        brk 
13E0  00        brk 
13E1  00        brk 
13E2  00        brk 
13E3  00        brk 
13E4  00        brk 
13E5  00        brk 
13E6  00        brk 
13E7  00        brk 
13E8  00        brk 
13E9  00        brk 
13EA  00        brk 
13EB  00        brk 
13EC  00        brk 
13ED  00        brk 
13EE  00        brk 
13EF  00        brk 
13F0  00        brk 
13F1  00        brk 
13F2  00        brk 
13F3  00        brk 
13F4  00        brk 
13F5  00        brk 
13F6  00        brk 
13F7  00        brk 
13F8  00        brk 
13F9  00        brk 
13FA  00        brk 
13FB  00        brk 
13FC  00        brk 
13FD  00        brk 
13FE  00        brk 
13FF  00        brk 
1400  00        brk 
1401  00        brk 
1402  00        brk 
1403  00        brk 
1404  00        brk 
1405  00        brk 
1406  00        brk 
1407  00        brk 
1408  00        brk 
1409  00        brk 
140A  00        brk 
140B  00        brk 
140C  00        brk 
140D  00        brk 
140E  00        brk 
140F  00        brk 
1410  00        brk 
1411  00        brk 
1412  00        brk 
1413  00        brk 
1414  00        brk 
1415  00        brk 
1416  00        brk 
1417  00        brk 
1418  00        brk 
1419  00        brk 
141A  00        brk 
141B  00        brk 
141C  00        brk 
141D  00        brk 
141E  00        brk 
141F  00        brk 
1420  00        brk 
1421  00        brk 
1422  00        brk 
1423  00        brk 
1424  00        brk 
1425  00        brk 
1426  00        brk 
1427  00        brk 
1428  00        brk 
1429  00        brk 
142A  00        brk 
142B  00        brk 
142C  00        brk 
142D  00        brk 
142E  00        brk 
142F  00        brk 
1430  00        brk 
1431  00        brk 
1432  00        brk 
1433  00        brk 
1434  00        brk 
1435  00        brk 
1436  00        brk 
1437  00        brk 
1438  00        brk 
1439  00        brk 
143A  00        brk 
143B  00        brk 
143C  00        brk 
143D  00        brk 
143E  00        brk 
143F  00        brk 
1440  00        brk 
1441  00        brk 
1442  00        brk 
1443  00        brk 
1444  00        brk 
1445  00        brk 
1446  00        brk 
1447  00        brk 
1448  00        brk 
1449  00        brk 
144A  00        brk 
144B  00        brk 
144C  00        brk 
144D  00        brk 
144E  00        brk 
144F  00        brk 
1450  00        brk 
1451  00        brk 
1452  00        brk 
1453  00        brk 
1454  00        brk 
1455  00        brk 
1456  00        brk 
1457  00        brk 
1458  00        brk 
1459  00        brk 
145A  00        brk 
145B  00        brk 
145C  00        brk 
145D  00        brk 
145E  00        brk 
145F  00        brk 
1460  00        brk 
1461  00        brk 
1462  00        brk 
1463  00        brk 
1464  00        brk 
1465  00        brk 
1466  00        brk 
1467  00        brk 
1468  00        brk 
1469  00        brk 
146A  00        brk 
146B  00        brk 
146C  00        brk 
146D  00        brk 
146E  00        brk 
146F  00        brk 
1470  00        brk 
1471  00        brk 
1472  00        brk 
1473  00        brk 
1474  00        brk 
1475  00        brk 
1476  00        brk 
1477  00        brk 
1478  00        brk 
1479  00        brk 
147A  00        brk 
147B  00        brk 
147C  00        brk 
147D  00        brk 
147E  00        brk 
147F  00        brk 
1480  00        brk 
1481  00        brk 
1482  00        brk 
1483  00        brk 
1484  00        brk 
1485  00        brk 
1486  00        brk 
1487  00        brk 
1488  00        brk 
1489  00        brk 
148A  00        brk 
148B  00        brk 
148C  00        brk 
148D  00        brk 
148E  00        brk 
148F  00        brk 
1490  00        brk 
1491  00        brk 
1492  00        brk 
1493  00        brk 
1494  00        brk 
1495  00        brk 
1496  00        brk 
1497  00        brk 
1498  00        brk 
1499  00        brk 
149A  00        brk 
149B  00        brk 
149C  00        brk 
149D  00        brk 
149E  00        brk 
149F  00        brk 
14A0  00        brk 
14A1  00        brk 
14A2  00        brk 
14A3  00        brk 
14A4  00        brk 
14A5  00        brk 
14A6  00        brk 
14A7  00        brk 
14A8  00        brk 
14A9  00        brk 
14AA  00        brk 
14AB  00        brk 
14AC  00        brk 
14AD  00        brk 
14AE  00        brk 
14AF  00        brk 
14B0  00        brk 
14B1  00        brk 
14B2  00        brk 
14B3  00        brk 
14B4  00        brk 
14B5  00        brk 
14B6  00        brk 
14B7  00        brk 
14B8  00        brk 
14B9  00        brk 
14BA  00        brk 
14BB  00        brk 
14BC  00        brk 
14BD  00        brk 
14BE  00        brk 
14BF  00        brk 
14C0  00        brk 
14C1  00        brk 
14C2  00        brk 
14C3  00        brk 
14C4  00        brk 
14C5  00        brk 
14C6  00        brk 
14C7  00        brk 
14C8  00        brk 
14C9  00        brk 
14CA  00        brk 
14CB  00        brk 
14CC  00        brk 
14CD  00        brk 
14CE  00        brk 
14CF  00        brk 
14D0  00        brk 
14D1  00        brk 
14D2  00        brk 
14D3  00        brk 
14D4  00        brk 
14D5  00        brk 
14D6  00        brk 
14D7  00        brk 
14D8  00        brk 
14D9  00        brk 
14DA  00        brk 
14DB  00        brk 
14DC  00        brk 
14DD  00        brk 
14DE  00        brk 
14DF  00        brk 
14E0  00        brk 
14E1  00        brk 
14E2  00        brk 
14E3  00        brk 
14E4  00        brk 
14E5  00        brk 
14E6  00        brk 
14E7  00        brk 
14E8  00        brk 
14E9  00        brk 
14EA  00        brk 
14EB  00        brk 
14EC  00        brk 
14ED  00        brk 
14EE  00        brk 
14EF  00        brk 
14F0  00        brk 
14F1  00        brk 
14F2  00        brk 
14F3  00        brk 
14F4  00        brk 
14F5  00        brk 
14F6  00        brk 
14F7  00        brk 
14F8  00        brk 
14F9  00        brk 
14FA  00        brk 
14FB  00        brk 
14FC  00        brk 
14FD  00        brk 
14FE  00        brk 
14FF  00        brk 
1500  00        brk 
1501  00        brk 
1502  00        brk 
1503  00        brk 
1504  00        brk 
1505  00        brk 
1506  00        brk 
1507  00        brk 
1508  00        brk 
1509  00        brk 
150A  00        brk 
150B  00        brk 
150C  00        brk 
150D  00        brk 
150E  00        brk 
150F  00        brk 
1510  00        brk 
1511  00        brk 
1512  00        brk 
1513  00        brk 
1514  00        brk 
1515  00        brk 
1516  00        brk 
1517  00        brk 
1518  00        brk 
1519  00        brk 
151A  00        brk 
151B  00        brk 
151C  00        brk 
151D  00        brk 
151E  00        brk 
151F  00        brk 
1520  00        brk 
1521  00        brk 
1522  00        brk 
1523  00        brk 
1524  00        brk 
1525  00        brk 
1526  00        brk 
1527  00        brk 
1528  00        brk 
1529  00        brk 
152A  00        brk 
152B  00        brk 
152C  00        brk 
152D  00        brk 
152E  00        brk 
152F  00        brk 
1530  00        brk 
1531  00        brk 
1532  00        brk 
1533  00        brk 
1534  00        brk 
1535  00        brk 
1536  00        brk 
1537  00        brk 
1538  00        brk 
1539  00        brk 
153A  00        brk 
153B  00        brk 
153C  00        brk 
153D  00        brk 
153E  00        brk 
153F  00        brk 
1540  00        brk 
1541  00        brk 
1542  00        brk 
1543  00        brk 
1544  00        brk 
1545  00        brk 
1546  00        brk 
1547  00        brk 
1548  00        brk 
1549  00        brk 
154A  00        brk 
154B  00        brk 
154C  00        brk 
154D  00        brk 
154E  00        brk 
154F  00        brk 
1550  00        brk 
1551  00        brk 
1552  00        brk 
1553  00        brk 
1554  00        brk 
1555  00        brk 
1556  00        brk 
1557  00        brk 
1558  00        brk 
1559  00        brk 
155A  00        brk 
155B  00        brk 
155C  00        brk 
155D  00        brk 
155E  00        brk 
155F  00        brk 
1560  00        brk 
1561  00        brk 
1562  00        brk 
1563  00        brk 
1564  00        brk 
1565  00        brk 
1566  00        brk 
1567  00        brk 
1568  00        brk 
1569  00        brk 
156A  00        brk 
156B  00        brk 
156C  00        brk 
156D  00        brk 
156E  00        brk 
156F  00        brk 
1570  00        brk 
1571  00        brk 
1572  00        brk 
1573  00        brk 
1574  00        brk 
1575  00        brk 
1576  00        brk 
1577  00        brk 
1578  00        brk 
1579  00        brk 
157A  00        brk 
157B  00        brk 
157C  00        brk 
157D  00        brk 
157E  00        brk 
157F  00        brk 
1580  00        brk 
1581  00        brk 
1582  00        brk 
1583  00        brk 
1584  00        brk 
1585  00        brk 
1586  00        brk 
1587  00        brk 
1588  00        brk 
1589  00        brk 
158A  00        brk 
158B  00        brk 
158C  00        brk 
158D  00        brk 
158E  00        brk 
158F  00        brk 
1590  00        brk 
1591  00        brk 
1592  00        brk 
1593  00        brk 
1594  00        brk 
1595  00        brk 
1596  00        brk 
1597  00        brk 
1598  00        brk 
1599  00        brk 
159A  00        brk 
159B  00        brk 
159C  00        brk 
159D  00        brk 
159E  00        brk 
159F  00        brk 
15A0  00        brk 
15A1  00        brk 
15A2  00        brk 
15A3  00        brk 
15A4  00        brk 
15A5  00        brk 
15A6  00        brk 
15A7  00        brk 
15A8  00        brk 
15A9  00        brk 
15AA  00        brk 
15AB  00        brk 
15AC  00        brk 
15AD  00        brk 
15AE  00        brk 
15AF  00        brk 
15B0  00        brk 
15B1  00        brk 
15B2  00        brk 
15B3  00        brk 
15B4  00        brk 
15B5  00        brk 
15B6  00        brk 
15B7  00        brk 
15B8  00        brk 
15B9  00        brk 
15BA  00        brk 
15BB  00        brk 
15BC  00        brk 
15BD  00        brk 
15BE  00        brk 
15BF  00        brk 
15C0  00        brk 
15C1  00        brk 
15C2  00        brk 
15C3  00        brk 
15C4  00        brk 
15C5  00        brk 
15C6  00        brk 
15C7  00        brk 
15C8  00        brk 
15C9  00        brk 
15CA  00        brk 
15CB  00        brk 
15CC  00        brk 
15CD  00        brk 
15CE  00        brk 
15CF  00        brk 
15D0  00        brk 
15D1  00        brk 
15D2  00        brk 
15D3  00        brk 
15D4  00        brk 
15D5  00        brk 
15D6  00        brk 
15D7  00        brk 
15D8  00        brk 
15D9  00        brk 
15DA  00        brk 
15DB  00        brk 
15DC  00        brk 
15DD  00        brk 
15DE  00        brk 
15DF  00        brk 
15E0  00        brk 
15E1  00        brk 
15E2  00        brk 
15E3  00        brk 
15E4  00        brk 
15E5  00        brk 
15E6  00        brk 
15E7  00        brk 
15E8  00        brk 
15E9  00        brk 
15EA  00        brk 
15EB  00        brk 
15EC  00        brk 
15ED  00        brk 
15EE  00        brk 
15EF  00        brk 
15F0  00        brk 
15F1  00        brk 
15F2  00        brk 
15F3  00        brk 
15F4  00        brk 
15F5  00        brk 
15F6  00        brk 
15F7  00        brk 
15F8  00        brk 
15F9  00        brk 
15FA  00        brk 
15FB  00        brk 
15FC  00        brk 
15FD  00        brk 
15FE  00        brk 
15FF  00        brk 
1600  00        brk 
1601  00        brk 
1602  00        brk 
1603  00        brk 
1604  00        brk 
1605  00        brk 
1606  00        brk 
1607  00        brk 
1608  00        brk 
1609  00        brk 
160A  00        brk 
160B  00        brk 
160C  00        brk 
160D  00        brk 
160E  00        brk 
160F  00        brk 
1610  00        brk 
1611  00        brk 
1612  00        brk 
1613  00        brk 
1614  00        brk 
1615  00        brk 
1616  00        brk 
1617  00        brk 
1618  00        brk 
1619  00        brk 
161A  00        brk 
161B  00        brk 
161C  00        brk 
161D  00        brk 
161E  00        brk 
161F  00        brk 
1620  00        brk 
1621  00        brk 
1622  00        brk 
1623  00        brk 
1624  00        brk 
1625  00        brk 
1626  00        brk 
1627  00        brk 
1628  00        brk 
1629  00        brk 
162A  00        brk 
162B  00        brk 
162C  00        brk 
162D  00        brk 
162E  00        brk 
162F  00        brk 
1630  00        brk 
1631  00        brk 
1632  00        brk 
1633  00        brk 
1634  00        brk 
1635  00        brk 
1636  00        brk 
1637  00        brk 
1638  00        brk 
1639  00        brk 
163A  00        brk 
163B  00        brk 
163C  00        brk 
163D  00        brk 
163E  00        brk 
163F  00        brk 
1640  00        brk 
1641  00        brk 
1642  00        brk 
1643  00        brk 
1644  00        brk 
1645  00        brk 
1646  00        brk 
1647  00        brk 
1648  00        brk 
1649  00        brk 
164A  00        brk 
164B  00        brk 
164C  00        brk 
164D  00        brk 
164E  00        brk 
164F  00        brk 
1650  00        brk 
1651  00        brk 
1652  00        brk 
1653  00        brk 
1654  00        brk 
1655  00        brk 
1656  00        brk 
1657  00        brk 
1658  00        brk 
1659  00        brk 
165A  00        brk 
165B  00        brk 
165C  00        brk 
165D  00        brk 
165E  00        brk 
165F  00        brk 
1660  00        brk 
1661  00        brk 
1662  00        brk 
1663  00        brk 
1664  00        brk 
1665  00        brk 
1666  00        brk 
1667  00        brk 
1668  00        brk 
1669  00        brk 
166A  00        brk 
166B  00        brk 
166C  00        brk 
166D  00        brk 
166E  00        brk 
166F  00        brk 
1670  00        brk 
1671  00        brk 
1672  00        brk 
1673  00        brk 
1674  00        brk 
1675  00        brk 
1676  00        brk 
1677  00        brk 
1678  00        brk 
1679  00        brk 
167A  00        brk 
167B  00        brk 
167C  00        brk 
167D  00        brk 
167E  00        brk 
167F  00        brk 
1680  00        brk 
1681  00        brk 
1682  00        brk 
1683  00        brk 
1684  00        brk 
1685  00        brk 
1686  00        brk 
1687  00        brk 
1688  00        brk 
1689  00        brk 
168A  00        brk 
168B  00        brk 
168C  00        brk 
168D  00        brk 
168E  00        brk 
168F  00        brk 
1690  00        brk 
1691  00        brk 
1692  00        brk 
1693  00        brk 
1694  00        brk 
1695  00        brk 
1696  00        brk 
1697  00        brk 
1698  00        brk 
1699  00        brk 
169A  00        brk 
169B  00        brk 
169C  00        brk 
169D  00        brk 
169E  00        brk 
169F  00        brk 
16A0  00        brk 
16A1  00        brk 
16A2  00        brk 
16A3  00        brk 
16A4  00        brk 
16A5  00        brk 
16A6  00        brk 
16A7  00        brk 
16A8  00        brk 
16A9  00        brk 
16AA  00        brk 
16AB  00        brk 
16AC  00        brk 
16AD  00        brk 
16AE  00        brk 
16AF  00        brk 
16B0  00        brk 
16B1  00        brk 
16B2  00        brk 
16B3  00        brk 
16B4  00        brk 
16B5  00        brk 
16B6  00        brk 
16B7  00        brk 
16B8  00        brk 
16B9  00        brk 
16BA  00        brk 
16BB  00        brk 
16BC  00        brk 
16BD  00        brk 
16BE  00        brk 
16BF  00        brk 
16C0  00        brk 
16C1  00        brk 
16C2  00        brk 
16C3  00        brk 
16C4  00        brk 
16C5  00        brk 
16C6  00        brk 
16C7  00        brk 
16C8  00        brk 
16C9  00        brk 
16CA  00        brk 
16CB  00        brk 
16CC  00        brk 
16CD  00        brk 
16CE  00        brk 
16CF  00        brk 
16D0  00        brk 
16D1  00        brk 
16D2  00        brk 
16D3  00        brk 
16D4  00        brk 
16D5  00        brk 
16D6  00        brk 
16D7  00        brk 
16D8  00        brk 
16D9  00        brk 
16DA  00        brk 
16DB  00        brk 
16DC  00        brk 
16DD  00        brk 
16DE  00        brk 
16DF  00        brk 
16E0  00        brk 
16E1  00        brk 
16E2  00        brk 
16E3  00        brk 
16E4  00        brk 
16E5  00        brk 
16E6  00        brk 
16E7  00        brk 
16E8  00        brk 
16E9  00        brk 
16EA  00        brk 
16EB  00        brk 
16EC  00        brk 
16ED  00        brk 
16EE  00        brk 
16EF  00        brk 
16F0  00        brk 
16F1  00        brk 
16F2  00        brk 
16F3  00        brk 
16F4  00        brk 
16F5  00        brk 
16F6  00        brk 
16F7  00        brk 
16F8  00        brk 
16F9  00        brk 
16FA  00        brk 
16FB  00        brk 
16FC  00        brk 
16FD  00        brk 
16FE  00        brk 
16FF  00        brk 
1700  00        brk 
1701  00        brk 
1702  00        brk 
1703  00        brk 
1704  00        brk 
1705  00        brk 
1706  00        brk 
1707  00        brk 
1708  00        brk 
1709  00        brk 
170A  00        brk 
170B  00        brk 
170C  00        brk 
170D  00        brk 
170E  00        brk 
170F  00        brk 
1710  00        brk 
1711  00        brk 
1712  00        brk 
1713  00        brk 
1714  00        brk 
1715  00        brk 
1716  00        brk 
1717  00        brk 
1718  00        brk 
1719  00        brk 
171A  00        brk 
171B  00        brk 
171C  00        brk 
171D  00        brk 
171E  00        brk 
171F  00        brk 
1720  00        brk 
1721  00        brk 
1722  00        brk 
1723  00        brk 
1724  00        brk 
1725  00        brk 
1726  00        brk 
1727  00        brk 
1728  00        brk 
1729  00        brk 
172A  00        brk 
172B  00        brk 
172C  00        brk 
172D  00        brk 
172E  00        brk 
172F  00        brk 
1730  00        brk 
1731  00        brk 
1732  00        brk 
1733  00        brk 
1734  00        brk 
1735  00        brk 
1736  00        brk 
1737  00        brk 
1738  00        brk 
1739  00        brk 
173A  00        brk 
173B  00        brk 
173C  00        brk 
173D  00        brk 
173E  00        brk 
173F  00        brk 
1740  00        brk 
1741  00        brk 
1742  00        brk 
1743  00        brk 
1744  00        brk 
1745  00        brk 
1746  00        brk 
1747  00        brk 
1748  00        brk 
1749  00        brk 
174A  00        brk 
174B  00        brk 
174C  00        brk 
174D  00        brk 
174E  00        brk 
174F  00        brk 
1750  00        brk 
1751  00        brk 
1752  00        brk 
1753  00        brk 
1754  00        brk 
1755  00        brk 
1756  00        brk 
1757  00        brk 
1758  00        brk 
1759  00        brk 
175A  00        brk 
175B  00        brk 
175C  00        brk 
175D  00        brk 
175E  00        brk 
175F  00        brk 
1760  00        brk 
1761  00        brk 
1762  00        brk 
1763  00        brk 
1764  00        brk 
1765  00        brk 
1766  00        brk 
1767  00        brk 
1768  00        brk 
1769  00        brk 
176A  00        brk 
176B  00        brk 
176C  00        brk 
176D  00        brk 
176E  00        brk 
176F  00        brk 
1770  00        brk 
1771  00        brk 
1772  00        brk 
1773  00        brk 
1774  00        brk 
1775  00        brk 
1776  00        brk 
1777  00        brk 
1778  00        brk 
1779  00        brk 
177A  00        brk 
177B  00        brk 
177C  00        brk 
177D  00        brk 
177E  00        brk 
177F  00        brk 
1780  00        brk 
1781  00        brk 
1782  00        brk 
1783  00        brk 
1784  00        brk 
1785  00        brk 
1786  00        brk 
1787  00        brk 
1788  00        brk 
1789  00        brk 
178A  00        brk 
178B  00        brk 
178C  00        brk 
178D  00        brk 
178E  00        brk 
178F  00        brk 
1790  00        brk 
1791  00        brk 
1792  00        brk 
1793  00        brk 
1794  00        brk 
1795  00        brk 
1796  00        brk 
1797  00        brk 
1798  00        brk 
1799  00        brk 
179A  00        brk 
179B  00        brk 
179C  00        brk 
179D  00        brk 
179E  00        brk 
179F  00        brk 
17A0  00        brk 
17A1  00        brk 
17A2  00        brk 
17A3  00        brk 
17A4  00        brk 
17A5  00        brk 
17A6  00        brk 
17A7  00        brk 
17A8  00        brk 
17A9  00        brk 
17AA  00        brk 
17AB  00        brk 
17AC  00        brk 
17AD  00        brk 
17AE  00        brk 
17AF  00        brk 
17B0  00        brk 
17B1  00        brk 
17B2  00        brk 
17B3  00        brk 
17B4  00        brk 
17B5  00        brk 
17B6  00        brk 
17B7  00        brk 
17B8  00        brk 
17B9  00        brk 
17BA  00        brk 
17BB  00        brk 
17BC  00        brk 
17BD  00        brk 
17BE  00        brk 
17BF  00        brk 
17C0  00        brk 
17C1  00        brk 
17C2  00        brk 
17C3  00        brk 
17C4  00        brk 
17C5  00        brk 
17C6  00        brk 
17C7  00        brk 
17C8  00        brk 
17C9  00        brk 
17CA  00        brk 
17CB  00        brk 
17CC  00        brk 
17CD  00        brk 
17CE  00        brk 
17CF  00        brk 
17D0  00        brk 
17D1  00        brk 
17D2  00        brk 
17D3  00        brk 
17D4  00        brk 
17D5  00        brk 
17D6  00        brk 
17D7  00        brk 
17D8  00        brk 
17D9  00        brk 
17DA  00        brk 
17DB  00        brk 
17DC  00        brk 
17DD  00        brk 
17DE  00        brk 
17DF  00        brk 
17E0  00        brk 
17E1  00        brk 
17E2  00        brk 
17E3  00        brk 
17E4  00        brk 
17E5  00        brk 
17E6  00        brk 
17E7  00        brk 
17E8  00        brk 
17E9  00        brk 
17EA  00        brk 
17EB  00        brk 
17EC  00        brk 
17ED  00        brk 
17EE  00        brk 
17EF  00        brk 
17F0  00        brk 
17F1  00        brk 
17F2  00        brk 
17F3  00        brk 
17F4  00        brk 
17F5  00        brk 
17F6  00        brk 
17F7  00        brk 
17F8  00        brk 
17F9  00        brk 
17FA  00        brk 
17FB  00        brk 
17FC  00        brk 
17FD  00        brk 
17FE  00        brk 
17FF  00        brk 
1800  00        brk 
1801  00        brk 
1802  00        brk 
1803  00        brk 
1804  00        brk 
1805  00        brk 
1806  00        brk 
1807  00        brk 
1808  00        brk 
1809  00        brk 
180A  00        brk 
180B  00        brk 
180C  00        brk 
180D  00        brk 
180E  00        brk 
180F  00        brk 
1810  00        brk 
1811  00        brk 
1812  00        brk 
1813  00        brk 
1814  00        brk 
1815  00        brk 
1816  00        brk 
1817  00        brk 
1818  00        brk 
1819  00        brk 
181A  00        brk 
181B  00        brk 
181C  00        brk 
181D  00        brk 
181E  00        brk 
181F  00        brk 
1820  00        brk 
1821  00        brk 
1822  00        brk 
1823  00        brk 
1824  00        brk 
1825  00        brk 
1826  00        brk 
1827  00        brk 
1828  00        brk 
1829  00        brk 
182A  00        brk 
182B  00        brk 
182C  00        brk 
182D  00        brk 
182E  00        brk 
182F  00        brk 
1830  00        brk 
1831  00        brk 
1832  00        brk 
1833  00        brk 
1834  00        brk 
1835  00        brk 
1836  00        brk 
1837  00        brk 
1838  00        brk 
1839  00        brk 
183A  00        brk 
183B  00        brk 
183C  00        brk 
183D  00        brk 
183E  00        brk 
183F  00        brk 
1840  00        brk 
1841  00        brk 
1842  00        brk 
1843  00        brk 
1844  00        brk 
1845  00        brk 
1846  00        brk 
1847  00        brk 
1848  00        brk 
1849  00        brk 
184A  00        brk 
184B  00        brk 
184C  00        brk 
184D  00        brk 
184E  00        brk 
184F  00        brk 
1850  00        brk 
1851  00        brk 
1852  00        brk 
1853  00        brk 
1854  00        brk 
1855  00        brk 
1856  00        brk 
1857  00        brk 
1858  00        brk 
1859  00        brk 
185A  00        brk 
185B  00        brk 
185C  00        brk 
185D  00        brk 
185E  00        brk 
185F  00        brk 
1860  00        brk 
1861  00        brk 
1862  00        brk 
1863  00        brk 
1864  00        brk 
1865  00        brk 
1866  00        brk 
1867  00        brk 
1868  00        brk 
1869  00        brk 
186A  00        brk 
186B  00        brk 
186C  00        brk 
186D  00        brk 
186E  00        brk 
186F  00        brk 
1870  00        brk 
1871  00        brk 
1872  00        brk 
1873  00        brk 
1874  00        brk 
1875  00        brk 
1876  00        brk 
1877  00        brk 
1878  00        brk 
1879  00        brk 
187A  00        brk 
187B  00        brk 
187C  00        brk 
187D  00        brk 
187E  00        brk 
187F  00        brk 
1880  00        brk 
1881  00        brk 
1882  00        brk 
1883  00        brk 
1884  00        brk 
1885  00        brk 
1886  00        brk 
1887  00        brk 
1888  00        brk 
1889  00        brk 
188A  00        brk 
188B  00        brk 
188C  00        brk 
188D  00        brk 
188E  00        brk 
188F  00        brk 
1890  00        brk 
1891  00        brk 
1892  00        brk 
1893  00        brk 
1894  00        brk 
1895  00        brk 
1896  00        brk 
1897  00        brk 
1898  00        brk 
1899  00        brk 
189A  00        brk 
189B  00        brk 
189C  00        brk 
189D  00        brk 
189E  00        brk 
189F  00        brk 
18A0  00        brk 
18A1  00        brk 
18A2  00        brk 
18A3  00        brk 
18A4  00        brk 
18A5  00        brk 
18A6  00        brk 
18A7  00        brk 
18A8  00        brk 
18A9  00        brk 
18AA  00        brk 
18AB  00        brk 
18AC  00        brk 
18AD  00        brk 
18AE  00        brk 
18AF  00        brk 
18B0  00        brk 
18B1  00        brk 
18B2  00        brk 
18B3  00        brk 
18B4  00        brk 
18B5  00        brk 
18B6  00        brk 
18B7  00        brk 
18B8  00        brk 
18B9  00        brk 
18BA  00        brk 
18BB  00        brk 
18BC  00        brk 
18BD  00        brk 
18BE  00        brk 
18BF  00        brk 
18C0  00        brk 
18C1  00        brk 
18C2  00        brk 
18C3  00        brk 
18C4  00        brk 
18C5  00        brk 
18C6  00        brk 
18C7  00        brk 
18C8  00        brk 
18C9  00        brk 
18CA  00        brk 
18CB  00        brk 
18CC  00        brk 
18CD  00        brk 
18CE  00        brk 
18CF  00        brk 
18D0  00        brk 
18D1  00        brk 
18D2  00        brk 
18D3  00        brk 
18D4  00        brk 
18D5  00        brk 
18D6  00        brk 
18D7  00        brk 
18D8  00        brk 
18D9  00        brk 
18DA  00        brk 
18DB  00        brk 
18DC  00        brk 
18DD  00        brk 
18DE  00        brk 
18DF  00        brk 
18E0  00        brk 
18E1  00        brk 
18E2  00        brk 
18E3  00        brk 
18E4  00        brk 
18E5  00        brk 
18E6  00        brk 
18E7  00        brk 
18E8  00        brk 
18E9  00        brk 
18EA  00        brk 
18EB  00        brk 
18EC  00        brk 
18ED  00        brk 
18EE  00        brk 
18EF  00        brk 
18F0  00        brk 
18F1  00        brk 
18F2  00        brk 
18F3  00        brk 
18F4  00        brk 
18F5  00        brk 
18F6  00        brk 
18F7  00        brk 
18F8  00        brk 
18F9  00        brk 
18FA  00        brk 
18FB  00        brk 
18FC  00        brk 
18FD  00        brk 
18FE  00        brk 
18FF  00        brk 
1900  00        brk 
1901  00        brk 
1902  00        brk 
1903  00        brk 
1904  00        brk 
1905  00        brk 
1906  00        brk 
1907  00        brk 
1908  00        brk 
1909  00        brk 
190A  00        brk 
190B  00        brk 
190C  00        brk 
190D  00        brk 
190E  00        brk 
190F  00        brk 
1910  00        brk 
1911  00        brk 
1912  00        brk 
1913  00        brk 
1914  00        brk 
1915  00        brk 
1916  00        brk 
1917  00        brk 
1918  00        brk 
1919  00        brk 
191A  00        brk 
191B  00        brk 
191C  00        brk 
191D  00        brk 
191E  00        brk 
191F  00        brk 
1920  00        brk 
1921  00        brk 
1922  00        brk 
1923  00        brk 
1924  00        brk 
1925  00        brk 
1926  00        brk 
1927  00        brk 
1928  00        brk 
1929  00        brk 
192A  00        brk 
192B  00        brk 
192C  00        brk 
192D  00        brk 
192E  00        brk 
192F  00        brk 
1930  00        brk 
1931  00        brk 
1932  00        brk 
1933  00        brk 
1934  00        brk 
1935  00        brk 
1936  00        brk 
1937  00        brk 
1938  00        brk 
1939  00        brk 
193A  00        brk 
193B  00        brk 
193C  00        brk 
193D  00        brk 
193E  00        brk 
193F  00        brk 
1940  00        brk 
1941  00        brk 
1942  00        brk 
1943  00        brk 
1944  00        brk 
1945  00        brk 
1946  00        brk 
1947  00        brk 
1948  00        brk 
1949  00        brk 
194A  00        brk 
194B  00        brk 
194C  00        brk 
194D  00        brk 
194E  00        brk 
194F  00        brk 
1950  00        brk 
1951  00        brk 
1952  00        brk 
1953  00        brk 
1954  00        brk 
1955  00        brk 
1956  00        brk 
1957  00        brk 
1958  00        brk 
1959  00        brk 
195A  00        brk 
195B  00        brk 
195C  00        brk 
195D  00        brk 
195E  00        brk 
195F  00        brk 
1960  00        brk 
1961  00        brk 
1962  00        brk 
1963  00        brk 
1964  00        brk 
1965  00        brk 
1966  00        brk 
1967  00        brk 
1968  00        brk 
1969  00        brk 
196A  00        brk 
196B  00        brk 
196C  00        brk 
196D  00        brk 
196E  00        brk 
196F  00        brk 
1970  00        brk 
1971  00        brk 
1972  00        brk 
1973  00        brk 
1974  00        brk 
1975  00        brk 
1976  00        brk 
1977  00        brk 
1978  00        brk 
1979  00        brk 
197A  00        brk 
197B  00        brk 
197C  00        brk 
197D  00        brk 
197E  00        brk 
197F  00        brk 
1980  00        brk 
1981  00        brk 
1982  00        brk 
1983  00        brk 
1984  00        brk 
1985  00        brk 
1986  00        brk 
1987  00        brk 
1988  00        brk 
1989  00        brk 
198A  00        brk 
198B  00        brk 
198C  00        brk 
198D  00        brk 
198E  00        brk 
198F  00        brk 
1990  00        brk 
1991  00        brk 
1992  00        brk 
1993  00        brk 
1994  00        brk 
1995  00        brk 
1996  00        brk 
1997  00        brk 
1998  00        brk 
1999  00        brk 
199A  00        brk 
199B  00        brk 
199C  00        brk 
199D  00        brk 
199E  00        brk 
199F  00        brk 
19A0  00        brk 
19A1  00        brk 
19A2  00        brk 
19A3  00        brk 
19A4  00        brk 
19A5  00        brk 
19A6  00        brk 
19A7  00        brk 
19A8  00        brk 
19A9  00        brk 
19AA  00        brk 
19AB  00        brk 
19AC  00        brk 
19AD  00        brk 
19AE  00        brk 
19AF  00        brk 
19B0  00        brk 
19B1  00        brk 
19B2  00        brk 
19B3  00        brk 
19B4  00        brk 
19B5  00        brk 
19B6  00        brk 
19B7  00        brk 
19B8  00        brk 
19B9  00        brk 
19BA  00        brk 
19BB  00        brk 
19BC  00        brk 
19BD  00        brk 
19BE  00        brk 
19BF  00        brk 
19C0  00        brk 
19C1  00        brk 
19C2  00        brk 
19C3  00        brk 
19C4  00        brk 
19C5  00        brk 
19C6  00        brk 
19C7  00        brk 
19C8  00        brk 
19C9  00        brk 
19CA  00        brk 
19CB  00        brk 
19CC  00        brk 
19CD  00        brk 
19CE  00        brk 
19CF  00        brk 
19D0  00        brk 
19D1  00        brk 
19D2  00        brk 
19D3  00        brk 
19D4  00        brk 
19D5  00        brk 
19D6  00        brk 
19D7  00        brk 
19D8  00        brk 
19D9  00        brk 
19DA  00        brk 
19DB  00        brk 
19DC  00        brk 
19DD  00        brk 
19DE  00        brk 
19DF  00        brk 
19E0  00        brk 
19E1  00        brk 
19E2  00        brk 
19E3  00        brk 
19E4  00        brk 
19E5  00        brk 
19E6  00        brk 
19E7  00        brk 
19E8  00        brk 
19E9  00        brk 
19EA  00        brk 
19EB  00        brk 
19EC  00        brk 
19ED  00        brk 
19EE  00        brk 
19EF  00        brk 
19F0  00        brk 
19F1  00        brk 
19F2  00        brk 
19F3  00        brk 
19F4  00        brk 
19F5  00        brk 
19F6  00        brk 
19F7  00        brk 
19F8  00        brk 
19F9  00        brk 
19FA  00        brk 
19FB  00        brk 
19FC  00        brk 
19FD  00        brk 
19FE  00        brk 
19FF  00        brk 
1A00  00        brk 
1A01  00        brk 
1A02  00        brk 
1A03  00        brk 
1A04  00        brk 
1A05  00        brk 
1A06  00        brk 
1A07  00        brk 
1A08  00        brk 
1A09  00        brk 
1A0A  00        brk 
1A0B  00        brk 
1A0C  00        brk 
1A0D  00        brk 
1A0E  00        brk 
1A0F  00        brk 
1A10  00        brk 
1A11  00        brk 
1A12  00        brk 
1A13  00        brk 
1A14  00        brk 
1A15  00        brk 
1A16  00        brk 
1A17  00        brk 
1A18  00        brk 
1A19  00        brk 
1A1A  00        brk 
1A1B  00        brk 
1A1C  00        brk 
1A1D  00        brk 
1A1E  00        brk 
1A1F  00        brk 
1A20  00        brk 
1A21  00        brk 
1A22  00        brk 
1A23  00        brk 
1A24  00        brk 
1A25  00        brk 
1A26  00        brk 
1A27  00        brk 
1A28  00        brk 
1A29  00        brk 
1A2A  00        brk 
1A2B  00        brk 
1A2C  00        brk 
1A2D  00        brk 
1A2E  00        brk 
1A2F  00        brk 
1A30  00        brk 
1A31  00        brk 
1A32  00        brk 
1A33  00        brk 
1A34  00        brk 
1A35  00        brk 
1A36  00        brk 
1A37  00        brk 
1A38  00        brk 
1A39  00        brk 
1A3A  00        brk 
1A3B  00        brk 
1A3C  00        brk 
1A3D  00        brk 
1A3E  00        brk 
1A3F  00        brk 
1A40  00        brk 
1A41  00        brk 
1A42  00        brk 
1A43  00        brk 
1A44  00        brk 
1A45  00        brk 
1A46  00        brk 
1A47  00        brk 
1A48  00        brk 
1A49  00        brk 
1A4A  00        brk 
1A4B  00        brk 
1A4C  00        brk 
1A4D  00        brk 
1A4E  00        brk 
1A4F  00        brk 
1A50  00        brk 
1A51  00        brk 
1A52  00        brk 
1A53  00        brk 
1A54  00        brk 
1A55  00        brk 
1A56  00        brk 
1A57  00        brk 
1A58  00        brk 
1A59  00        brk 
1A5A  00        brk 
1A5B  00        brk 
1A5C  00        brk 
1A5D  00        brk 
1A5E  00        brk 
1A5F  00        brk 
1A60  00        brk 
1A61  00        brk 
1A62  00        brk 
1A63  00        brk 
1A64  00        brk 
1A65  00        brk 
1A66  00        brk 
1A67  00        brk 
1A68  00        brk 
1A69  00        brk 
1A6A  00        brk 
1A6B  00        brk 
1A6C  00        brk 
1A6D  00        brk 
1A6E  00        brk 
1A6F  00        brk 
1A70  00        brk 
1A71  00        brk 
1A72  00        brk 
1A73  00        brk 
1A74  00        brk 
1A75  00        brk 
1A76  00        brk 
1A77  00        brk 
1A78  00        brk 
1A79  00        brk 
1A7A  00        brk 
1A7B  00        brk 
1A7C  00        brk 
1A7D  00        brk 
1A7E  00        brk 
1A7F  00        brk 
1A80  00        brk 
1A81  00        brk 
1A82  00        brk 
1A83  00        brk 
1A84  00        brk 
1A85  00        brk 
1A86  00        brk 
1A87  00        brk 
1A88  00        brk 
1A89  00        brk 
1A8A  00        brk 
1A8B  00        brk 
1A8C  00        brk 
1A8D  00        brk 
1A8E  00        brk 
1A8F  00        brk 
1A90  00        brk 
1A91  00        brk 
1A92  00        brk 
1A93  00        brk 
1A94  00        brk 
1A95  00        brk 
1A96  00        brk 
1A97  00        brk 
1A98  00        brk 
1A99  00        brk 
1A9A  00        brk 
1A9B  00        brk 
1A9C  00        brk 
1A9D  00        brk 
1A9E  00        brk 
1A9F  00        brk 
1AA0  00        brk 
1AA1  00        brk 
1AA2  00        brk 
1AA3  00        brk 
1AA4  00        brk 
1AA5  00        brk 
1AA6  00        brk 
1AA7  00        brk 
1AA8  00        brk 
1AA9  00        brk 
1AAA  00        brk 
1AAB  00        brk 
1AAC  00        brk 
1AAD  00        brk 
1AAE  00        brk 
1AAF  00        brk 
1AB0  00        brk 
1AB1  00        brk 
1AB2  00        brk 
1AB3  00        brk 
1AB4  00        brk 
1AB5  00        brk 
1AB6  00        brk 
1AB7  00        brk 
1AB8  00        brk 
1AB9  00        brk 
1ABA  00        brk 
1ABB  00        brk 
1ABC  00        brk 
1ABD  00        brk 
1ABE  00        brk 
1ABF  00        brk 
1AC0  00        brk 
1AC1  00        brk 
1AC2  00        brk 
1AC3  00        brk 
1AC4  00        brk 
1AC5  00        brk 
1AC6  00        brk 
1AC7  00        brk 
1AC8  00        brk 
1AC9  00        brk 
1ACA  00        brk 
1ACB  00        brk 
1ACC  00        brk 
1ACD  00        brk 
1ACE  00        brk 
1ACF  00        brk 
1AD0  00        brk 
1AD1  00        brk 
1AD2  00        brk 
1AD3  00        brk 
1AD4  00        brk 
1AD5  00        brk 
1AD6  00        brk 
1AD7  00        brk 
1AD8  00        brk 
1AD9  00        brk 
1ADA  00        brk 
1ADB  00        brk 
1ADC  00        brk 
1ADD  00        brk 
1ADE  00        brk 
1ADF  00        brk 
1AE0  00        brk 
1AE1  00        brk 
1AE2  00        brk 
1AE3  00        brk 
1AE4  00        brk 
1AE5  00        brk 
1AE6  00        brk 
1AE7  00        brk 
1AE8  00        brk 
1AE9  00        brk 
1AEA  00        brk 
1AEB  00        brk 
1AEC  00        brk 
1AED  00        brk 
1AEE  00        brk 
1AEF  00        brk 
1AF0  00        brk 
1AF1  00        brk 
1AF2  00        brk 
1AF3  00        brk 
1AF4  00        brk 
1AF5  00        brk 
1AF6  00        brk 
1AF7  00        brk 
1AF8  00        brk 
1AF9  00        brk 
1AFA  00        brk 
1AFB  00        brk 
1AFC  00        brk 
1AFD  00        brk 
1AFE  00        brk 
1AFF  00        brk 
1B00  00        brk 
1B01  00        brk 
1B02  00        brk 
1B03  00        brk 
1B04  00        brk 
1B05  00        brk 
1B06  00        brk 
1B07  00        brk 
1B08  00        brk 
1B09  00        brk 
1B0A  00        brk 
1B0B  00        brk 
1B0C  00        brk 
1B0D  00        brk 
1B0E  00        brk 
1B0F  00        brk 
1B10  00        brk 
1B11  00        brk 
1B12  00        brk 
1B13  00        brk 
1B14  00        brk 
1B15  00        brk 
1B16  00        brk 
1B17  00        brk 
1B18  00        brk 
1B19  00        brk 
1B1A  00        brk 
1B1B  00        brk 
1B1C  00        brk 
1B1D  00        brk 
1B1E  00        brk 
1B1F  00        brk 
1B20  00        brk 
1B21  00        brk 
1B22  00        brk 
1B23  00        brk 
1B24  00        brk 
1B25  00        brk 
1B26  00        brk 
1B27  00        brk 
1B28  00        brk 
1B29  00        brk 
1B2A  00        brk 
1B2B  00        brk 
1B2C  00        brk 
1B2D  00        brk 
1B2E  00        brk 
1B2F  00        brk 
1B30  00        brk 
1B31  00        brk 
1B32  00        brk 
1B33  00        brk 
1B34  00        brk 
1B35  00        brk 
1B36  00        brk 
1B37  00        brk 
1B38  00        brk 
1B39  00        brk 
1B3A  00        brk 
1B3B  00        brk 
1B3C  00        brk 
1B3D  00        brk 
1B3E  00        brk 
1B3F  00        brk 
1B40  00        brk 
1B41  00        brk 
1B42  00        brk 
1B43  00        brk 
1B44  00        brk 
1B45  00        brk 
1B46  00        brk 
1B47  00        brk 
1B48  00        brk 
1B49  00        brk 
1B4A  00        brk 
1B4B  00        brk 
1B4C  00        brk 
1B4D  00        brk 
1B4E  00        brk 
1B4F  00        brk 
1B50  00        brk 
1B51  00        brk 
1B52  00        brk 
1B53  00        brk 
1B54  00        brk 
1B55  00        brk 
1B56  00        brk 
1B57  00        brk 
1B58  00        brk 
1B59  00        brk 
1B5A  00        brk 
1B5B  00        brk 
1B5C  00        brk 
1B5D  00        brk 
1B5E  00        brk 
1B5F  00        brk 
1B60  00        brk 
1B61  00        brk 
1B62  00        brk 
1B63  00        brk 
1B64  00        brk 
1B65  00        brk 
1B66  00        brk 
1B67  00        brk 
1B68  00        brk 
1B69  00        brk 
1B6A  00        brk 
1B6B  00        brk 
1B6C  00        brk 
1B6D  00        brk 
1B6E  00        brk 
1B6F  00        brk 
1B70  00        brk 
1B71  00        brk 
1B72  00        brk 
1B73  00        brk 
1B74  00        brk 
1B75  00        brk 
1B76  00        brk 
1B77  00        brk 
1B78  00        brk 
1B79  00        brk 
1B7A  00        brk 
1B7B  00        brk 
1B7C  00        brk 
1B7D  00        brk 
1B7E  00        brk 
1B7F  00        brk 
1B80  00        brk 
1B81  00        brk 
1B82  00        brk 
1B83  00        brk 
1B84  00        brk 
1B85  00        brk 
1B86  00        brk 
1B87  00        brk 
1B88  00        brk 
1B89  00        brk 
1B8A  00        brk 
1B8B  00        brk 
1B8C  00        brk 
1B8D  00        brk 
1B8E  00        brk 
1B8F  00        brk 
1B90  00        brk 
1B91  00        brk 
1B92  00        brk 
1B93  00        brk 
1B94  00        brk 
1B95  00        brk 
1B96  00        brk 
1B97  00        brk 
1B98  00        brk 
1B99  00        brk 
1B9A  00        brk 
1B9B  00        brk 
1B9C  00        brk 
1B9D  00        brk 
1B9E  00        brk 
1B9F  00        brk 
1BA0  00        brk 
1BA1  00        brk 
1BA2  00        brk 
1BA3  00        brk 
1BA4  00        brk 
1BA5  00        brk 
1BA6  00        brk 
1BA7  00        brk 
1BA8  00        brk 
1BA9  00        brk 
1BAA  00        brk 
1BAB  00        brk 
1BAC  00        brk 
1BAD  00        brk 
1BAE  00        brk 
1BAF  00        brk 
1BB0  00        brk 
1BB1  00        brk 
1BB2  00        brk 
1BB3  00        brk 
1BB4  00        brk 
1BB5  00        brk 
1BB6  00        brk 
1BB7  00        brk 
1BB8  00        brk 
1BB9  00        brk 
1BBA  00        brk 
1BBB  00        brk 
1BBC  00        brk 
1BBD  00        brk 
1BBE  00        brk 
1BBF  00        brk 
1BC0  00        brk 
1BC1  00        brk 
1BC2  00        brk 
1BC3  00        brk 
1BC4  00        brk 
1BC5  00        brk 
1BC6  00        brk 
1BC7  00        brk 
1BC8  00        brk 
1BC9  00        brk 
1BCA  00        brk 
1BCB  00        brk 
1BCC  00        brk 
1BCD  00        brk 
1BCE  00        brk 
1BCF  00        brk 
1BD0  00        brk 
1BD1  00        brk 
1BD2  00        brk 
1BD3  00        brk 
1BD4  00        brk 
1BD5  00        brk 
1BD6  00        brk 
1BD7  00        brk 
1BD8  00        brk 
1BD9  00        brk 
1BDA  00        brk 
1BDB  00        brk 
1BDC  00        brk 
1BDD  00        brk 
1BDE  00        brk 
1BDF  00        brk 
1BE0  00        brk 
1BE1  00        brk 
1BE2  00        brk 
1BE3  00        brk 
1BE4  00        brk 
1BE5  00        brk 
1BE6  00        brk 
1BE7  00        brk 
1BE8  00        brk 
1BE9  00        brk 
1BEA  00        brk 
1BEB  00        brk 
1BEC  00        brk 
1BED  00        brk 
1BEE  00        brk 
1BEF  00        brk 
1BF0  00        brk 
1BF1  00        brk 
1BF2  00        brk 
1BF3  00        brk 
1BF4  00        brk 
1BF5  00        brk 
1BF6  00        brk 
1BF7  00        brk 
1BF8  00        brk 
1BF9  00        brk 
1BFA  00        brk 
1BFB  00        brk 
1BFC  00        brk 
1BFD  00        brk 
1BFE  00        brk 
1BFF  00        brk 
1C00  00        brk 
1C01  00        brk 
1C02  00        brk 
1C03  00        brk 
1C04  00        brk 
1C05  00        brk 
1C06  00        brk 
1C07  00        brk 
1C08  00        brk 
1C09  00        brk 
1C0A  00        brk 
1C0B  00        brk 
1C0C  00        brk 
1C0D  00        brk 
1C0E  00        brk 
1C0F  00        brk 
1C10  00        brk 
1C11  00        brk 
1C12  00        brk 
1C13  00        brk 
1C14  00        brk 
1C15  00        brk 
1C16  00        brk 
1C17  00        brk 
1C18  00        brk 
1C19  00        brk 
1C1A  00        brk 
1C1B  00        brk 
1C1C  00        brk 
1C1D  00        brk 
1C1E  00        brk 
1C1F  00        brk 
1C20  00        brk 
1C21  00        brk 
1C22  00        brk 
1C23  00        brk 
1C24  00        brk 
1C25  00        brk 
1C26  00        brk 
1C27  00        brk 
1C28  00        brk 
1C29  00        brk 
1C2A  00        brk 
1C2B  00        brk 
1C2C  00        brk 
1C2D  00        brk 
1C2E  00        brk 
1C2F  00        brk 
1C30  00        brk 
1C31  00        brk 
1C32  00        brk 
1C33  00        brk 
1C34  00        brk 
1C35  00        brk 
1C36  00        brk 
1C37  00        brk 
1C38  00        brk 
1C39  00        brk 
1C3A  00        brk 
1C3B  00        brk 
1C3C  00        brk 
1C3D  00        brk 
1C3E  00        brk 
1C3F  00        brk 
1C40  00        brk 
1C41  00        brk 
1C42  00        brk 
1C43  00        brk 
1C44  00        brk 
1C45  00        brk 
1C46  00        brk 
1C47  00        brk 
1C48  00        brk 
1C49  00        brk 
1C4A  00        brk 
1C4B  00        brk 
1C4C  00        brk 
1C4D  00        brk 
1C4E  00        brk 
1C4F  00        brk 
1C50  00        brk 
1C51  00        brk 
1C52  00        brk 
1C53  00        brk 
1C54  00        brk 
1C55  00        brk 
1C56  00        brk 
1C57  00        brk 
1C58  00        brk 
1C59  00        brk 
1C5A  00        brk 
1C5B  00        brk 
1C5C  00        brk 
1C5D  00        brk 
1C5E  00        brk 
1C5F  00        brk 
1C60  00        brk 
1C61  00        brk 
1C62  00        brk 
1C63  00        brk 
1C64  00        brk 
1C65  00        brk 
1C66  00        brk 
1C67  00        brk 
1C68  00        brk 
1C69  00        brk 
1C6A  00        brk 
1C6B  00        brk 
1C6C  00        brk 
1C6D  00        brk 
1C6E  00        brk 
1C6F  00        brk 
1C70  00        brk 
1C71  00        brk 
1C72  00        brk 
1C73  00        brk 
1C74  00        brk 
1C75  00        brk 
1C76  00        brk 
1C77  00        brk 
1C78  00        brk 
1C79  00        brk 
1C7A  00        brk 
1C7B  00        brk 
1C7C  00        brk 
1C7D  00        brk 
1C7E  00        brk 
1C7F  00        brk 
1C80  00        brk 
1C81  00        brk 
1C82  00        brk 
1C83  00        brk 
1C84  00        brk 
1C85  00        brk 
1C86  00        brk 
1C87  00        brk 
1C88  00        brk 
1C89  00        brk 
1C8A  00        brk 
1C8B  00        brk 
1C8C  00        brk 
1C8D  00        brk 
1C8E  00        brk 
1C8F  00        brk 
1C90  00        brk 
1C91  00        brk 
1C92  00        brk 
1C93  00        brk 
1C94  00        brk 
1C95  00        brk 
1C96  00        brk 
1C97  00        brk 
1C98  00        brk 
1C99  00        brk 
1C9A  00        brk 
1C9B  00        brk 
1C9C  00        brk 
1C9D  00        brk 
1C9E  00        brk 
1C9F  00        brk 
1CA0  00        brk 
1CA1  00        brk 
1CA2  00        brk 
1CA3  00        brk 
1CA4  00        brk 
1CA5  00        brk 
1CA6  00        brk 
1CA7  00        brk 
1CA8  00        brk 
1CA9  00        brk 
1CAA  00        brk 
1CAB  00        brk 
1CAC  00        brk 
1CAD  00        brk 
1CAE  00        brk 
1CAF  00        brk 
1CB0  00        brk 
1CB1  00        brk 
1CB2  00        brk 
1CB3  00        brk 
1CB4  00        brk 
1CB5  00        brk 
1CB6  00        brk 
1CB7  00        brk 
1CB8  00        brk 
1CB9  00        brk 
1CBA  00        brk 
1CBB  00        brk 
1CBC  00        brk 
1CBD  00        brk 
1CBE  00        brk 
1CBF  00        brk 
1CC0  00        brk 
1CC1  00        brk 
1CC2  00        brk 
1CC3  00        brk 
1CC4  00        brk 
1CC5  00        brk 
1CC6  00        brk 
1CC7  00        brk 
1CC8  00        brk 
1CC9  00        brk 
1CCA  00        brk 
1CCB  00        brk 
1CCC  00        brk 
1CCD  00        brk 
1CCE  00        brk 
1CCF  00        brk 
1CD0  00        brk 
1CD1  00        brk 
1CD2  00        brk 
1CD3  00        brk 
1CD4  00        brk 
1CD5  00        brk 
1CD6  00        brk 
1CD7  00        brk 
1CD8  00        brk 
1CD9  00        brk 
1CDA  00        brk 
1CDB  00        brk 
1CDC  00        brk 
1CDD  00        brk 
1CDE  00        brk 
1CDF  00        brk 
1CE0  00        brk 
1CE1  00        brk 
1CE2  00        brk 
1CE3  00        brk 
1CE4  00        brk 
1CE5  00        brk 
1CE6  00        brk 
1CE7  00        brk 
1CE8  00        brk 
1CE9  00        brk 
1CEA  00        brk 
1CEB  00        brk 
1CEC  00        brk 
1CED  00        brk 
1CEE  00        brk 
1CEF  00        brk 
1CF0  00        brk 
1CF1  00        brk 
1CF2  00        brk 
1CF3  00        brk 
1CF4  00        brk 
1CF5  00        brk 
1CF6  00        brk 
1CF7  00        brk 
1CF8  00        brk 
1CF9  00        brk 
1CFA  00        brk 
1CFB  00        brk 
1CFC  00        brk 
1CFD  00        brk 
1CFE  00        brk 
1CFF  00        brk 
1D00  00        brk 
1D01  00        brk 
1D02  00        brk 
1D03  00        brk 
1D04  00        brk 
1D05  00        brk 
1D06  00        brk 
1D07  00        brk 
1D08  00        brk 
1D09  00        brk 
1D0A  00        brk 
1D0B  00        brk 
1D0C  00        brk 
1D0D  00        brk 
1D0E  00        brk 
1D0F  00        brk 
1D10  00        brk 
1D11  00        brk 
1D12  00        brk 
1D13  00        brk 
1D14  00        brk 
1D15  00        brk 
1D16  00        brk 
1D17  00        brk 
1D18  00        brk 
1D19  00        brk 
1D1A  00        brk 
1D1B  00        brk 
1D1C  00        brk 
1D1D  00        brk 
1D1E  00        brk 
1D1F  00        brk 
1D20  00        brk 
1D21  00        brk 
1D22  00        brk 
1D23  00        brk 
1D24  00        brk 
1D25  00        brk 
1D26  00        brk 
1D27  00        brk 
1D28  00        brk 
1D29  00        brk 
1D2A  00        brk 
1D2B  00        brk 
1D2C  00        brk 
1D2D  00        brk 
1D2E  00        brk 
1D2F  00        brk 
1D30  00        brk 
1D31  00        brk 
1D32  00        brk 
1D33  00        brk 
1D34  00        brk 
1D35  00        brk 
1D36  00        brk 
1D37  00        brk 
1D38  00        brk 
1D39  00        brk 
1D3A  00        brk 
1D3B  00        brk 
1D3C  00        brk 
1D3D  00        brk 
1D3E  00        brk 
1D3F  00        brk 
1D40  00        brk 
1D41  00        brk 
1D42  00        brk 
1D43  00        brk 
1D44  00        brk 
1D45  00        brk 
1D46  00        brk 
1D47  00        brk 
1D48  00        brk 
1D49  00        brk 
1D4A  00        brk 
1D4B  00        brk 
1D4C  00        brk 
1D4D  00        brk 
1D4E  00        brk 
1D4F  00        brk 
1D50  00        brk 
1D51  00        brk 
1D52  00        brk 
1D53  00        brk 
1D54  00        brk 
1D55  00        brk 
1D56  00        brk 
1D57  00        brk 
1D58  00        brk 
1D59  00        brk 
1D5A  00        brk 
1D5B  00        brk 
1D5C  00        brk 
1D5D  00        brk 
1D5E  00        brk 
1D5F  00        brk 
1D60  00        brk 
1D61  00        brk 
1D62  00        brk 
1D63  00        brk 
1D64  00        brk 
1D65  00        brk 
1D66  00        brk 
1D67  00        brk 
1D68  00        brk 
1D69  00        brk 
1D6A  00        brk 
1D6B  00        brk 
1D6C  00        brk 
1D6D  00        brk 
1D6E  00        brk 
1D6F  00        brk 
1D70  00        brk 
1D71  00        brk 
1D72  00        brk 
1D73  00        brk 
1D74  00        brk 
1D75  00        brk 
1D76  00        brk 
1D77  00        brk 
1D78  00        brk 
1D79  00        brk 
1D7A  00        brk 
1D7B  00        brk 
1D7C  00        brk 
1D7D  00        brk 
1D7E  00        brk 
1D7F  00        brk 
1D80  00        brk 
1D81  00        brk 
1D82  00        brk 
1D83  00        brk 
1D84  00        brk 
1D85  00        brk 
1D86  00        brk 
1D87  00        brk 
1D88  00        brk 
1D89  00        brk 
1D8A  00        brk 
1D8B  00        brk 
1D8C  00        brk 
1D8D  00        brk 
1D8E  00        brk 
1D8F  00        brk 
1D90  00        brk 
1D91  00        brk 
1D92  00        brk 
1D93  00        brk 
1D94  00        brk 
1D95  00        brk 
1D96  00        brk 
1D97  00        brk 
1D98  00        brk 
1D99  00        brk 
1D9A  00        brk 
1D9B  00        brk 
1D9C  00        brk 
1D9D  00        brk 
1D9E  00        brk 
1D9F  00        brk 
1DA0  00        brk 
1DA1  00        brk 
1DA2  00        brk 
1DA3  00        brk 
1DA4  00        brk 
1DA5  00        brk 
1DA6  00        brk 
1DA7  00        brk 
1DA8  00        brk 
1DA9  00        brk 
1DAA  00        brk 
1DAB  00        brk 
1DAC  00        brk 
1DAD  00        brk 
1DAE  00        brk 
1DAF  00        brk 
1DB0  00        brk 
1DB1  00        brk 
1DB2  00        brk 
1DB3  00        brk 
1DB4  00        brk 
1DB5  00        brk 
1DB6  00        brk 
1DB7  00        brk 
1DB8  00        brk 
1DB9  00        brk 
1DBA  00        brk 
1DBB  00        brk 
1DBC  00        brk 
1DBD  00        brk 
1DBE  00        brk 
1DBF  00        brk 
1DC0  00        brk 
1DC1  00        brk 
1DC2  00        brk 
1DC3  00        brk 
1DC4  00        brk 
1DC5  00        brk 
1DC6  00        brk 
1DC7  00        brk 
1DC8  00        brk 
1DC9  00        brk 
1DCA  00        brk 
1DCB  00        brk 
1DCC  00        brk 
1DCD  00        brk 
1DCE  00        brk 
1DCF  00        brk 
1DD0  00        brk 
1DD1  00        brk 
1DD2  00        brk 
1DD3  00        brk 
1DD4  00        brk 
1DD5  00        brk 
1DD6  00        brk 
1DD7  00        brk 
1DD8  00        brk 
1DD9  00        brk 
1DDA  00        brk 
1DDB  00        brk 
1DDC  00        brk 
1DDD  00        brk 
1DDE  00        brk 
1DDF  00        brk 
1DE0  00        brk 
1DE1  00        brk 
1DE2  00        brk 
1DE3  00        brk 
1DE4  00        brk 
1DE5  00        brk 
1DE6  00        brk 
1DE7  00        brk 
1DE8  00        brk 
1DE9  00        brk 
1DEA  00        brk 
1DEB  00        brk 
1DEC  00        brk 
1DED  00        brk 
1DEE  00        brk 
1DEF  00        brk 
1DF0  00        brk 
1DF1  00        brk 
1DF2  00        brk 
1DF3  00        brk 
1DF4  00        brk 
1DF5  00        brk 
1DF6  00        brk 
1DF7  00        brk 
1DF8  00        brk 
1DF9  00        brk 
1DFA  00        brk 
1DFB  00        brk 
1DFC  00        brk 
1DFD  00        brk 
1DFE  00        brk 
1DFF  00        brk 
1E00  00        brk 
1E01  00        brk 
1E02  00        brk 
1E03  00        brk 
1E04  00        brk 
1E05  00        brk 
1E06  00        brk 
1E07  00        brk 
1E08  00        brk 
1E09  00        brk 
1E0A  00        brk 
1E0B  00        brk 
1E0C  00        brk 
1E0D  00        brk 
1E0E  00        brk 
1E0F  00        brk 
1E10  00        brk 
1E11  00        brk 
1E12  00        brk 
1E13  00        brk 
1E14  00        brk 
1E15  00        brk 
1E16  00        brk 
1E17  00        brk 
1E18  00        brk 
1E19  00        brk 
1E1A  00        brk 
1E1B  00        brk 
1E1C  00        brk 
1E1D  00        brk 
1E1E  00        brk 
1E1F  00        brk 
1E20  00        brk 
1E21  00        brk 
1E22  00        brk 
1E23  00        brk 
1E24  00        brk 
1E25  00        brk 
1E26  00        brk 
1E27  00        brk 
1E28  00        brk 
1E29  00        brk 
1E2A  00        brk 
1E2B  00        brk 
1E2C  00        brk 
1E2D  00        brk 
1E2E  00        brk 
1E2F  00        brk 
1E30  00        brk 
1E31  00        brk 
1E32  00        brk 
1E33  00        brk 
1E34  00        brk 
1E35  00        brk 
1E36  00        brk 
1E37  00        brk 
1E38  00        brk 
1E39  00        brk 
1E3A  00        brk 
1E3B  00        brk 
1E3C  00        brk 
1E3D  00        brk 
1E3E  00        brk 
1E3F  00        brk 
1E40  00        brk 
1E41  00        brk 
1E42  00        brk 
1E43  00        brk 
1E44  00        brk 
1E45  00        brk 
1E46  00        brk 
1E47  00        brk 
1E48  00        brk 
1E49  00        brk 
1E4A  00        brk 
1E4B  00        brk 
1E4C  00        brk 
1E4D  00        brk 
1E4E  00        brk 
1E4F  00        brk 
1E50  00        brk 
1E51  00        brk 
1E52  00        brk 
1E53  00        brk 
1E54  00        brk 
1E55  00        brk 
1E56  00        brk 
1E57  00        brk 
1E58  00        brk 
1E59  00        brk 
1E5A  00        brk 
1E5B  00        brk 
1E5C  00        brk 
1E5D  00        brk 
1E5E  00        brk 
1E5F  00        brk 
1E60  00        brk 
1E61  00        brk 
1E62  00        brk 
1E63  00        brk 
1E64  00        brk 
1E65  00        brk 
1E66  00        brk 
1E67  00        brk 
1E68  00        brk 
1E69  00        brk 
1E6A  00        brk 
1E6B  00        brk 
1E6C  00        brk 
1E6D  00        brk 
1E6E  00        brk 
1E6F  00        brk 
1E70  00        brk 
1E71  00        brk 
1E72  00        brk 
1E73  00        brk 
1E74  00        brk 
1E75  00        brk 
1E76  00        brk 
1E77  00        brk 
1E78  00        brk 
1E79  00        brk 
1E7A  00        brk 
1E7B  00        brk 
1E7C  00        brk 
1E7D  00        brk 
1E7E  00        brk 
1E7F  00        brk 
1E80  00        brk 
1E81  00        brk 
1E82  00        brk 
1E83  00        brk 
1E84  00        brk 
1E85  00        brk 
1E86  00        brk 
1E87  00        brk 
1E88  00        brk 
1E89  00        brk 
1E8A  00        brk 
1E8B  00        brk 
1E8C  00        brk 
1E8D  00        brk 
1E8E  00        brk 
1E8F  00        brk 
1E90  00        brk 
1E91  00        brk 
1E92  00        brk 
1E93  00        brk 
1E94  00        brk 
1E95  00        brk 
1E96  00        brk 
1E97  00        brk 
1E98  00        brk 
1E99  00        brk 
1E9A  00        brk 
1E9B  00        brk 
1E9C  00        brk 
1E9D  00        brk 
1E9E  00        brk 
1E9F  00        brk 
1EA0  00        brk 
1EA1  00        brk 
1EA2  00        brk 
1EA3  00        brk 
1EA4  00        brk 
1EA5  00        brk 
1EA6  00        brk 
1EA7  00        brk 
1EA8  00        brk 
1EA9  00        brk 
1EAA  00        brk 
1EAB  00        brk 
1EAC  00        brk 
1EAD  00        brk 
1EAE  00        brk 
1EAF  00        brk 
1EB0  00        brk 
1EB1  00        brk 
1EB2  00        brk 
1EB3  00        brk 
1EB4  00        brk 
1EB5  00        brk 
1EB6  00        brk 
1EB7  00        brk 
1EB8  00        brk 
1EB9  00        brk 
1EBA  00        brk 
1EBB  00        brk 
1EBC  00        brk 
1EBD  00        brk 
1EBE  00        brk 
1EBF  00        brk 
1EC0  00        brk 
1EC1  00        brk 
1EC2  00        brk 
1EC3  00        brk 
1EC4  00        brk 
1EC5  00        brk 
1EC6  00        brk 
1EC7  00        brk 
1EC8  00        brk 
1EC9  00        brk 
1ECA  00        brk 
1ECB  00        brk 
1ECC  00        brk 
1ECD  00        brk 
1ECE  00        brk 
1ECF  00        brk 
1ED0  00        brk 
1ED1  00        brk 
1ED2  00        brk 
1ED3  00        brk 
1ED4  00        brk 
1ED5  00        brk 
1ED6  00        brk 
1ED7  00        brk 
1ED8  00        brk 
1ED9  00        brk 
1EDA  00        brk 
1EDB  00        brk 
1EDC  00        brk 
1EDD  00        brk 
1EDE  00        brk 
1EDF  00        brk 
1EE0  00        brk 
1EE1  00        brk 
1EE2  00        brk 
1EE3  00        brk 
1EE4  00        brk 
1EE5  00        brk 
1EE6  00        brk 
1EE7  00        brk 
1EE8  00        brk 
1EE9  00        brk 
1EEA  00        brk 
1EEB  00        brk 
1EEC  00        brk 
1EED  00        brk 
1EEE  00        brk 
1EEF  00        brk 
1EF0  00        brk 
1EF1  00        brk 
1EF2  00        brk 
1EF3  00        brk 
1EF4  00        brk 
1EF5  00        brk 
1EF6  00        brk 
1EF7  00        brk 
1EF8  00        brk 
1EF9  00        brk 
1EFA  00        brk 
1EFB  00        brk 
1EFC  00        brk 
1EFD  00        brk 
1EFE  00        brk 
1EFF  00        brk 
1F00  00        brk 
1F01  00        brk 
1F02  00        brk 
1F03  00        brk 
1F04  00        brk 
1F05  00        brk 
1F06  00        brk 
1F07  00        brk 
1F08  00        brk 
1F09  00        brk 
1F0A  00        brk 
1F0B  00        brk 
1F0C  00        brk 
1F0D  00        brk 
1F0E  00        brk 
1F0F  00        brk 
1F10  00        brk 
1F11  00        brk 
1F12  00        brk 
1F13  00        brk 
1F14  00        brk 
1F15  00        brk 
1F16  00        brk 
1F17  00        brk 
1F18  00        brk 
1F19  00        brk 
1F1A  00        brk 
1F1B  00        brk 
1F1C  00        brk 
1F1D  00        brk 
1F1E  00        brk 
1F1F  00        brk 
1F20  00        brk 
1F21  00        brk 
1F22  00        brk 
1F23  00        brk 
1F24  00        brk 
1F25  00        brk 
1F26  00        brk 
1F27  00        brk 
1F28  00        brk 
1F29  00        brk 
1F2A  00        brk 
1F2B  00        brk 
1F2C  00        brk 
1F2D  00        brk 
1F2E  00        brk 
1F2F  00        brk 
1F30  00        brk 
1F31  00        brk 
1F32  00        brk 
1F33  00        brk 
1F34  00        brk 
1F35  00        brk 
1F36  00        brk 
1F37  00        brk 
1F38  00        brk 
1F39  00        brk 
1F3A  00        brk 
1F3B  00        brk 
1F3C  00        brk 
1F3D  00        brk 
1F3E  00        brk 
1F3F  00        brk 
1F40  00        brk 
1F41  00        brk 
1F42  00        brk 
1F43  00        brk 
1F44  00        brk 
1F45  00        brk 
1F46  00        brk 
1F47  00        brk 
1F48  00        brk 
1F49  00        brk 
1F4A  00        brk 
1F4B  00        brk 
1F4C  00        brk 
1F4D  00        brk 
1F4E  00        brk 
1F4F  00        brk 
1F50  00        brk 
1F51  00        brk 
1F52  00        brk 
1F53  00        brk 
1F54  00        brk 
1F55  00        brk 
1F56  00        brk 
1F57  00        brk 
1F58  00        brk 
1F59  00        brk 
1F5A  00        brk 
1F5B  00        brk 
1F5C  00        brk 
1F5D  00        brk 
1F5E  00        brk 
1F5F  00        brk 
1F60  00        brk 
1F61  00        brk 
1F62  00        brk 
1F63  00        brk 
1F64  00        brk 
1F65  00        brk 
1F66  00        brk 
1F67  00        brk 
1F68  00        brk 
1F69  00        brk 
1F6A  00        brk 
1F6B  00        brk 
1F6C  00        brk 
1F6D  00        brk 
1F6E  00        brk 
1F6F  00        brk 
1F70  00        brk 
1F71  00        brk 
1F72  00        brk 
1F73  00        brk 
1F74  00        brk 
1F75  00        brk 
1F76  00        brk 
1F77  00        brk 
1F78  00        brk 
1F79  00        brk 
1F7A  00        brk 
1F7B  00        brk 
1F7C  00        brk 
1F7D  00        brk 
1F7E  00        brk 
1F7F  00        brk 
1F80  00        brk 
1F81  00        brk 
1F82  00        brk 
1F83  00        brk 
1F84  00        brk 
1F85  00        brk 
1F86  00        brk 
1F87  00        brk 
1F88  00        brk 
1F89  00        brk 
1F8A  00        brk 
1F8B  00        brk 
1F8C  00        brk 
1F8D  00        brk 
1F8E  00        brk 
1F8F  00        brk 
1F90  00        brk 
1F91  00        brk 
1F92  00        brk 
1F93  00        brk 
1F94  00        brk 
1F95  00        brk 
1F96  00        brk 
1F97  00        brk 
1F98  00        brk 
1F99  00        brk 
1F9A  00        brk 
1F9B  00        brk 
1F9C  00        brk 
1F9D  00        brk 
1F9E  00        brk 
1F9F  00        brk 
1FA0  00        brk 
1FA1  00        brk 
1FA2  00        brk 
1FA3  00        brk 
1FA4  00        brk 
1FA5  00        brk 
1FA6  00        brk 
1FA7  00        brk 
1FA8  00        brk 
1FA9  00        brk 
1FAA  00        brk 
1FAB  00        brk 
1FAC  00        brk 
1FAD  00        brk 
1FAE  00        brk 
1FAF  00        brk 
1FB0  00        brk 
1FB1  00        brk 
1FB2  00        brk 
1FB3  00        brk 
1FB4  00        brk 
1FB5  00        brk 
1FB6  00        brk 
1FB7  00        brk 
1FB8  00        brk 
1FB9  00        brk 
1FBA  00        brk 
1FBB  00        brk 
1FBC  00        brk 
1FBD  00        brk 
1FBE  00        brk 
1FBF  00        brk 
1FC0  00        brk 
1FC1  00        brk 
1FC2  00        brk 
1FC3  00        brk 
1FC4  00        brk 
1FC5  00        brk 
1FC6  00        brk 
1FC7  00        brk 
1FC8  00        brk 
1FC9  00        brk 
1FCA  00        brk 
1FCB  00        brk 
1FCC  00        brk 
1FCD  00        brk 
1FCE  00        brk 
1FCF  00        brk 
1FD0  00        brk 
1FD1  00        brk 
1FD2  00        brk 
1FD3  00        brk 
1FD4  00        brk 
1FD5  00        brk 
1FD6  00        brk 
1FD7  00        brk 
1FD8  00        brk 
1FD9  00        brk 
1FDA  00        brk 
1FDB  00        brk 
1FDC  00        brk 
1FDD  00        brk 
1FDE  00        brk 
1FDF  00        brk 
1FE0  00        brk 
1FE1  00        brk 
1FE2  00        brk 
1FE3  00        brk 
1FE4  00        brk 
1FE5  00        brk 
1FE6  00        brk 
1FE7  00        brk 
1FE8  00        brk 
1FE9  00        brk 
1FEA  00        brk 
1FEB  00        brk 
1FEC  00        brk 
1FED  00        brk 
1FEE  00        brk 
1FEF  00        brk 
1FF0  00        brk 
1FF1  00        brk 
1FF2  00        brk 
1FF3  00        brk 
1FF4  00        brk 
1FF5  00        brk 
1FF6  00        brk 
1FF7  00        brk 
1FF8  00        brk 
1FF9  00        brk 
1FFA  00        brk 
1FFB  00        brk 
1FFC  00        brk 
1FFD  00        brk 
1FFE  00        brk 
1FFF  00        brk 
2000  CE 6D 24  dec $246D
2003  10 06     bpl $200B
2005  A9 09     lda #$09
2007  8D 6D 24  sta $246D
200A  60        rts 
200B  EE 7E 24  inc $247E
200E  A5 63     lda $63
2010  D0 03     bne $2015
2012  4C 96 2C  jmp $2C96
2015  A5 A2     lda $A2
2017  F0 03     beq $201C
2019  4C 96 2C  jmp $2C96
201C  A9 00     lda #$00
201E  8D 6F 24  sta $246F
2021  A9 00     lda #$00
2023  8D 17 D4  sta $D417
2026  A9 0F     lda #$0F
2028  8D 18 D4  sta $D418
202B  A2 02     ldx #$02
202D  CE 6B 24  dec $246B
2030  10 06     bpl $2038
2032  AD 6C 24  lda $246C
2035  8D 6B 24  sta $246B
2038  BD 4F 24  lda $244F,x
203B  85 FA     sta $FA
203D  A8        tay 
203E  AD 6B 24  lda $246B
2041  CD 6C 24  cmp $246C
2044  D0 15     bne $205B
2046  BD 65 25  lda $2565,x
2049  85 E0     sta $E0
204B  BD 68 25  lda $2568,x
204E  85 E1     sta $E1
2050  DE 58 24  dec $2458,x
2053  30 09     bmi $205E
2055  4C 58 21  jmp $2158
2058  4C 88 23  jmp $2388
205B  4C 76 21  jmp $2176
205E  BC 52 24  ldy $2452,x
2061  B1 E0     lda ($E0),y
2063  C9 FF     cmp #$FF
2065  F0 0A     beq $2071
2067  C9 FE     cmp #$FE
2069  D0 17     bne $2082
206B  20 96 2C  jsr $2C96
206E  4C 8E 23  jmp $238E
2071  A9 00     lda #$00
2073  9D 58 24  sta $2458,x
2076  9D 52 24  sta $2452,x
2079  9D 55 24  sta $2455,x
207C  4C 5E 20  jmp $205E
207F  4C 88 23  jmp $2388
2082  A8        tay 
2083  B9 6B 25  lda $256B,y
2086  85 E2     sta $E2
2088  B9 92 25  lda $2592,y
208B  85 E3     sta $E3
208D  A9 00     lda #$00
208F  9D 76 24  sta $2476,x
2092  BC 55 24  ldy $2455,x
2095  A9 FF     lda #$FF
2097  8D 64 24  sta $2464
209A  B1 E2     lda ($E2),y
209C  9D 5B 24  sta $245B,x
209F  8D 65 24  sta $2465
20A2  29 1F     and #$1F
20A4  9D 58 24  sta $2458,x
20A7  2C 65 24  bit $2465
20AA  70 46     bvs $20F2
20AC  FE 55 24  inc $2455,x
20AF  AD 65 24  lda $2465
20B2  10 1A     bpl $20CE
20B4  C8        iny 
20B5  B1 E2     lda ($E2),y
20B7  10 0F     bpl $20C8
20B9  9D 76 24  sta $2476,x
20BC  C8        iny 
20BD  B1 E2     lda ($E2),y
20BF  9D 79 24  sta $2479,x
20C2  FE 55 24  inc $2455,x
20C5  4C CB 20  jmp $20CB
20C8  9D 61 24  sta $2461,x
20CB  FE 55 24  inc $2455,x
20CE  C8        iny 
20CF  B1 E2     lda ($E2),y
20D1  95 F1     sta $F1,x
20D3  0A        asl a
20D4  A8        tay 
20D5  B9 8F 23  lda $238F,y
20D8  8D 66 24  sta $2466
20DB  B9 90 23  lda $2390,y
20DE  A4 FA     ldy $FA
20E0  99 01 D4  sta $D401,y
20E3  9D 70 24  sta $2470,x
20E6  AD 66 24  lda $2466
20E9  99 00 D4  sta $D400,y
20EC  9D 73 24  sta $2473,x
20EF  4C F5 20  jmp $20F5
20F2  CE 64 24  dec $2464
20F5  A4 FA     ldy $FA
20F7  BD 61 24  lda $2461,x
20FA  8E 67 24  stx $2467
20FD  0A        asl a
20FE  0A        asl a
20FF  0A        asl a
2100  AA        tax 
2101  BD 87 24  lda $2487,x
2104  8D 68 24  sta $2468
2107  BD 87 24  lda $2487,x
210A  2D 64 24  and $2464
210D  99 04 D4  sta $D404,y
2110  BD 85 24  lda $2485,x
2113  99 02 D4  sta $D402,y
2116  48        pha 
2117  BD 86 24  lda $2486,x
211A  99 03 D4  sta $D403,y
211D  48        pha 
211E  BD 88 24  lda $2488,x
2121  99 05 D4  sta $D405,y
2124  BD 89 24  lda $2489,x
2127  99 06 D4  sta $D406,y
212A  AE 67 24  ldx $2467
212D  A9 00     lda #$00
212F  95 F4     sta $F4,x
2131  95 F7     sta $F7,x
2133  68        pla 
2134  9D 82 24  sta $2482,x
2137  68        pla 
2138  9D 7F 24  sta $247F,x
213B  AD 68 24  lda $2468
213E  9D 5E 24  sta $245E,x
2141  FE 55 24  inc $2455,x
2144  BC 55 24  ldy $2455,x
2147  B1 E2     lda ($E2),y
2149  C9 FF     cmp #$FF
214B  D0 08     bne $2155
214D  A9 00     lda #$00
214F  9D 55 24  sta $2455,x
2152  FE 52 24  inc $2452,x
2155  4C 88 23  jmp $2388
2158  A4 FA     ldy $FA
215A  BD 5B 24  lda $245B,x
215D  29 20     and #$20
215F  D0 15     bne $2176
2161  BD 58 24  lda $2458,x
2164  D0 10     bne $2176
2166  BD 5E 24  lda $245E,x
2169  29 FE     and #$FE
216B  99 04 D4  sta $D404,y
216E  A9 00     lda #$00
2170  99 05 D4  sta $D405,y
2173  99 06 D4  sta $D406,y
2176  BD 61 24  lda $2461,x
2179  0A        asl a
217A  0A        asl a
217B  0A        asl a
217C  A8        tay 
217D  8C 6E 24  sty $246E
2180  B9 8C 24  lda $248C,y
2183  8D 7C 24  sta $247C
2186  B9 8B 24  lda $248B,y
2189  8D 6A 24  sta $246A
218C  B9 8A 24  lda $248A,y
218F  D0 03     bne $2194
2191  4C 27 22  jmp $2227
2194  48        pha 
2195  29 78     and #$78
2197  4A        lsr a
2198  4A        lsr a
2199  4A        lsr a
219A  95 EA     sta $EA,x
219C  68        pla 
219D  29 07     and #$07
219F  8D 69 24  sta $2469
21A2  B5 E7     lda $E7,x
21A4  10 08     bpl $21AE
21A6  D6 E4     dec $E4,x
21A8  D0 12     bne $21BC
21AA  F6 E7     inc $E7,x
21AC  10 0E     bpl $21BC
21AE  F6 E4     inc $E4,x
21B0  B5 EA     lda $EA,x
21B2  D5 E4     cmp $E4,x
21B4  B0 06     bcs $21BC
21B6  95 E4     sta $E4,x
21B8  D6 E7     dec $E7,x
21BA  D6 E4     dec $E4,x
21BC  B5 F1     lda $F1,x
21BE  0A        asl a
21BF  A8        tay 
21C0  38        sec 
21C1  B9 8F 23  lda $238F,y
21C4  F9 8D 23  sbc $238D,y
21C7  85 EF     sta $EF
21C9  B9 90 23  lda $2390,y
21CC  F9 8E 23  sbc $238E,y
21CF  CE 69 24  dec $2469
21D2  30 06     bmi $21DA
21D4  4A        lsr a
21D5  66 EF     ror $EF
21D7  4C CF 21  jmp $21CF
21DA  85 F0     sta $F0
21DC  B9 8F 23  lda $238F,y
21DF  85 ED     sta $ED
21E1  B9 90 23  lda $2390,y
21E4  85 EE     sta $EE
21E6  B5 EA     lda $EA,x
21E8  4A        lsr a
21E9  A8        tay 
21EA  88        dey 
21EB  30 10     bmi $21FD
21ED  38        sec 
21EE  A5 ED     lda $ED
21F0  E5 EF     sbc $EF
21F2  85 ED     sta $ED
21F4  A5 EE     lda $EE
21F6  E5 F0     sbc $F0
21F8  85 EE     sta $EE
21FA  4C EA 21  jmp $21EA
21FD  BD 5B 24  lda $245B,x
2200  29 1F     and #$1F
2202  C9 04     cmp #$04
2204  90 21     bcc $2227
2206  B4 E4     ldy $E4,x
2208  88        dey 
2209  30 10     bmi $221B
220B  18        clc 
220C  A5 ED     lda $ED
220E  65 EF     adc $EF
2210  85 ED     sta $ED
2212  A5 EE     lda $EE
2214  65 F0     adc $F0
2216  85 EE     sta $EE
2218  4C 08 22  jmp $2208
221B  A4 FA     ldy $FA
221D  A5 ED     lda $ED
221F  99 00 D4  sta $D400,y
2222  A5 EE     lda $EE
2224  99 01 D4  sta $D401,y
2227  AD 7C 24  lda $247C
222A  29 08     and #$08
222C  F0 14     beq $2242
222E  AC 6E 24  ldy $246E
2231  B9 85 24  lda $2485,y
2234  6D 6A 24  adc $246A
2237  99 85 24  sta $2485,y
223A  A4 FA     ldy $FA
223C  99 02 D4  sta $D402,y
223F  4C 9A 22  jmp $229A
2242  AD 6A 24  lda $246A
2245  F0 53     beq $229A
2247  A4 FA     ldy $FA
2249  29 0F     and #$0F
224B  D6 F7     dec $F7,x
224D  10 4B     bpl $229A
224F  95 F7     sta $F7,x
2251  AD 6A 24  lda $246A
2254  29 F0     and #$F0
2256  8D 7D 24  sta $247D
2259  B5 F4     lda $F4,x
225B  D0 19     bne $2276
225D  AD 7D 24  lda $247D
2260  18        clc 
2261  7D 7F 24  adc $247F,x
2264  48        pha 
2265  BD 82 24  lda $2482,x
2268  69 00     adc #$00
226A  29 0F     and #$0F
226C  48        pha 
226D  C9 0E     cmp #$0E
226F  D0 1B     bne $228C
2271  F6 F4     inc $F4,x
2273  4C 8C 22  jmp $228C
2276  38        sec 
2277  BD 7F 24  lda $247F,x
227A  ED 7D 24  sbc $247D
227D  48        pha 
227E  BD 82 24  lda $2482,x
2281  E9 00     sbc #$00
2283  29 0F     and #$0F
2285  48        pha 
2286  C9 08     cmp #$08
2288  D0 02     bne $228C
228A  D6 F4     dec $F4,x
228C  68        pla 
228D  9D 82 24  sta $2482,x
2290  99 03 D4  sta $D403,y
2293  68        pla 
2294  9D 7F 24  sta $247F,x
2297  99 02 D4  sta $D402,y
229A  A4 FA     ldy $FA
229C  BD 76 24  lda $2476,x
229F  F0 41     beq $22E2
22A1  29 7E     and #$7E
22A3  8D 67 24  sta $2467
22A6  BD 76 24  lda $2476,x
22A9  29 01     and #$01
22AB  F0 1C     beq $22C9
22AD  38        sec 
22AE  BD 73 24  lda $2473,x
22B1  ED 67 24  sbc $2467
22B4  9D 73 24  sta $2473,x
22B7  99 00 D4  sta $D400,y
22BA  BD 70 24  lda $2470,x
22BD  FD 79 24  sbc $2479,x
22C0  9D 70 24  sta $2470,x
22C3  99 01 D4  sta $D401,y
22C6  4C E2 22  jmp $22E2
22C9  18        clc 
22CA  BD 73 24  lda $2473,x
22CD  6D 67 24  adc $2467
22D0  9D 73 24  sta $2473,x
22D3  99 00 D4  sta $D400,y
22D6  BD 70 24  lda $2470,x
22D9  7D 79 24  adc $2479,x
22DC  9D 70 24  sta $2470,x
22DF  99 01 D4  sta $D401,y
22E2  AD 7C 24  lda $247C
22E5  29 01     and #$01
22E7  F0 34     beq $231D
22E9  BD 70 24  lda $2470,x
22EC  F0 2F     beq $231D
22EE  BD 58 24  lda $2458,x
22F1  F0 2A     beq $231D
22F3  BD 5B 24  lda $245B,x
22F6  29 1F     and #$1F
22F8  38        sec 
22F9  E9 01     sbc #$01
22FB  DD 58 24  cmp $2458,x
22FE  A4 FA     ldy $FA
2300  90 10     bcc $2312
2302  BD 70 24  lda $2470,x
2305  DE 70 24  dec $2470,x
2308  99 01 D4  sta $D401,y
230B  BD 5E 24  lda $245E,x
230E  29 FE     and #$FE
2310  D0 08     bne $231A
2312  BD 70 24  lda $2470,x
2315  99 01 D4  sta $D401,y
2318  A9 80     lda #$80
231A  99 04 D4  sta $D404,y
231D  AD 7C 24  lda $247C
2320  29 02     and #$02
2322  F0 21     beq $2345
2324  AD 7E 24  lda $247E
2327  29 03     and #$03
2329  D0 1A     bne $2345
232B  F6 F1     inc $F1,x
232D  B5 F1     lda $F1,x
232F  0A        asl a
2330  A8        tay 
2331  B9 8F 23  lda $238F,y
2334  8D 66 24  sta $2466
2337  B9 90 23  lda $2390,y
233A  A4 FA     ldy $FA
233C  99 01 D4  sta $D401,y
233F  AD 66 24  lda $2466
2342  99 00 D4  sta $D400,y
2345  AD 7C 24  lda $247C
2348  29 04     and #$04
234A  F0 3C     beq $2388
234C  AD 7C 24  lda $247C
234F  4A        lsr a
2350  4A        lsr a
2351  4A        lsr a
2352  4A        lsr a
2353  8D 6C 23  sta $236C
2356  A0 02     ldy #$02
2358  C9 0C     cmp #$0C
235A  F0 02     beq $235E
235C  A0 01     ldy #$01
235E  8C 65 23  sty $2365
2361  AD 7E 24  lda $247E
2364  29 04     and #$04
2366  D0 08     bne $2370
2368  B5 F1     lda $F1,x
236A  38        sec 
236B  E9 0C     sbc #$0C
236D  4C 72 23  jmp $2372
2370  B5 F1     lda $F1,x
2372  0A        asl a
2373  A8        tay 
2374  B9 8F 23  lda $238F,y
2377  8D 66 24  sta $2466
237A  B9 90 23  lda $2390,y
237D  A4 FA     ldy $FA
237F  99 01 D4  sta $D401,y
2382  AD 66 24  lda $2466
2385  99 00 D4  sta $D400,y
2388  CA        dex 
2389  30 03     bmi $238E
238B  4C 38 20  jmp $2038
238E  60        rts 
238F  16 01     asl $01,x
2391  27        .byte $27
2392  01 38     ora ($38,x)
2394  01 4B     ora ($4B,x)
2396  01 5F     ora ($5F,x)
2398  01 73     ora ($73,x)
239A  01 8A     ora ($8A,x)
239C  01 A1     ora ($A1,x)
239E  01 BA     ora ($BA,x)
23A0  01 D4     ora ($D4,x)
23A2  01 F0     ora ($F0,x)
23A4  01 0E     ora ($0E,x)
23A6  02        .byte $02
23A7  2D 02 4E  and $4E02
23AA  02        .byte $02
23AB  71 02     adc ($02),y
23AD  96 02     stx $02,y
23AF  BD 02 E7  lda $E702,x
23B2  02        .byte $02
23B3  13        .byte $13
23B4  03        .byte $03
23B5  42        .byte $42
23B6  03        .byte $03
23B7  74        .byte $74
23B8  03        .byte $03
23B9  A9 03     lda #$03
23BB  E0 03     cpx #$03
23BD  1B        .byte $1B
23BE  04        .byte $04
23BF  5A        .byte $5A
23C0  04        .byte $04
23C1  9B        .byte $9B
23C2  04        .byte $04
23C3  E2        .byte $E2
23C4  04        .byte $04
23C5  2C 05 7B  bit $7B05
23C8  05 CE     ora $CE
23CA  05 27     ora $27
23CC  06 85     asl $85
23CE  06 E8     asl $E8
23D0  06 51     asl $51
23D2  07        .byte $07
23D3  C1 07     cmp ($07,x)
23D5  37        .byte $37
23D6  08        php 
23D7  B4 08     ldy $08,x
23D9  37        .byte $37
23DA  09 C4     ora #$C4
23DC  09 57     ora #$57
23DE  0A        asl a
23DF  F5 0A     sbc $0A,x
23E1  9C        .byte $9C
23E2  0B        .byte $0B
23E3  4E 0C 09  lsr $090C
23E6  0D D0 0D  ora $0DD0
23E9  A3        .byte $A3
23EA  0E 82 0F  asl $0F82
23ED  6E 10 68  ror $6810
23F0  11 6E     ora ($6E),y
23F2  12        .byte $12
23F3  88        dey 
23F4  13        .byte $13
23F5  AF        .byte $AF
23F6  14        .byte $14
23F7  EB        .byte $EB
23F8  15 39     ora $39,x
23FA  17        .byte $17
23FB  9C        .byte $9C
23FC  18        clc 
23FD  13        .byte $13
23FE  1A        .byte $1A
23FF  A1 1B     lda ($1B,x)
2401  46 1D     lsr $1D
2403  04        .byte $04
2404  1F        .byte $1F
2405  DC        .byte $DC
2406  20 D0 22  jsr $22D0
2409  DC        .byte $DC
240A  24 10     bit $10
240C  27        .byte $27
240D  5E 29 D6  lsr $D629,x
2410  2B        .byte $2B
2411  72        .byte $72
2412  2E 38 31  rol $3138
2415  26 34     rol $34
2417  42        .byte $42
2418  37        .byte $37
2419  8C 3A 08  sty $083A
241C  3E B8 41  rol $41B8,x
241F  A0 45     ldy #$45
2421  B8        clv 
2422  49 20     eor #$20
2424  4E BC 52  lsr $52BC
2427  AC 57 E4  ldy $E457
242A  5C        .byte $5C
242B  70 62     bvs $248F
242D  4C 68 84  jmp $8468
2430  6E 18 75  ror $7518
2433  10 7C     bpl $24B1
2435  70 83     bvs $23BA
2437  40        rti 
2438  8B        .byte $8B
2439  70 93     bvs $23CE
243B  40        rti 
243C  9C        .byte $9C
243D  78        sei 
243E  A5 58     lda $58
2440  AF        .byte $AF
2441  C8        iny 
2442  B9 E0 C4  lda $C4E0,y
2445  98        tya 
2446  D0 08     bne $2450
2448  DD 30 EA  cmp $EA30,x
244B  20 F8 2E  jsr $2EF8
244E  FD 00 07  sbc $0700,x
2451  0E 00 00  asl $0000
2454  00        brk 
2455  04        .byte $04
2456  04        .byte $04
2457  04        .byte $04
2458  1B        .byte $1B
2459  1B        .byte $1B
245A  1B        .byte $1B
245B  7F        .byte $7F
245C  7F        .byte $7F
245D  7F        .byte $7F
245E  15 15     ora $15,x
2460  15 1A     ora $1A,x
2462  1A        .byte $1A
2463  1A        .byte $1A
2464  FE 7F 8C  inc $8C7F,x
2467  00        brk 
2468  15 FF     ora $FF,x
246A  00        brk 
246B  01 02     ora ($02,x)
246D  08        php 
246E  D0 01     bne $2471
2470  3A        .byte $3A
2471  3A        .byte $3A
2472  3A        .byte $3A
2473  8C 8C 8C  sty $8C8C
2476  00        brk 
2477  00        brk 
2478  00        brk 
2479  00        brk 
247A  00        brk 
247B  00        brk 
247C  00        brk 
247D  00        brk 
247E  5C        .byte $5C
247F  00        brk 
2480  00        brk 
2481  00        brk 
2482  06 06     asl $06
2484  06 00     asl $00
2486  08        php 
2487  41 09     eor ($09,x)
2489  08        php 
248A  00        brk 
248B  00        brk 
248C  01 00     ora ($00,x)
248E  03        .byte $03
248F  41 08     eor ($08,x)
2491  0F        .byte $0F
2492  00        brk 
2493  00        brk 
2494  05 40     ora $40
2496  01 41     ora ($41,x)
2498  09 F0     ora #$F0
249A  00        brk 
249B  00        brk 
249C  00        brk 
249D  00        brk 
249E  08        php 
249F  81 0F     sta ($0F,x)
24A1  0A        asl a
24A2  00        brk 
24A3  00        brk 
24A4  F5 00     sbc $00,x
24A6  05 15     ora $15
24A8  0F        .byte $0F
24A9  FF        .byte $FF
24AA  00        brk 
24AB  00        brk 
24AC  02        .byte $02
24AD  00        brk 
24AE  04        .byte $04
24AF  41 08     eor ($08,x)
24B1  00        brk 
24B2  00        brk 
24B3  50 54     bvc $2509
24B5  00        brk 
24B6  08        php 
24B7  41 2A     eor ($2A,x)
24B9  9F        .byte $9F
24BA  22        .byte $22
24BB  30 00     bmi $24BD
24BD  00        brk 
24BE  02        .byte $02
24BF  41 08     eor ($08,x)
24C1  0A        asl a
24C2  00        brk 
24C3  40        rti 
24C4  05 80     ora $80
24C6  01 41     ora ($41,x)
24C8  08        php 
24C9  0A        asl a
24CA  00        brk 
24CB  20 35 40  jsr $4035
24CE  01 41     ora ($41,x)
24D0  1C        .byte $1C
24D1  DA        .byte $DA
24D2  22        .byte $22
24D3  40        rti 
24D4  00        brk 
24D5  00        brk 
24D6  04        .byte $04
24D7  81 59     sta ($59,x)
24D9  00        brk 
24DA  00        brk 
24DB  00        brk 
24DC  C6 00     dec $00
24DE  04        .byte $04
24DF  41 07     eor ($07,x)
24E1  DF        .byte $DF
24E2  00        brk 
24E3  00        brk 
24E4  05 00     ora $00
24E6  02        .byte $02
24E7  41 4D     eor ($4D,x)
24E9  8F        .byte $8F
24EA  33        .byte $33
24EB  20 00 20  jsr $2000
24EE  00        brk 
24EF  41 0A     eor ($0A,x)
24F1  80        .byte $80
24F2  00        brk 
24F3  20 E6 00  jsr $00E6
24F6  0D 41 0F  ora $0F41
24F9  00        brk 
24FA  00        brk 
24FB  A0 44     ldy #$44
24FD  00        brk 
24FE  0D 41 0F  ora $0F41
2501  00        brk 
2502  00        brk 
2503  A0 34     ldy #$34
2505  00        brk 
2506  0D 41 0F  ora $0F41
2509  00        brk 
250A  00        brk 
250B  A0 24     ldy #$24
250D  00        brk 
250E  0D 41 0F  ora $0F41
2511  00        brk 
2512  00        brk 
2513  A0 54     ldy #$54
2515  00        brk 
2516  04        .byte $04
2517  41 0A     eor ($0A,x)
2519  0A        asl a
251A  00        brk 
251B  90 55     bcc $2572
251D  80        .byte $80
251E  08        php 
251F  15 0F     ora $0F,x
2521  FF        .byte $FF
2522  00        brk 
2523  00        brk 
2524  03        .byte $03
2525  00        brk 
2526  04        .byte $04
2527  41 9F     eor ($9F,x)
2529  FF        .byte $FF
252A  13        .byte $13
252B  00        brk 
252C  00        brk 
252D  40        rti 
252E  00        brk 
252F  41 0F     eor ($0F,x)
2531  FF        .byte $FF
2532  11 13     ora ($13),y
2534  00        brk 
2535  A0 01     ldy #$01
2537  41 0D     eor ($0D,x)
2539  FF        .byte $FF
253A  10 10     bpl $254C
253C  00        brk 
253D  A0 0A     ldy #$0A
253F  15 C0     ora $C0,x
2541  8D 00 00  sta $0000
2544  F6 A0     inc $A0,x
2546  0A        asl a
2547  81 08     sta ($08,x)
2549  08        php 
254A  00        brk 
254B  00        brk 
254C  01 00     ora ($00,x)
254E  06 41     asl $41
2550  0F        .byte $0F
2551  0B        .byte $0B
2552  00        brk 
2553  80        .byte $80
2554  C5 00     cmp $00
2556  06 15     asl $15
2558  2F        .byte $2F
2559  FD 30 00  sbc $0030,x
255C  00        brk 
255D  00        brk 
255E  08        php 
255F  43        .byte $43
2560  0F        .byte $0F
2561  FD 00 00  sbc $0000,x
2564  46 B9     lsr $B9
2566  57        .byte $57
2567  EF        .byte $EF
2568  25 26     and $26
256A  26 19     rol $19
256C  50 FD     bvc $256B
256E  6E 8C AA  ror $AA8C
2571  1B        .byte $1B
2572  9D C8 E7  sta $E7C8,x
2575  22        .byte $22
2576  EF        .byte $EF
2577  02        .byte $02
2578  15 28     ora $28,x
257A  D3        .byte $D3
257B  35 3B     and $3B,x
257D  4E 5A 79  lsr $795A
2580  B6 D5     ldx $D5,y
2582  F4        .byte $F4
2583  13        .byte $13
2584  7D A6 CF  adc $CFA6,x
2587  4E 86 73  lsr $7386
258A  8B        .byte $8B
258B  CC 1F 44  cpy $441F
258E  7A        .byte $7A
258F  81 88     sta ($88,x)
2591  8F        .byte $8F
2592  27        .byte $27
2593  2A        rol a
2594  28        plp 
2595  2A        rol a
2596  2A        rol a
2597  2A        rol a
2598  27        .byte $27
2599  27        .byte $27
259A  2A        rol a
259B  2A        rol a
259C  29 2A     and #$2A
259E  2B        .byte $2B
259F  2B        .byte $2B
25A0  2B        .byte $2B
25A1  27        .byte $27
25A2  29 2B     and #$2B
25A4  28        plp 
25A5  29 29     and #$29
25A7  29 29     and #$29
25A9  29 2A     and #$2A
25AB  28        plp 
25AC  28        plp 
25AD  28        plp 
25AE  2B        .byte $2B
25AF  2B        .byte $2B
25B0  2B        .byte $2B
25B1  2B        .byte $2B
25B2  2B        .byte $2B
25B3  2C 2C 2C  bit $2C2C
25B6  2C 2C 2C  bit $2C2C
25B9  26 1D     rol $1D
25BB  1D 1D 1D  ora $1D1D,x
25BE  09 09     ora #$09
25C0  09 09     ora #$09
25C2  09 09     ora #$09
25C4  09 09     ora #$09
25C6  09 09     ora #$09
25C8  09 09     ora #$09
25CA  09 09     ora #$09
25CC  09 09     ora #$09
25CE  0B        .byte $0B
25CF  0B        .byte $0B
25D0  0B        .byte $0B
25D1  0B        .byte $0B
25D2  1A        .byte $1A
25D3  01 05     ora ($05,x)
25D5  04        .byte $04
25D6  03        .byte $03
25D7  01 05     ora ($05,x)
25D9  04        .byte $04
25DA  03        .byte $03
25DB  01 05     ora ($05,x)
25DD  04        .byte $04
25DE  03        .byte $03
25DF  01 05     ora ($05,x)
25E1  04        .byte $04
25E2  03        .byte $03
25E3  0B        .byte $0B
25E4  0C        .byte $0C
25E5  0D 0E 0B  ora $0B0E
25E8  0C        .byte $0C
25E9  0D 0E 0C  ora $0C0E
25EC  0C        .byte $0C
25ED  0E 0E 11  asl $110E
25F0  11 0D     ora ($0D),y
25F2  0D 0B 0B  ora $0B0B
25F5  0E 0E 11  asl $110E
25F8  11 0D     ora ($0D),y
25FA  0D 1A 01  ora $011A
25FD  05 04     ora $04
25FF  03        .byte $03
2600  01 05     ora ($05,x)
2602  04        .byte $04
2603  03        .byte $03
2604  01 05     ora ($05,x)
2606  04        .byte $04
2607  03        .byte $03
2608  01 05     ora ($05,x)
260A  04        .byte $04
260B  03        .byte $03
260C  1A        .byte $1A
260D  1F        .byte $1F
260E  1F        .byte $1F
260F  1F        .byte $1F
2610  1F        .byte $1F
2611  1F        .byte $1F
2612  1F        .byte $1F
2613  1F        .byte $1F
2614  1F        .byte $1F
2615  1F        .byte $1F
2616  1F        .byte $1F
2617  1F        .byte $1F
2618  1F        .byte $1F
2619  1B        .byte $1B
261A  0B        .byte $0B
261B  0C        .byte $0C
261C  0D 0E 0B  ora $0B0E
261F  0C        .byte $0C
2620  0D 0E 0C  ora $0C0E
2623  0C        .byte $0C
2624  0E 0E 11  asl $110E
2627  11 0D     ora ($0D),y
2629  0D 0B 0B  ora $0B0B
262C  0E 0E 11  asl $110E
262F  11 0D     ora ($0D),y
2631  0D 1A 01  ora $011A
2634  05 04     ora $04
2636  03        .byte $03
2637  01 05     ora ($05,x)
2639  04        .byte $04
263A  03        .byte $03
263B  01 05     ora ($05,x)
263D  04        .byte $04
263E  03        .byte $03
263F  01 05     ora ($05,x)
2641  04        .byte $04
2642  03        .byte $03
2643  01 05     ora ($05,x)
2645  04        .byte $04
2646  03        .byte $03
2647  01 05     ora ($05,x)
2649  04        .byte $04
264A  03        .byte $03
264B  01 05     ora ($05,x)
264D  04        .byte $04
264E  03        .byte $03
264F  01 05     ora ($05,x)
2651  04        .byte $04
2652  03        .byte $03
2653  19 25 24  ora $2425,y
2656  FF        .byte $FF
2657  26 26     rol $26
2659  26 0A     rol $0A
265B  0A        asl a
265C  0A        asl a
265D  0A        asl a
265E  0A        asl a
265F  0A        asl a
2660  0A        asl a
2661  0A        asl a
2662  02        .byte $02
2663  02        .byte $02
2664  02        .byte $02
2665  02        .byte $02
2666  02        .byte $02
2667  02        .byte $02
2668  02        .byte $02
2669  02        .byte $02
266A  02        .byte $02
266B  02        .byte $02
266C  02        .byte $02
266D  02        .byte $02
266E  1B        .byte $1B
266F  02        .byte $02
2670  02        .byte $02
2671  02        .byte $02
2672  02        .byte $02
2673  02        .byte $02
2674  02        .byte $02
2675  02        .byte $02
2676  02        .byte $02
2677  02        .byte $02
2678  02        .byte $02
2679  02        .byte $02
267A  02        .byte $02
267B  02        .byte $02
267C  02        .byte $02
267D  02        .byte $02
267E  02        .byte $02
267F  10 10     bpl $2691
2681  10 10     bpl $2693
2683  10 10     bpl $2695
2685  10 10     bpl $2697
2687  13        .byte $13
2688  13        .byte $13
2689  14        .byte $14
268A  13        .byte $13
268B  13        .byte $13
268C  15 15     ora $15,x
268E  16 16     asl $16,x
2690  17        .byte $17
2691  17        .byte $17
2692  16 16     asl $16,x
2694  18        clc 
2695  1B        .byte $1B
2696  02        .byte $02
2697  02        .byte $02
2698  02        .byte $02
2699  02        .byte $02
269A  02        .byte $02
269B  02        .byte $02
269C  02        .byte $02
269D  02        .byte $02
269E  02        .byte $02
269F  02        .byte $02
26A0  02        .byte $02
26A1  02        .byte $02
26A2  02        .byte $02
26A3  02        .byte $02
26A4  02        .byte $02
26A5  02        .byte $02
26A6  1B        .byte $1B
26A7  20 20 20  jsr $2020
26AA  20 20 20  jsr $2020
26AD  20 20 20  jsr $2020
26B0  20 20 20  jsr $2020
26B3  1A        .byte $1A
26B4  10 10     bpl $26C6
26B6  10 10     bpl $26C8
26B8  10 10     bpl $26CA
26BA  10 10     bpl $26CC
26BC  13        .byte $13
26BD  13        .byte $13
26BE  14        .byte $14
26BF  13        .byte $13
26C0  13        .byte $13
26C1  15 15     ora $15,x
26C3  16 16     asl $16,x
26C5  17        .byte $17
26C6  17        .byte $17
26C7  16 16     asl $16,x
26C9  18        clc 
26CA  1B        .byte $1B
26CB  02        .byte $02
26CC  02        .byte $02
26CD  02        .byte $02
26CE  02        .byte $02
26CF  02        .byte $02
26D0  02        .byte $02
26D1  02        .byte $02
26D2  02        .byte $02
26D3  02        .byte $02
26D4  02        .byte $02
26D5  02        .byte $02
26D6  02        .byte $02
26D7  02        .byte $02
26D8  02        .byte $02
26D9  02        .byte $02
26DA  02        .byte $02
26DB  02        .byte $02
26DC  02        .byte $02
26DD  02        .byte $02
26DE  02        .byte $02
26DF  02        .byte $02
26E0  02        .byte $02
26E1  02        .byte $02
26E2  02        .byte $02
26E3  02        .byte $02
26E4  02        .byte $02
26E5  02        .byte $02
26E6  02        .byte $02
26E7  02        .byte $02
26E8  02        .byte $02
26E9  02        .byte $02
26EA  02        .byte $02
26EB  1A        .byte $1A
26EC  24 24     bit $24
26EE  FF        .byte $FF
26EF  26 1C     rol $1C
26F1  1C        .byte $1C
26F2  1E 08 08  asl $0808,x
26F5  08        php 
26F6  08        php 
26F7  08        php 
26F8  08        php 
26F9  08        php 
26FA  08        php 
26FB  19 07 06  ora $0607,y
26FE  06 0F     asl $0F
2700  12        .byte $12
2701  19 07 06  ora $0607,y
2704  06 19     asl $19
2706  1D 1D 21  ora $211D,x
2709  08        php 
270A  08        php 
270B  08        php 
270C  08        php 
270D  19 0F 12  ora $120F,y
2710  19 07 22  ora $2207,y
2713  22        .byte $22
2714  22        .byte $22
2715  1B        .byte $1B
2716  23        .byte $23
2717  24 FF     bit $FF
2719  5F        .byte $5F
271A  FF        .byte $FF
271B  81 05     sta ($05,x)
271D  45 01     eor $01
271F  45 01     eor $01
2721  45 01     eor $01
2723  45 01     eor $01
2725  4C 01 4C  jmp $4C01
2728  01 45     ora ($45,x)
272A  01 45     ora ($45,x)
272C  01 48     ora ($48,x)
272E  01 48     ora ($48,x)
2730  01 4C     ora ($4C,x)
2732  01 4C     ora ($4C,x)
2734  01 45     ora ($45,x)
2736  01 45     ora ($45,x)
2738  01 4C     ora ($4C,x)
273A  01 4C     ora ($4C,x)
273C  01 4F     ora ($4F,x)
273E  01 4F     ora ($4F,x)
2740  01 4F     ora ($4F,x)
2742  01 4F     ora ($4F,x)
2744  01 4F     ora ($4F,x)
2746  01 4F     ora ($4F,x)
2748  01 4D     ora ($4D,x)
274A  01 4D     ora ($4D,x)
274C  01 4D     ora ($4D,x)
274E  01 4D     ora ($4D,x)
2750  01 4D     ora ($4D,x)
2752  01 4D     ora ($4D,x)
2754  01 4C     ora ($4C,x)
2756  01 4C     ora ($4C,x)
2758  01 4C     ora ($4C,x)
275A  01 4C     ora ($4C,x)
275C  01 48     ora ($48,x)
275E  01 48     ora ($48,x)
2760  01 48     ora ($48,x)
2762  01 48     ora ($48,x)
2764  01 4D     ora ($4D,x)
2766  01 4D     ora ($4D,x)
2768  01 45     ora ($45,x)
276A  01 45     ora ($45,x)
276C  01 48     ora ($48,x)
276E  01 48     ora ($48,x)
2770  01 4D     ora ($4D,x)
2772  01 4D     ora ($4D,x)
2774  01 45     ora ($45,x)
2776  01 45     ora ($45,x)
2778  01 4D     ora ($4D,x)
277A  01 4D     ora ($4D,x)
277C  01 4A     ora ($4A,x)
277E  01 4A     ora ($4A,x)
2780  01 4A     ora ($4A,x)
2782  01 4A     ora ($4A,x)
2784  01 4A     ora ($4A,x)
2786  01 4A     ora ($4A,x)
2788  01 48     ora ($48,x)
278A  01 48     ora ($48,x)
278C  01 48     ora ($48,x)
278E  01 48     ora ($48,x)
2790  01 48     ora ($48,x)
2792  01 48     ora ($48,x)
2794  01 4A     ora ($4A,x)
2796  01 4A     ora ($4A,x)
2798  01 4A     ora ($4A,x)
279A  01 4A     ora ($4A,x)
279C  FF        .byte $FF
279D  8B        .byte $8B
279E  06 39     asl $39
27A0  0B        .byte $0B
27A1  3B        .byte $3B
27A2  07        .byte $07
27A3  3C        .byte $3C
27A4  0B        .byte $0B
27A5  40        rti 
27A6  0B        .byte $0B
27A7  3E 07 3C  rol $3C07,x
27AA  0B        .byte $0B
27AB  39 0B 3C  and $3C0B,y
27AE  07        .byte $07
27AF  41 07     eor ($07,x)
27B1  3E 07 3E  rol $3E07,x
27B4  03        .byte $03
27B5  3C        .byte $3C
27B6  0B        .byte $0B
27B7  3E 0B 39  rol $390B,x
27BA  0B        .byte $0B
27BB  3C        .byte $3C
27BC  07        .byte $07
27BD  40        rti 
27BE  0B        .byte $0B
27BF  43        .byte $43
27C0  0B        .byte $0B
27C1  41 07     eor ($07,x)
27C3  40        rti 
27C4  0B        .byte $0B
27C5  3C        .byte $3C
27C6  0B        .byte $0B
27C7  40        rti 
27C8  07        .byte $07
27C9  41 07     eor ($07,x)
27CB  3E 07 3E  rol $3E07,x
27CE  03        .byte $03
27CF  3C        .byte $3C
27D0  0B        .byte $0B
27D1  3B        .byte $3B
27D2  FF        .byte $FF
27D3  83        .byte $83
27D4  03        .byte $03
27D5  40        rti 
27D6  83        .byte $83
27D7  09 40     ora #$40
27D9  01 3E     ora ($3E,x)
27DB  03        .byte $03
27DC  3C        .byte $3C
27DD  09 39     ora #$39
27DF  03        .byte $03
27E0  37        .byte $37
27E1  03        .byte $03
27E2  39 83 03  and $0383,y
27E5  40        rti 
27E6  83        .byte $83
27E7  09 40     ora #$40
27E9  01 3E     ora ($3E,x)
27EB  03        .byte $03
27EC  3C        .byte $3C
27ED  01 3E     ora ($3E,x)
27EF  81 0A     sta ($0A,x)
27F1  3E 01 3E  rol $3E01,x
27F4  01 3E     ora ($3E,x)
27F6  01 3E     ora ($3E,x)
27F8  01 3E     ora ($3E,x)
27FA  01 3E     ora ($3E,x)
27FC  01 3E     ora ($3E,x)
27FE  01 3E     ora ($3E,x)
2800  83        .byte $83
2801  03        .byte $03
2802  40        rti 
2803  83        .byte $83
2804  09 3E     ora #$3E
2806  01 3C     ora ($3C,x)
2808  03        .byte $03
2809  3B        .byte $3B
280A  09 3C     ora #$3C
280C  03        .byte $03
280D  3B        .byte $3B
280E  03        .byte $03
280F  39 1F 37  and $371F,y
2812  83        .byte $83
2813  03        .byte $03
2814  40        rti 
2815  83        .byte $83
2816  09 40     ora #$40
2818  01 3E     ora ($3E,x)
281A  03        .byte $03
281B  3C        .byte $3C
281C  09 39     ora #$39
281E  03        .byte $03
281F  3C        .byte $3C
2820  03        .byte $03
2821  40        rti 
2822  83        .byte $83
2823  03        .byte $03
2824  40        rti 
2825  83        .byte $83
2826  09 45     ora #$45
2828  01 43     ora ($43,x)
282A  03        .byte $03
282B  41 05     eor ($05,x)
282D  3E 81 0A  rol $0A81,x
2830  3E 01 3E  rol $3E01,x
2833  01 3E     ora ($3E,x)
2835  01 3E     ora ($3E,x)
2837  01 3E     ora ($3E,x)
2839  01 3E     ora ($3E,x)
283B  83        .byte $83
283C  03        .byte $03
283D  40        rti 
283E  83        .byte $83
283F  09 43     ora #$43
2841  01 41     ora ($41,x)
2843  03        .byte $03
2844  40        rti 
2845  09 41     ora #$41
2847  07        .byte $07
2848  43        .byte $43
2849  0D 41 11  ora $1141
284C  40        rti 
284D  FF        .byte $FF
284E  BF        .byte $BF
284F  0C        .byte $0C
2850  3E 4F 07  rol $074F,x
2853  40        rti 
2854  07        .byte $07
2855  41 3F     eor ($3F,x)
2857  3C        .byte $3C
2858  5F        .byte $5F
2859  3F        .byte $3F
285A  3C        .byte $3C
285B  4F        .byte $4F
285C  07        .byte $07
285D  3E 07 40  rol $4007,x
2860  1F        .byte $1F
2861  3B        .byte $3B
2862  9F        .byte $9F
2863  0D 37 BF  ora $BF37
2866  0C        .byte $0C
2867  3C        .byte $3C
2868  4F        .byte $4F
2869  07        .byte $07
286A  40        rti 
286B  07        .byte $07
286C  41 3F     eor ($3F,x)
286E  40        rti 
286F  5F        .byte $5F
2870  3F        .byte $3F
2871  41 4F     eor ($4F,x)
2873  07        .byte $07
2874  43        .byte $43
2875  07        .byte $07
2876  45 1F     eor $1F
2878  43        .byte $43
2879  9F        .byte $9F
287A  0D 37 FF  ora $FF37
287D  83        .byte $83
287E  12        .byte $12
287F  39 03 39  and $3903,y
2882  03        .byte $03
2883  39 03 39  and $3903,y
2886  01 39     ora ($39,x)
2888  01 39     ora ($39,x)
288A  03        .byte $03
288B  39 03 39  and $3903,y
288E  01 39     ora ($39,x)
2890  03        .byte $03
2891  39 01 39  and $3901,y
2894  03        .byte $03
2895  39 03 39  and $3903,y
2898  03        .byte $03
2899  39 07 39  and $3907,y
289C  81 0A     sta ($0A,x)
289E  40        rti 
289F  01 3C     ora ($3C,x)
28A1  01 39     ora ($39,x)
28A3  01 36     ora ($36,x)
28A5  FF        .byte $FF
28A6  83        .byte $83
28A7  02        .byte $02
28A8  15 03     ora $03,x
28AA  15 03     ora $03,x
28AC  15 03     ora $03,x
28AE  15 01     ora $01,x
28B0  15 01     ora $01,x
28B2  15 03     ora $03,x
28B4  15 03     ora $03,x
28B6  15 01     ora $01,x
28B8  15 03     ora $03,x
28BA  15 01     ora $01,x
28BC  15 03     ora $03,x
28BE  15 03     ora $03,x
28C0  15 03     ora $03,x
28C2  15 07     ora $07,x
28C4  15 81     ora $81,x
28C6  04        .byte $04
28C7  45 01     eor $01
28C9  45 01     eor $01
28CB  45 01     eor $01
28CD  45 FF     eor $FF
28CF  83        .byte $83
28D0  00        brk 
28D1  2D 83 13  and $1383
28D4  45 03     eor $03
28D6  45 83     eor $83
28D8  00        brk 
28D9  2D 01 2D  and $2D01
28DC  81 13     sta ($13,x)
28DE  45 03     eor $03
28E0  45 03     eor $03
28E2  45 81     eor $81
28E4  00        brk 
28E5  2D 03 2D  and $2D03
28E8  81 13     sta ($13,x)
28EA  45 03     eor $03
28EC  43        .byte $43
28ED  03        .byte $03
28EE  43        .byte $43
28EF  03        .byte $03
28F0  43        .byte $43
28F1  07        .byte $07
28F2  40        rti 
28F3  81 00     sta ($00,x)
28F5  2D 01 2D  and $2D01
28F8  01 2D     ora ($2D,x)
28FA  01 2D     ora ($2D,x)
28FC  FF        .byte $FF
28FD  83        .byte $83
28FE  00        brk 
28FF  2D 81 01  and $0181
2902  34        .byte $34
2903  01 39     ora ($39,x)
2905  81 04     sta ($04,x)
2907  45 81     eor $81
2909  01 3C     ora ($3C,x)
290B  01 40     ora ($40,x)
290D  81 00     sta ($00,x)
290F  2D 03 2D  and $2D03
2912  81 01     sta ($01,x)
2914  39 01 39  and $3901,y
2917  81 04     sta ($04,x)
2919  46 81     lsr $81
291B  01 40     ora ($40,x)
291D  01 3E     ora ($3E,x)
291F  01 3C     ora ($3C,x)
2921  FF        .byte $FF
2922  83        .byte $83
2923  00        brk 
2924  2D 43 81  and $8143
2927  04        .byte $04
2928  45 43     eor $43
292A  81 00     sta ($00,x)
292C  2D 03 2D  and $2D03
292F  43        .byte $43
2930  81 04     sta ($04,x)
2932  46 45     lsr $45
2934  FF        .byte $FF
2935  83        .byte $83
2936  00        brk 
2937  2D 81 0B  and $0B81
293A  28        plp 
293B  01 2B     ora ($2B,x)
293D  81 04     sta ($04,x)
293F  45 81     eor $81
2941  0B        .byte $0B
2942  30 01     bmi $2945
2944  2D 81 00  and $0081
2947  2D 03 2D  and $2D03
294A  81 0B     sta ($0B,x)
294C  2B        .byte $2B
294D  01 2D     ora ($2D,x)
294F  81 04     sta ($04,x)
2951  46 81     lsr $81
2953  0B        .byte $0B
2954  30 01     bmi $2957
2956  2D 01 2B  and $2B01
2959  FF        .byte $FF
295A  83        .byte $83
295B  00        brk 
295C  2D 83 0E  and $0E83
295F  39 81 04  and $0481,y
2962  45 83     eor $83
2964  0E 39 81  asl $8139
2967  00        brk 
2968  2D 03 2D  and $2D03
296B  81 0E     sta ($0E,x)
296D  39 01 2D  and $2D01,y
2970  81 04     sta ($04,x)
2972  46 83     lsr $83
2974  0E 39 01  asl $0139
2977  39 FF 83  and $83FF,y
297A  00        brk 
297B  2D 83 10  and $1083
297E  37        .byte $37
297F  81 04     sta ($04,x)
2981  45 83     eor $83
2983  10 37     bpl $29BC
2985  81 00     sta ($00,x)
2987  2D 03 2D  and $2D03
298A  81 10     sta ($10,x)
298C  37        .byte $37
298D  01 2D     ora ($2D,x)
298F  81 04     sta ($04,x)
2991  46 83     lsr $83
2993  10 37     bpl $29CC
2995  01 37     ora ($37,x)
2997  83        .byte $83
2998  00        brk 
2999  2D 83 0F  and $0F83
299C  37        .byte $37
299D  81 04     sta ($04,x)
299F  45 83     eor $83
29A1  0F        .byte $0F
29A2  37        .byte $37
29A3  81 00     sta ($00,x)
29A5  2D 03 2D  and $2D03
29A8  81 0F     sta ($0F,x)
29AA  37        .byte $37
29AB  01 2D     ora ($2D,x)
29AD  81 04     sta ($04,x)
29AF  46 83     lsr $83
29B1  0F        .byte $0F
29B2  37        .byte $37
29B3  01 37     ora ($37,x)
29B5  FF        .byte $FF
29B6  83        .byte $83
29B7  00        brk 
29B8  2D 83 0E  and $0E83
29BB  3B        .byte $3B
29BC  81 04     sta ($04,x)
29BE  45 83     eor $83
29C0  0E 3B 81  asl $813B
29C3  00        brk 
29C4  2D 03 2D  and $2D03
29C7  81 0E     sta ($0E,x)
29C9  3B        .byte $3B
29CA  01 2D     ora ($2D,x)
29CC  81 04     sta ($04,x)
29CE  46 83     lsr $83
29D0  0E 3B 01  asl $013B
29D3  3B        .byte $3B
29D4  FF        .byte $FF
29D5  83        .byte $83
29D6  00        brk 
29D7  2D 83 0F  and $0F83
29DA  3C        .byte $3C
29DB  81 04     sta ($04,x)
29DD  45 83     eor $83
29DF  0F        .byte $0F
29E0  3C        .byte $3C
29E1  81 00     sta ($00,x)
29E3  2D 03 2D  and $2D03
29E6  81 0F     sta ($0F,x)
29E8  3C        .byte $3C
29E9  01 2D     ora ($2D,x)
29EB  81 04     sta ($04,x)
29ED  46 83     lsr $83
29EF  0F        .byte $0F
29F0  3C        .byte $3C
29F1  01 3C     ora ($3C,x)
29F3  FF        .byte $FF
29F4  83        .byte $83
29F5  00        brk 
29F6  2D 83 11  and $1183
29F9  3C        .byte $3C
29FA  81 04     sta ($04,x)
29FC  45 83     eor $83
29FE  11 3C     ora ($3C),y
2A00  81 00     sta ($00,x)
2A02  2D 03 2D  and $2D03
2A05  81 11     sta ($11,x)
2A07  3C        .byte $3C
2A08  01 2D     ora ($2D,x)
2A0A  81 04     sta ($04,x)
2A0C  46 83     lsr $83
2A0E  11 3C     ora ($3C),y
2A10  01 3C     ora ($3C,x)
2A12  FF        .byte $FF
2A13  83        .byte $83
2A14  00        brk 
2A15  2D 83 10  and $1083
2A18  3E 81 04  rol $0481,x
2A1B  45 83     eor $83
2A1D  10 3E     bpl $2A5D
2A1F  81 00     sta ($00,x)
2A21  2D 03 2D  and $2D03
2A24  81 10     sta ($10,x)
2A26  3E 01 2D  rol $2D01,x
2A29  81 04     sta ($04,x)
2A2B  46 83     lsr $83
2A2D  10 3E     bpl $2A6D
2A2F  01 3E     ora ($3E,x)
2A31  83        .byte $83
2A32  00        brk 
2A33  2D 83 0F  and $0F83
2A36  3E 81 04  rol $0481,x
2A39  45 83     eor $83
2A3B  0F        .byte $0F
2A3C  3E 81 00  rol $0081,x
2A3F  2D 03 2D  and $2D03
2A42  81 0F     sta ($0F,x)
2A44  3E 01 2D  rol $2D01,x
2A47  81 04     sta ($04,x)
2A49  46 83     lsr $83
2A4B  0F        .byte $0F
2A4C  3E 01 37  rol $3701,x
2A4F  FF        .byte $FF
2A50  81 02     sta ($02,x)
2A52  21 01     and ($01,x)
2A54  15 01     ora $01,x
2A56  1F        .byte $1F
2A57  01 21     ora ($21,x)
2A59  83        .byte $83
2A5A  03        .byte $03
2A5B  38        sec 
2A5C  83        .byte $83
2A5D  02        .byte $02
2A5E  21 01     and ($01,x)
2A60  21 01     and ($01,x)
2A62  15 01     ora $01,x
2A64  1F        .byte $1F
2A65  01 21     ora ($21,x)
2A67  83        .byte $83
2A68  03        .byte $03
2A69  38        sec 
2A6A  83        .byte $83
2A6B  02        .byte $02
2A6C  21 FF     and ($FF,x)
2A6E  81 02     sta ($02,x)
2A70  26 01     rol $01
2A72  1A        .byte $1A
2A73  01 24     ora ($24,x)
2A75  01 26     ora ($26,x)
2A77  83        .byte $83
2A78  03        .byte $03
2A79  38        sec 
2A7A  83        .byte $83
2A7B  02        .byte $02
2A7C  26 01     rol $01
2A7E  26 01     rol $01
2A80  1A        .byte $1A
2A81  01 24     ora ($24,x)
2A83  01 26     ora ($26,x)
2A85  83        .byte $83
2A86  03        .byte $03
2A87  38        sec 
2A88  83        .byte $83
2A89  02        .byte $02
2A8A  26 FF     rol $FF
2A8C  81 02     sta ($02,x)
2A8E  1D 01 11  ora $1101,x
2A91  01 1C     ora ($1C,x)
2A93  01 1D     ora ($1D,x)
2A95  83        .byte $83
2A96  03        .byte $03
2A97  38        sec 
2A98  83        .byte $83
2A99  02        .byte $02
2A9A  1D 01 1D  ora $1D01,x
2A9D  01 11     ora ($11,x)
2A9F  01 1C     ora ($1C,x)
2AA1  01 1D     ora ($1D,x)
2AA3  83        .byte $83
2AA4  03        .byte $03
2AA5  38        sec 
2AA6  83        .byte $83
2AA7  02        .byte $02
2AA8  1D FF 81  ora $81FF,x
2AAB  02        .byte $02
2AAC  24 01     bit $01
2AAE  18        clc 
2AAF  01 23     ora ($23,x)
2AB1  01 24     ora ($24,x)
2AB3  83        .byte $83
2AB4  03        .byte $03
2AB5  38        sec 
2AB6  83        .byte $83
2AB7  02        .byte $02
2AB8  24 01     bit $01
2ABA  24 01     bit $01
2ABC  18        clc 
2ABD  01 23     ora ($23,x)
2ABF  01 24     ora ($24,x)
2AC1  83        .byte $83
2AC2  03        .byte $03
2AC3  38        sec 
2AC4  83        .byte $83
2AC5  02        .byte $02
2AC6  24 FF     bit $FF
2AC8  83        .byte $83
2AC9  08        php 
2ACA  48        pha 
2ACB  A1 07     lda ($07,x)
2ACD  34        .byte $34
2ACE  01 40     ora ($40,x)
2AD0  21 34     and ($34,x)
2AD2  01 40     ora ($40,x)
2AD4  21 30     and ($30,x)
2AD6  01 3C     ora ($3C,x)
2AD8  03        .byte $03
2AD9  2D 83 08  and $0883
2ADC  48        pha 
2ADD  A1 07     lda ($07,x)
2ADF  37        .byte $37
2AE0  01 39     ora ($39,x)
2AE2  21 43     and ($43,x)
2AE4  01 45     ora ($45,x)
2AE6  FF        .byte $FF
2AE7  47        .byte $47
2AE8  87        .byte $87
2AE9  03        .byte $03
2AEA  38        sec 
2AEB  47        .byte $47
2AEC  07        .byte $07
2AED  38        sec 
2AEE  FF        .byte $FF
2AEF  83        .byte $83
2AF0  02        .byte $02
2AF1  15 03     ora $03,x
2AF3  15 83     ora $83,x
2AF5  03        .byte $03
2AF6  38        sec 
2AF7  41 81     eor ($81,x)
2AF9  02        .byte $02
2AFA  15 07     ora $07,x
2AFC  15 83     ora $83,x
2AFE  03        .byte $03
2AFF  38        sec 
2B00  43        .byte $43
2B01  FF        .byte $FF
2B02  83        .byte $83
2B03  02        .byte $02
2B04  1A        .byte $1A
2B05  03        .byte $03
2B06  1A        .byte $1A
2B07  83        .byte $83
2B08  03        .byte $03
2B09  38        sec 
2B0A  41 81     eor ($81,x)
2B0C  02        .byte $02
2B0D  1A        .byte $1A
2B0E  07        .byte $07
2B0F  1A        .byte $1A
2B10  83        .byte $83
2B11  03        .byte $03
2B12  38        sec 
2B13  43        .byte $43
2B14  FF        .byte $FF
2B15  83        .byte $83
2B16  02        .byte $02
2B17  13        .byte $13
2B18  03        .byte $03
2B19  13        .byte $13
2B1A  83        .byte $83
2B1B  03        .byte $03
2B1C  38        sec 
2B1D  41 81     eor ($81,x)
2B1F  02        .byte $02
2B20  13        .byte $13
2B21  07        .byte $07
2B22  13        .byte $13
2B23  83        .byte $83
2B24  03        .byte $03
2B25  38        sec 
2B26  43        .byte $43
2B27  FF        .byte $FF
2B28  83        .byte $83
2B29  02        .byte $02
2B2A  18        clc 
2B2B  03        .byte $03
2B2C  18        clc 
2B2D  83        .byte $83
2B2E  03        .byte $03
2B2F  38        sec 
2B30  41 81     eor ($81,x)
2B32  02        .byte $02
2B33  18        clc 
2B34  07        .byte $07
2B35  18        clc 
2B36  83        .byte $83
2B37  03        .byte $03
2B38  38        sec 
2B39  43        .byte $43
2B3A  FF        .byte $FF
2B3B  83        .byte $83
2B3C  02        .byte $02
2B3D  1D 03 1D  ora $1D03,x
2B40  83        .byte $83
2B41  03        .byte $03
2B42  38        sec 
2B43  41 81     eor ($81,x)
2B45  02        .byte $02
2B46  1D 07 1D  ora $1D07,x
2B49  83        .byte $83
2B4A  03        .byte $03
2B4B  38        sec 
2B4C  43        .byte $43
2B4D  FF        .byte $FF
2B4E  A3        .byte $A3
2B4F  14        .byte $14
2B50  21 BB     and ($BB,x)
2B52  15 21     ora $21,x
2B54  9F        .byte $9F
2B55  16 21     asl $21,x
2B57  A3        .byte $A3
2B58  14        .byte $14
2B59  24 BB     bit $BB
2B5B  15 24     ora $24,x
2B5D  9F        .byte $9F
2B5E  16 24     asl $24,x
2B60  A3        .byte $A3
2B61  14        .byte $14
2B62  1D BB 15  ora $15BB,x
2B65  1D 9F 16  ora $169F,x
2B68  1D A3 14  ora $14A3,x
2B6B  1A        .byte $1A
2B6C  BB        .byte $BB
2B6D  15 1A     ora $1A,x
2B6F  9F        .byte $9F
2B70  16 1A     asl $1A,x
2B72  FF        .byte $FF
2B73  A3        .byte $A3
2B74  14        .byte $14
2B75  18        clc 
2B76  BB        .byte $BB
2B77  15 18     ora $18,x
2B79  9F        .byte $9F
2B7A  16 18     asl $18,x
2B7C  A3        .byte $A3
2B7D  14        .byte $14
2B7E  15 BB     ora $BB,x
2B80  15 15     ora $15,x
2B82  9F        .byte $9F
2B83  16 15     asl $15,x
2B85  FF        .byte $FF
2B86  BF        .byte $BF
2B87  17        .byte $17
2B88  39 5F FF  and $FF5F,y
2B8B  81 00     sta ($00,x)
2B8D  2D 83 03  and $0383
2B90  38        sec 
2B91  81 00     sta ($00,x)
2B93  2D 83 03  and $0383
2B96  38        sec 
2B97  81 00     sta ($00,x)
2B99  2D 01 2D  and $2D01
2B9C  01 2D     ora ($2D,x)
2B9E  83        .byte $83
2B9F  03        .byte $03
2BA0  38        sec 
2BA1  81 00     sta ($00,x)
2BA3  2D 83 03  and $0383
2BA6  38        sec 
2BA7  81 00     sta ($00,x)
2BA9  2D 01 2D  and $2D01
2BAC  01 2D     ora ($2D,x)
2BAE  83        .byte $83
2BAF  03        .byte $03
2BB0  38        sec 
2BB1  81 00     sta ($00,x)
2BB3  2D 83 03  and $0383
2BB6  38        sec 
2BB7  81 00     sta ($00,x)
2BB9  2D 01 2D  and $2D01
2BBC  01 2D     ora ($2D,x)
2BBE  83        .byte $83
2BBF  03        .byte $03
2BC0  38        sec 
2BC1  81 00     sta ($00,x)
2BC3  2D 83 03  and $0383
2BC6  38        sec 
2BC7  01 38     ora ($38,x)
2BC9  01 38     ora ($38,x)
2BCB  FF        .byte $FF
2BCC  81 18     sta ($18,x)
2BCE  55 81     eor $81,x
2BD0  04        .byte $04
2BD1  45 81     eor $81
2BD3  18        clc 
2BD4  45 01     eor $01
2BD6  55 81     eor $81,x
2BD8  04        .byte $04
2BD9  45 81     eor $81
2BDB  18        clc 
2BDC  50 01     bvc $2BDF
2BDE  45 01     eor $01
2BE0  45 01     eor $01
2BE2  55 81     eor $81,x
2BE4  04        .byte $04
2BE5  45 81     eor $81
2BE7  18        clc 
2BE8  45 01     eor $01
2BEA  55 81     eor $81,x
2BEC  04        .byte $04
2BED  45 81     eor $81
2BEF  18        clc 
2BF0  50 01     bvc $2BF3
2BF2  45 01     eor $01
2BF4  45 01     eor $01
2BF6  55 81     eor $81,x
2BF8  04        .byte $04
2BF9  45 81     eor $81
2BFB  18        clc 
2BFC  45 01     eor $01
2BFE  55 81     eor $81,x
2C00  04        .byte $04
2C01  45 81     eor $81
2C03  18        clc 
2C04  50 01     bvc $2C07
2C06  45 01     eor $01
2C08  45 01     eor $01
2C0A  55 81     eor $81,x
2C0C  04        .byte $04
2C0D  45 81     eor $81
2C0F  18        clc 
2C10  45 01     eor $01
2C12  55 81     eor $81,x
2C14  04        .byte $04
2C15  45 81     eor $81
2C17  18        clc 
2C18  50 81     bvc $2B9B
2C1A  04        .byte $04
2C1B  45 01     eor $01
2C1D  45 FF     eor $FF
2C1F  BF        .byte $BF
2C20  15 45     ora $45,x
2C22  BF        .byte $BF
2C23  16 45     asl $45,x
2C25  7F        .byte $7F
2C26  5F        .byte $5F
2C27  BF        .byte $BF
2C28  15 48     ora $48,x
2C2A  BF        .byte $BF
2C2B  16 48     asl $48,x
2C2D  7F        .byte $7F
2C2E  5F        .byte $5F
2C2F  BF        .byte $BF
2C30  15 47     ora $47,x
2C32  9F        .byte $9F
2C33  16 47     asl $47,x
2C35  BF        .byte $BF
2C36  15 40     ora $40,x
2C38  9F        .byte $9F
2C39  16 40     asl $40,x
2C3B  BF        .byte $BF
2C3C  15 39     ora $39,x
2C3E  BF        .byte $BF
2C3F  16 39     asl $39,x
2C41  7F        .byte $7F
2C42  5F        .byte $5F
2C43  FF        .byte $FF
2C44  8B        .byte $8B
2C45  19 51 0B  ora $0B51,y
2C48  53        .byte $53
2C49  07        .byte $07
2C4A  54        .byte $54
2C4B  0B        .byte $0B
2C4C  58        cli 
2C4D  0B        .byte $0B
2C4E  56 07     lsr $07,x
2C50  54        .byte $54
2C51  0B        .byte $0B
2C52  51 0B     eor ($0B),y
2C54  54        .byte $54
2C55  07        .byte $07
2C56  59 07 56  eor $5607,y
2C59  07        .byte $07
2C5A  56 03     lsr $03,x
2C5C  54        .byte $54
2C5D  0B        .byte $0B
2C5E  56 0B     lsr $0B,x
2C60  51 0B     eor ($0B),y
2C62  54        .byte $54
2C63  07        .byte $07
2C64  58        cli 
2C65  0B        .byte $0B
2C66  5B        .byte $5B
2C67  0B        .byte $0B
2C68  59 07 58  eor $5807,y
2C6B  0B        .byte $0B
2C6C  54        .byte $54
2C6D  0B        .byte $0B
2C6E  58        cli 
2C6F  07        .byte $07
2C70  59 07 56  eor $5607,y
2C73  07        .byte $07
2C74  56 03     lsr $03,x
2C76  54        .byte $54
2C77  0B        .byte $0B
2C78  53        .byte $53
2C79  FF        .byte $FF
2C7A  BF        .byte $BF
2C7B  1A        .byte $1A
2C7C  15 7F     ora $7F,x
2C7E  7F        .byte $7F
2C7F  5F        .byte $5F
2C80  FF        .byte $FF
2C81  BF        .byte $BF
2C82  1A        .byte $1A
2C83  39 7F 7F  and $7F7F,y
2C86  5F        .byte $5F
2C87  FF        .byte $FF
2C88  BF        .byte $BF
2C89  1B        .byte $1B
2C8A  0C        .byte $0C
2C8B  7F        .byte $7F
2C8C  7F        .byte $7F
2C8D  5F        .byte $5F
2C8E  FF        .byte $FF
2C8F  BF        .byte $BF
2C90  1A        .byte $1A
2C91  45 7F     eor $7F
2C93  7F        .byte $7F
2C94  5F        .byte $5F
2C95  FF        .byte $FF
2C96  AD 6F 24  lda $246F
2C99  F0 01     beq $2C9C
2C9B  60        rts 
2C9C  A9 00     lda #$00
2C9E  8D 04 D4  sta $D404
2CA1  8D 0B D4  sta $D40B
2CA4  8D 12 D4  sta $D412
2CA7  A9 01     lda #$01
2CA9  8D 6F 24  sta $246F
2CAC  60        rts 
2CAD  FF        .byte $FF
2CAE  FF        .byte $FF
2CAF  FF        .byte $FF
2CB0  FF        .byte $FF
2CB1  FF        .byte $FF
2CB2  AE 0C 00  ldx $000C
2CB5  FF        .byte $FF
2CB6  FF        .byte $FF
2CB7  FF        .byte $FF
2CB8  FF        .byte $FF
2CB9  FF        .byte $FF
2CBA  FF        .byte $FF
2CBB  FF        .byte $FF
2CBC  FF        .byte $FF
2CBD  FF        .byte $FF
2CBE  00        brk 
2CBF  FF        .byte $FF
2CC0  00        brk 
2CC1  FF        .byte $FF
2CC2  00        brk 
2CC3  FF        .byte $FF
2CC4  FF        .byte $FF
2CC5  FF        .byte $FF
2CC6  FF        .byte $FF
2CC7  FF        .byte $FF
2CC8  0C        .byte $0C
2CC9  FF        .byte $FF
2CCA  FF        .byte $FF
2CCB  FF        .byte $FF
2CCC  00        brk 
2CCD  FF        .byte $FF
2CCE  FF        .byte $FF
2CCF  20 81 FF  jsr $FF81
2CD2  FF        .byte $FF
2CD3  FF        .byte $FF
2CD4  FF        .byte $FF
2CD5  FF        .byte $FF
2CD6  00        brk 
2CD7  FF        .byte $FF
2CD8  FF        .byte $FF
2CD9  FF        .byte $FF
2CDA  FF        .byte $FF
2CDB  FF        .byte $FF
2CDC  00        brk 
2CDD  FF        .byte $FF
2CDE  8E FF FF  stx $FFFF
2CE1  FF        .byte $FF
2CE2  FF        .byte $FF
2CE3  FF        .byte $FF
2CE4  FF        .byte $FF
2CE5  00        brk 
2CE6  FF        .byte $FF
2CE7  04        .byte $04
2CE8  00        brk 
2CE9  FF        .byte $FF
2CEA  FF        .byte $FF
2CEB  FF        .byte $FF
2CEC  00        brk 
2CED  FF        .byte $FF
2CEE  A6 00     ldx $00
2CF0  DF        .byte $DF
2CF1  FF        .byte $FF
2CF2  0E 00 FF  asl $FF00
2CF5  FF        .byte $FF
2CF6  00        brk 
2CF7  FF        .byte $FF
2CF8  00        brk 
2CF9  FF        .byte $FF
2CFA  FF        .byte $FF
2CFB  FF        .byte $FF
2CFC  FF        .byte $FF
2CFD  FF        .byte $FF
2CFE  C1 B2     cmp ($B2,x)
2D00  BF        .byte $BF
2D01  FF        .byte $FF
2D02  FF        .byte $FF
2D03  FF        .byte $FF
2D04  FF        .byte $FF
2D05  00        brk 
2D06  00        brk 
2D07  FB        .byte $FB
2D08  FF        .byte $FF
2D09  00        brk 
2D0A  00        brk 
2D0B  EE 00 00  inc $0000
2D0E  73        .byte $73
2D0F  FF        .byte $FF
2D10  7F        .byte $7F
2D11  FF        .byte $FF
2D12  10 FB     bpl $2D0F
2D14  00        brk 
2D15  00        brk 
2D16  FF        .byte $FF
2D17  00        brk 
2D18  00        brk 
2D19  00        brk 
2D1A  00        brk 
2D1B  00        brk 
2D1C  00        brk 
2D1D  00        brk 
2D1E  00        brk 
2D1F  FF        .byte $FF
2D20  00        brk 
2D21  00        brk 
2D22  00        brk 
2D23  FF        .byte $FF
2D24  00        brk 
2D25  00        brk 
2D26  00        brk 
2D27  00        brk 
2D28  00        brk 
2D29  F3        .byte $F3
2D2A  00        brk 
2D2B  10 FB     bpl $2D28
2D2D  EF        .byte $EF
2D2E  00        brk 
2D2F  FF        .byte $FF
2D30  00        brk 
2D31  00        brk 
2D32  FF        .byte $FF
2D33  00        brk 
2D34  00        brk 
2D35  00        brk 
2D36  FF        .byte $FF
2D37  FB        .byte $FB
2D38  00        brk 
2D39  00        brk 
2D3A  00        brk 
2D3B  00        brk 
2D3C  00        brk 
2D3D  00        brk 
2D3E  00        brk 
2D3F  FF        .byte $FF
2D40  00        brk 
2D41  FF        .byte $FF
2D42  FF        .byte $FF
2D43  00        brk 
2D44  7B        .byte $7B
2D45  00        brk 
2D46  FF        .byte $FF
2D47  EF        .byte $EF
2D48  AA        tax 
2D49  00        brk 
2D4A  F7        .byte $F7
2D4B  00        brk 
2D4C  00        brk 
2D4D  00        brk 
2D4E  FF        .byte $FF
2D4F  00        brk 
2D50  F1 FF     sbc ($FF),y
2D52  FF        .byte $FF
2D53  FF        .byte $FF
2D54  00        brk 
2D55  00        brk 
2D56  00        brk 
2D57  00        brk 
2D58  F7        .byte $F7
2D59  00        brk 
2D5A  00        brk 
2D5B  00        brk 
2D5C  00        brk 
2D5D  00        brk 
2D5E  FF        .byte $FF
2D5F  00        brk 
2D60  00        brk 
2D61  00        brk 
2D62  00        brk 
2D63  00        brk 
2D64  00        brk 
2D65  00        brk 
2D66  00        brk 
2D67  FF        .byte $FF
2D68  00        brk 
2D69  00        brk 
2D6A  00        brk 
2D6B  FF        .byte $FF
2D6C  00        brk 
2D6D  00        brk 
2D6E  00        brk 
2D6F  00        brk 
2D70  00        brk 
2D71  00        brk 
2D72  00        brk 
2D73  00        brk 
2D74  00        brk 
2D75  00        brk 
2D76  00        brk 
2D77  00        brk 
2D78  00        brk 
2D79  00        brk 
2D7A  00        brk 
2D7B  00        brk 
2D7C  00        brk 
2D7D  00        brk 
2D7E  00        brk 
2D7F  FF        .byte $FF
2D80  00        brk 
2D81  0C        .byte $0C
2D82  FF        .byte $FF
2D83  00        brk 
2D84  00        brk 
2D85  FF        .byte $FF
2D86  FF        .byte $FF
2D87  FF        .byte $FF
2D88  FF        .byte $FF
2D89  FF        .byte $FF
2D8A  FF        .byte $FF
2D8B  FF        .byte $FF
2D8C  00        brk 
2D8D  FF        .byte $FF
2D8E  00        brk 
2D8F  00        brk 
2D90  FF        .byte $FF
2D91  FF        .byte $FF
2D92  FF        .byte $FF
2D93  FF        .byte $FF
2D94  FF        .byte $FF
2D95  FF        .byte $FF
2D96  00        brk 
2D97  FF        .byte $FF
2D98  FF        .byte $FF
2D99  FF        .byte $FF
2D9A  EF        .byte $EF
2D9B  FF        .byte $FF
2D9C  FF        .byte $FF
2D9D  FF        .byte $FF
2D9E  FF        .byte $FF
2D9F  FF        .byte $FF
2DA0  FF        .byte $FF
2DA1  2C FF FF  bit $FFFF
2DA4  00        brk 
2DA5  FF        .byte $FF
2DA6  FF        .byte $FF
2DA7  EF        .byte $EF
2DA8  00        brk 
2DA9  2E FF FF  rol $FFFF
2DAC  0C        .byte $0C
2DAD  FF        .byte $FF
2DAE  FF        .byte $FF
2DAF  FF        .byte $FF
2DB0  FF        .byte $FF
2DB1  FF        .byte $FF
2DB2  AE 0C 00  ldx $000C
2DB5  FF        .byte $FF
2DB6  FF        .byte $FF
2DB7  FF        .byte $FF
2DB8  FF        .byte $FF
2DB9  FF        .byte $FF
2DBA  FF        .byte $FF
2DBB  FF        .byte $FF
2DBC  FF        .byte $FF
2DBD  FF        .byte $FF
2DBE  00        brk 
2DBF  FF        .byte $FF
2DC0  00        brk 
2DC1  FF        .byte $FF
2DC2  00        brk 
2DC3  FF        .byte $FF
2DC4  FF        .byte $FF
2DC5  FF        .byte $FF
2DC6  FF        .byte $FF
2DC7  FF        .byte $FF
2DC8  0C        .byte $0C
2DC9  FF        .byte $FF
2DCA  FF        .byte $FF
2DCB  FF        .byte $FF
2DCC  00        brk 
2DCD  FF        .byte $FF
2DCE  FF        .byte $FF
2DCF  00        brk 
2DD0  00        brk 
2DD1  FF        .byte $FF
2DD2  FF        .byte $FF
2DD3  FF        .byte $FF
2DD4  FF        .byte $FF
2DD5  FF        .byte $FF
2DD6  00        brk 
2DD7  FF        .byte $FF
2DD8  FF        .byte $FF
2DD9  FF        .byte $FF
2DDA  FF        .byte $FF
2DDB  FF        .byte $FF
2DDC  00        brk 
2DDD  FF        .byte $FF
2DDE  8E FF FF  stx $FFFF
2DE1  FF        .byte $FF
2DE2  FF        .byte $FF
2DE3  FF        .byte $FF
2DE4  FF        .byte $FF
2DE5  00        brk 
2DE6  FF        .byte $FF
2DE7  04        .byte $04
2DE8  00        brk 
2DE9  FF        .byte $FF
2DEA  FF        .byte $FF
2DEB  FF        .byte $FF
2DEC  00        brk 
2DED  FF        .byte $FF
2DEE  A6 00     ldx $00
2DF0  9F        .byte $9F
2DF1  FF        .byte $FF
2DF2  0E 00 FF  asl $FF00
2DF5  FF        .byte $FF
2DF6  00        brk 
2DF7  FF        .byte $FF
2DF8  00        brk 
2DF9  FF        .byte $FF
2DFA  FF        .byte $FF
2DFB  FF        .byte $FF
2DFC  FF        .byte $FF
2DFD  FF        .byte $FF
2DFE  C1 B2     cmp ($B2,x)
2E00  BF        .byte $BF
2E01  FF        .byte $FF
2E02  FF        .byte $FF
2E03  FD FF 00  sbc $00FF,x
2E06  00        brk 
2E07  FF        .byte $FF
2E08  FF        .byte $FF
2E09  00        brk 
2E0A  00        brk 
2E0B  EE 00 00  inc $0000
2E0E  73        .byte $73
2E0F  FF        .byte $FF
2E10  7F        .byte $7F
2E11  FF        .byte $FF
2E12  10 FB     bpl $2E0F
2E14  00        brk 
2E15  00        brk 
2E16  FF        .byte $FF
2E17  00        brk 
2E18  00        brk 
2E19  00        brk 
2E1A  00        brk 
2E1B  00        brk 
2E1C  00        brk 
2E1D  00        brk 
2E1E  00        brk 
2E1F  FF        .byte $FF
2E20  00        brk 
2E21  00        brk 
2E22  00        brk 
2E23  FF        .byte $FF
2E24  00        brk 
2E25  00        brk 
2E26  00        brk 
2E27  00        brk 
2E28  00        brk 
2E29  F3        .byte $F3
2E2A  00        brk 
2E2B  10 FB     bpl $2E28
2E2D  EF        .byte $EF
2E2E  00        brk 
2E2F  FF        .byte $FF
2E30  00        brk 
2E31  00        brk 
2E32  FF        .byte $FF
2E33  00        brk 
2E34  00        brk 
2E35  00        brk 
2E36  FF        .byte $FF
2E37  FB        .byte $FB
2E38  00        brk 
2E39  00        brk 
2E3A  00        brk 
2E3B  00        brk 
2E3C  00        brk 
2E3D  00        brk 
2E3E  00        brk 
2E3F  FF        .byte $FF
2E40  00        brk 
2E41  FF        .byte $FF
2E42  FF        .byte $FF
2E43  00        brk 
2E44  7B        .byte $7B
2E45  00        brk 
2E46  FF        .byte $FF
2E47  EF        .byte $EF
2E48  AA        tax 
2E49  00        brk 
2E4A  F7        .byte $F7
2E4B  00        brk 
2E4C  00        brk 
2E4D  00        brk 
2E4E  FF        .byte $FF
2E4F  00        brk 
2E50  F1 FF     sbc ($FF),y
2E52  FF        .byte $FF
2E53  FF        .byte $FF
2E54  00        brk 
2E55  00        brk 
2E56  00        brk 
2E57  00        brk 
2E58  F7        .byte $F7
2E59  00        brk 
2E5A  00        brk 
2E5B  00        brk 
2E5C  00        brk 
2E5D  00        brk 
2E5E  FF        .byte $FF
2E5F  00        brk 
2E60  00        brk 
2E61  00        brk 
2E62  00        brk 
2E63  00        brk 
2E64  00        brk 
2E65  00        brk 
2E66  00        brk 
2E67  FF        .byte $FF
2E68  00        brk 
2E69  00        brk 
2E6A  00        brk 
2E6B  FF        .byte $FF
2E6C  00        brk 
2E6D  00        brk 
2E6E  00        brk 
2E6F  00        brk 
2E70  00        brk 
2E71  00        brk 
2E72  00        brk 
2E73  00        brk 
2E74  00        brk 
2E75  00        brk 
2E76  00        brk 
2E77  00        brk 
2E78  00        brk 
2E79  00        brk 
2E7A  00        brk 
2E7B  00        brk 
2E7C  00        brk 
2E7D  00        brk 
2E7E  00        brk 
2E7F  FF        .byte $FF
2E80  00        brk 
2E81  0C        .byte $0C
2E82  FF        .byte $FF
2E83  00        brk 
2E84  00        brk 
2E85  FF        .byte $FF
2E86  FF        .byte $FF
2E87  FF        .byte $FF
2E88  FF        .byte $FF
2E89  FF        .byte $FF
2E8A  FF        .byte $FF
2E8B  FF        .byte $FF
2E8C  00        brk 
2E8D  FF        .byte $FF
2E8E  00        brk 
2E8F  00        brk 
2E90  FF        .byte $FF
2E91  FF        .byte $FF
2E92  FF        .byte $FF
2E93  FF        .byte $FF
2E94  FF        .byte $FF
2E95  FF        .byte $FF
2E96  00        brk 
2E97  FF        .byte $FF
2E98  FF        .byte $FF
2E99  FF        .byte $FF
2E9A  EF        .byte $EF
2E9B  FF        .byte $FF
2E9C  FF        .byte $FF
2E9D  FF        .byte $FF
2E9E  FF        .byte $FF
2E9F  FF        .byte $FF
2EA0  FF        .byte $FF
2EA1  2C FF FF  bit $FFFF
2EA4  00        brk 
2EA5  FF        .byte $FF
2EA6  FF        .byte $FF
2EA7  EF        .byte $EF
2EA8  00        brk 
2EA9  2E FF FF  rol $FFFF
2EAC  0C        .byte $0C
2EAD  FF        .byte $FF
2EAE  FF        .byte $FF
2EAF  FF        .byte $FF
2EB0  FF        .byte $FF
2EB1  FF        .byte $FF
2EB2  AE 0C 00  ldx $000C
2EB5  FF        .byte $FF
2EB6  FF        .byte $FF
2EB7  FF        .byte $FF
2EB8  FF        .byte $FF
2EB9  FF        .byte $FF
2EBA  FF        .byte $FF
2EBB  FF        .byte $FF
2EBC  FF        .byte $FF
2EBD  FF        .byte $FF
2EBE  00        brk 
2EBF  FF        .byte $FF
2EC0  00        brk 
2EC1  FF        .byte $FF
2EC2  00        brk 
2EC3  FF        .byte $FF
2EC4  FF        .byte $FF
2EC5  FF        .byte $FF
2EC6  FF        .byte $FF
2EC7  FF        .byte $FF
2EC8  0C        .byte $0C
2EC9  FF        .byte $FF
2ECA  FF        .byte $FF
2ECB  FF        .byte $FF
2ECC  00        brk 
2ECD  FF        .byte $FF
2ECE  FF        .byte $FF
2ECF  00        brk 
2ED0  00        brk 
2ED1  FF        .byte $FF
2ED2  FF        .byte $FF
2ED3  FF        .byte $FF
2ED4  FF        .byte $FF
2ED5  FF        .byte $FF
2ED6  00        brk 
2ED7  FF        .byte $FF
2ED8  FF        .byte $FF
2ED9  FF        .byte $FF
2EDA  FF        .byte $FF
2EDB  FF        .byte $FF
2EDC  00        brk 
2EDD  FF        .byte $FF
2EDE  8E FF FF  stx $FFFF
2EE1  FF        .byte $FF
2EE2  FF        .byte $FF
2EE3  FF        .byte $FF
2EE4  FF        .byte $FF
2EE5  00        brk 
2EE6  FF        .byte $FF
2EE7  04        .byte $04
2EE8  00        brk 
2EE9  FF        .byte $FF
2EEA  FF        .byte $FF
2EEB  FF        .byte $FF
2EEC  00        brk 
2EED  FF        .byte $FF
2EEE  A6 00     ldx $00
2EF0  BE FF 0E  ldx $0EFF,y
2EF3  00        brk 
2EF4  FF        .byte $FF
2EF5  FF        .byte $FF
2EF6  00        brk 
2EF7  FF        .byte $FF
2EF8  00        brk 
2EF9  FF        .byte $FF
2EFA  FF        .byte $FF
2EFB  FF        .byte $FF
2EFC  FF        .byte $FF
2EFD  FF        .byte $FF
2EFE  C1 B2     cmp ($B2,x)
2F00  BF        .byte $BF
2F01  FF        .byte $FF
2F02  FF        .byte $FF
2F03  FD FF 00  sbc $00FF,x
2F06  00        brk 
2F07  FF        .byte $FF
2F08  FF        .byte $FF
2F09  00        brk 
2F0A  00        brk 
2F0B  EE 00 00  inc $0000
2F0E  71 FF     adc ($FF),y
2F10  7F        .byte $7F
2F11  FF        .byte $FF
2F12  10 7B     bpl $2F8F
2F14  00        brk 
2F15  00        brk 
2F16  FF        .byte $FF
2F17  00        brk 
2F18  00        brk 
2F19  00        brk 
2F1A  00        brk 
2F1B  00        brk 
2F1C  00        brk 
2F1D  00        brk 
2F1E  00        brk 
2F1F  FF        .byte $FF
2F20  00        brk 
2F21  00        brk 
2F22  00        brk 
2F23  FF        .byte $FF
2F24  00        brk 
2F25  00        brk 
2F26  00        brk 
2F27  00        brk 
2F28  00        brk 
2F29  F3        .byte $F3
2F2A  00        brk 
2F2B  10 FB     bpl $2F28
2F2D  EF        .byte $EF
2F2E  00        brk 
2F2F  FF        .byte $FF
2F30  00        brk 
2F31  00        brk 
2F32  FF        .byte $FF
2F33  00        brk 
2F34  00        brk 
2F35  00        brk 
2F36  FF        .byte $FF
2F37  FB        .byte $FB
2F38  00        brk 
2F39  00        brk 
2F3A  00        brk 
2F3B  00        brk 
2F3C  00        brk 
2F3D  00        brk 
2F3E  00        brk 
2F3F  FF        .byte $FF
2F40  00        brk 
2F41  FF        .byte $FF
2F42  7D 00 7B  adc $7B00,x
2F45  00        brk 
2F46  FF        .byte $FF
2F47  EF        .byte $EF
2F48  AA        tax 
2F49  00        brk 
2F4A  F7        .byte $F7
2F4B  00        brk 
2F4C  00        brk 
2F4D  00        brk 
2F4E  FF        .byte $FF
2F4F  00        brk 
2F50  F1 FF     sbc ($FF),y
2F52  FF        .byte $FF
2F53  FF        .byte $FF
2F54  00        brk 
2F55  00        brk 
2F56  00        brk 
2F57  00        brk 
2F58  F7        .byte $F7
2F59  00        brk 
2F5A  00        brk 
2F5B  00        brk 
2F5C  00        brk 
2F5D  00        brk 
2F5E  FF        .byte $FF
2F5F  00        brk 
2F60  00        brk 
2F61  00        brk 
2F62  00        brk 
2F63  00        brk 
2F64  00        brk 
2F65  00        brk 
2F66  00        brk 
2F67  FF        .byte $FF
2F68  00        brk 
2F69  00        brk 
2F6A  00        brk 
2F6B  FF        .byte $FF
2F6C  00        brk 
2F6D  00        brk 
2F6E  00        brk 
2F6F  00        brk 
2F70  00        brk 
2F71  00        brk 
2F72  00        brk 
2F73  00        brk 
2F74  00        brk 
2F75  00        brk 
2F76  00        brk 
2F77  00        brk 
2F78  00        brk 
2F79  00        brk 
2F7A  00        brk 
2F7B  00        brk 
2F7C  00        brk 
2F7D  00        brk 
2F7E  00        brk 
2F7F  FF        .byte $FF
2F80  00        brk 
2F81  0C        .byte $0C
2F82  FF        .byte $FF
2F83  00        brk 
2F84  00        brk 
2F85  FF        .byte $FF
2F86  FF        .byte $FF
2F87  FF        .byte $FF
2F88  FF        .byte $FF
2F89  FF        .byte $FF
2F8A  FF        .byte $FF
2F8B  FF        .byte $FF
2F8C  00        brk 
2F8D  FF        .byte $FF
2F8E  00        brk 
2F8F  00        brk 
2F90  FF        .byte $FF
2F91  FF        .byte $FF
2F92  FF        .byte $FF
2F93  FF        .byte $FF
2F94  FF        .byte $FF
2F95  FF        .byte $FF
2F96  00        brk 
2F97  FF        .byte $FF
2F98  FF        .byte $FF
2F99  FF        .byte $FF
2F9A  EF        .byte $EF
2F9B  FF        .byte $FF
2F9C  FF        .byte $FF
2F9D  FF        .byte $FF
2F9E  FF        .byte $FF
2F9F  FF        .byte $FF
2FA0  FF        .byte $FF
2FA1  2C FF FF  bit $FFFF
2FA4  00        brk 
2FA5  FF        .byte $FF
2FA6  FF        .byte $FF
2FA7  EF        .byte $EF
2FA8  00        brk 
2FA9  2E FF FF  rol $FFFF
2FAC  0C        .byte $0C
2FAD  FF        .byte $FF
2FAE  FF        .byte $FF
2FAF  FF        .byte $FF
2FB0  FF        .byte $FF
2FB1  FF        .byte $FF
2FB2  AE 04 00  ldx $0004
2FB5  FF        .byte $FF
2FB6  FF        .byte $FF
2FB7  FF        .byte $FF
2FB8  FF        .byte $FF
2FB9  FF        .byte $FF
2FBA  FF        .byte $FF
2FBB  FF        .byte $FF
2FBC  FF        .byte $FF
2FBD  FF        .byte $FF
2FBE  00        brk 
2FBF  FF        .byte $FF
2FC0  00        brk 
2FC1  FF        .byte $FF
2FC2  00        brk 
2FC3  FF        .byte $FF
2FC4  FF        .byte $FF
2FC5  FF        .byte $FF
2FC6  FF        .byte $FF
2FC7  FF        .byte $FF
2FC8  0C        .byte $0C
2FC9  FF        .byte $FF
2FCA  FF        .byte $FF
2FCB  FF        .byte $FF
2FCC  00        brk 
2FCD  FF        .byte $FF
2FCE  FF        .byte $FF
2FCF  00        brk 
2FD0  00        brk 
2FD1  FF        .byte $FF
2FD2  FF        .byte $FF
2FD3  FF        .byte $FF
2FD4  FF        .byte $FF
2FD5  FF        .byte $FF
2FD6  00        brk 
2FD7  FF        .byte $FF
2FD8  FF        .byte $FF
2FD9  FF        .byte $FF
2FDA  FF        .byte $FF
2FDB  FF        .byte $FF
2FDC  00        brk 
2FDD  FF        .byte $FF
2FDE  8E FF FF  stx $FFFF
2FE1  FF        .byte $FF
2FE2  FF        .byte $FF
2FE3  FF        .byte $FF
2FE4  FF        .byte $FF
2FE5  00        brk 
2FE6  FF        .byte $FF
2FE7  04        .byte $04
2FE8  00        brk 
2FE9  FF        .byte $FF
2FEA  FF        .byte $FF
2FEB  FF        .byte $FF
2FEC  00        brk 
2FED  FF        .byte $FF
2FEE  A6 00     ldx $00
2FF0  9F        .byte $9F
2FF1  FF        .byte $FF
2FF2  0E 00 FF  asl $FF00
2FF5  FF        .byte $FF
2FF6  00        brk 
2FF7  FF        .byte $FF
2FF8  00        brk 
2FF9  FF        .byte $FF
2FFA  FF        .byte $FF
2FFB  FF        .byte $FF
2FFC  FF        .byte $FF
2FFD  FF        .byte $FF
2FFE  C1 B2     cmp ($B2,x)
3000  4C 00 20  jmp $2000
3003  00        brk 
3004  40        rti 
3005  20 10 08  jsr $0810
3008  04        .byte $04
3009  02        .byte $02
300A  01 A9     ora ($A9,x)
300C  00        brk 
300D  85 7B     sta $7B
300F  A9 41     lda #$41
3011  18        clc 
3012  6D B3 84  adc $84B3
3015  85 74     sta $74
3017  A9 82     lda #$82
3019  85 76     sta $76
301B  A9 62     lda #$62
301D  85 77     sta $77
301F  A6 62     ldx $62
3021  CA        dex 
3022  8E 23 83  stx $8323
3025  8E AF 82  stx $82AF
3028  18        clc 
3029  A4 74     ldy $74
302B  B9 00 04  lda $0400,y
302E  E9 00     sbc #$00
3030  B0 05     bcs $3037
3032  A9 00     lda #$00
3034  4C BD 82  jmp $82BD
3037  C9 50     cmp #$50
3039  90 02     bcc $303D
303B  A9 50     lda #$50
303D  85 78     sta $78
303F  A4 7B     ldy $7B
3041  38        sec 
3042  F9 00 0A  sbc $0A00,y
3045  B0 0D     bcs $3054
3047  49 FF     eor #$FF
3049  AA        tax 
304A  E8        inx 
304B  A5 78     lda $78
304D  99 00 0A  sta $0A00,y
3050  A8        tay 
3051  4C E4 82  jmp $82E4
3054  18        clc 
3055  F0 46     beq $309D
3057  AA        tax 
3058  B9 00 0A  lda $0A00,y
305B  85 72     sta $72
305D  A5 78     lda $78
305F  99 00 0A  sta $0A00,y
3062  A4 72     ldy $72
3064  B9 00 0B  lda $0B00,y
3067  85 72     sta $72
3069  B9 50 0B  lda $0B50,y
306C  65 77     adc $77
306E  85 73     sta $73
3070  B9 A0 0B  lda $0BA0,y
3073  85 70     sta $70
3075  A4 76     ldy $76
3077  51 72     eor ($72),y
3079  91 72     sta ($72),y
307B  CA        dex 
307C  F0 1F     beq $309D
307E  A5 70     lda $70
3080  30 12     bmi $3094
3082  98        tya 
3083  69 08     adc #$08
3085  A8        tay 
3086  90 03     bcc $308B
3088  18        clc 
3089  E6 73     inc $73
308B  A9 A0     lda #$A0
308D  51 72     eor ($72),y
308F  91 72     sta ($72),y
3091  CA        dex 
3092  F0 09     beq $309D
3094  A9 0A     lda #$0A
3096  51 72     eor ($72),y
3098  91 72     sta ($72),y
309A  CA        dex 
309B  D0 E5     bne $3082
309D  A4 74     ldy $74
309F  B9 00 05  lda $0500,y
30A2  E9 00     sbc #$00
30A4  B0 05     bcs $30AB
30A6  A9 00     lda #$00
30A8  4C 31 83  jmp $8331
30AB  C9 50     cmp #$50
30AD  90 02     bcc $30B1
30AF  A9 50     lda #$50
30B1  85 79     sta $79
30B3  A4 7B     ldy $7B
30B5  38        sec 
30B6  F9 80 0A  sbc $0A80,y
30B9  B0 0D     bcs $30C8
30BB  49 FF     eor #$FF
30BD  AA        tax 
30BE  E8        inx 
30BF  A5 79     lda $79
30C1  99 80 0A  sta $0A80,y
30C4  A8        tay 
30C5  4C 58 83  jmp $8358
30C8  18        clc 
30C9  F0 46     beq $3111
30CB  AA        tax 
30CC  B9 80 0A  lda $0A80,y
30CF  85 72     sta $72
30D1  A5 79     lda $79
30D3  99 80 0A  sta $0A80,y
30D6  A4 72     ldy $72
30D8  B9 00 0B  lda $0B00,y
30DB  85 72     sta $72
30DD  B9 50 0B  lda $0B50,y
30E0  65 77     adc $77
30E2  85 73     sta $73
30E4  B9 A0 0B  lda $0BA0,y
30E7  85 70     sta $70
30E9  A4 76     ldy $76
30EB  51 72     eor ($72),y
30ED  91 72     sta ($72),y
30EF  CA        dex 
30F0  F0 1F     beq $3111
30F2  A5 70     lda $70
30F4  30 12     bmi $3108
30F6  98        tya 
30F7  69 08     adc #$08
30F9  A8        tay 
30FA  90 03     bcc $30FF
30FC  18        clc 
30FD  E6 73     inc $73
30FF  A9 A0     lda #$A0
3101  51 72     eor ($72),y
3103  91 72     sta ($72),y
3105  CA        dex 
3106  F0 09     beq $3111
3108  A9 0A     lda #$0A
310A  51 72     eor ($72),y
310C  91 72     sta ($72),y
310E  CA        dex 
310F  D0 E5     bne $30F6
3111  E6 74     inc $74
3113  E6 7B     inc $7B
3115  A5 76     lda $76
3117  69 02     adc #$02
3119  85 76     sta $76
311B  29 07     and #$07
311D  F0 03     beq $3122
311F  4C A9 82  jmp $82A9
3122  A5 76     lda $76
3124  69 38     adc #$38
3126  85 76     sta $76
3128  A5 77     lda $77
312A  69 01     adc #$01
312C  85 77     sta $77
312E  30 03     bmi $3133
3130  4C A9 82  jmp $82A9
3133  60        rts 
3134  A2 01     ldx #$01
3136  8E B9 84  stx $84B9
3139  8E BF 84  stx $84BF
313C  CA        dex 
313D  8E B3 84  stx $84B3
3140  8E B4 84  stx $84B4
3143  8E B7 84  stx $84B7
3146  8E B6 84  stx $84B6
3149  8E BC 84  stx $84BC
314C  CA        dex 
314D  8E B5 84  stx $84B5
3150  8E BB 84  stx $84BB
3153  8E BA 84  stx $84BA
3156  8E BD 84  stx $84BD
3159  8E B8 84  stx $84B8
315C  8E BE 84  stx $84BE
315F  A5 03     lda $03
3161  85 70     sta $70
3163  A5 04     lda $04
3165  85 71     sta $71
3167  E6 70     inc $70
3169  E6 71     inc $71
316B  E6 71     inc $71
316D  D0 03     bne $3172
316F  20 0F 84  jsr $840F
3172  C6 70     dec $70
3174  D0 F9     bne $316F
3176  C6 71     dec $71
3178  D0 F5     bne $316F
317A  60        rts 
317B  4C FC 83  jmp $83FC
317E  A9 D7     lda #$D7
3180  8D FC 83  sta $83FC
3183  A9 84     lda #$84
3185  8D FD 83  sta $83FD
3188  CE B3 84  dec $84B3
318B  20 1C 84  jsr $841C
318E  60        rts 
318F  A9 C8     lda #$C8
3191  8D FC 83  sta $83FC
3194  A9 84     lda #$84
3196  8D FD 83  sta $83FD
3199  EE B3 84  inc $84B3
319C  AD C0 84  lda $84C0
319F  85 9F     sta $9F
31A1  AD C1 84  lda $84C1
31A4  85 A0     sta $A0
31A6  AD C2 84  lda $84C2
31A9  85 9D     sta $9D
31AB  AD C3 84  lda $84C3
31AE  85 9E     sta $9E
31B0  AD B4 84  lda $84B4
31B3  AE B5 84  ldx $84B5
31B6  AC B6 84  ldy $84B6
31B9  20 FB 83  jsr $83FB
31BC  8C B6 84  sty $84B6
31BF  8E B5 84  stx $84B5
31C2  AC B3 84  ldy $84B3
31C5  99 00 04  sta $0400,y
31C8  8D B4 84  sta $84B4
31CB  AD B7 84  lda $84B7
31CE  AE B8 84  ldx $84B8
31D1  AC B9 84  ldy $84B9
31D4  20 FB 83  jsr $83FB
31D7  8C B9 84  sty $84B9
31DA  8E B8 84  stx $84B8
31DD  AC B3 84  ldy $84B3
31E0  88        dey 
31E1  99 00 04  sta $0400,y
31E4  8D B7 84  sta $84B7
31E7  AD C4 84  lda $84C4
31EA  85 9F     sta $9F
31EC  AD C5 84  lda $84C5
31EF  85 A0     sta $A0
31F1  AD C6 84  lda $84C6
31F4  85 9D     sta $9D
31F6  AD C7 84  lda $84C7
31F9  85 9E     sta $9E
31FB  AD BA 84  lda $84BA
31FE  AE BB 84  ldx $84BB
3201  AC BC 84  ldy $84BC
3204  20 FB 83  jsr $83FB
3207  8C BC 84  sty $84BC
320A  8E BB 84  stx $84BB
320D  AC B3 84  ldy $84B3
3210  99 00 05  sta $0500,y
3213  8D BA 84  sta $84BA
3216  AD BD 84  lda $84BD
3219  AE BE 84  ldx $84BE
321C  AC BF 84  ldy $84BF
321F  20 FB 83  jsr $83FB
3222  8C BF 84  sty $84BF
3225  8E BE 84  stx $84BE
3228  AC B3 84  ldy $84B3
322B  88        dey 
322C  99 00 05  sta $0500,y
322F  8D BD 84  sta $84BD
3232  60        rts 
3233  00        brk 
3234  00        brk 
3235  00        brk 
3236  00        brk 
3237  00        brk 
3238  00        brk 
3239  00        brk 
323A  00        brk 
323B  00        brk 
323C  00        brk 
323D  00        brk 
323E  00        brk 
323F  00        brk 
3240  00        brk 
3241  00        brk 
3242  00        brk 
3243  00        brk 
3244  00        brk 
3245  00        brk 
3246  00        brk 
3247  00        brk 
3248  E0 00     cpx #$00
324A  D0 06     bne $3252
324C  C8        iny 
324D  48        pha 
324E  B1 9F     lda ($9F),y
3250  AA        tax 
3251  68        pla 
3252  18        clc 
3253  71 9D     adc ($9D),y
3255  CA        dex 
3256  60        rts 
3257  E8        inx 
3258  38        sec 
3259  F1 9D     sbc ($9D),y
325B  48        pha 
325C  B1 9F     lda ($9F),y
325E  85 70     sta $70
3260  E4 70     cpx $70
3262  D0 03     bne $3267
3264  88        dey 
3265  A2 00     ldx #$00
3267  68        pla 
3268  60        rts 
3269  07        .byte $07
326A  07        .byte $07
326B  07        .byte $07
326C  07        .byte $07
326D  07        .byte $07
326E  07        .byte $07
326F  07        .byte $07
3270  00        brk 
3271  05 05     ora $05
3273  05 05     ora $05
3275  04        .byte $04
3276  05 05     ora $05
3278  02        .byte $02
3279  02        .byte $02
327A  08        php 
327B  08        php 
327C  08        php 
327D  08        php 
327E  0A        asl a
327F  08        php 
3280  0A        asl a
3281  08        php 
3282  08        php 
3283  02        .byte $02
3284  02        .byte $02
3285  02        .byte $02
3286  02        .byte $02
3287  01 75     ora ($75,x)
3289  75 75     adc $75,x
328B  75 15     adc $15,x
328D  A5 87     lda $87
328F  F0 03     beq $3294
3291  20 A2 92  jsr $92A2
3294  A5 19     lda $19
3296  29 01     and #$01
3298  D0 06     bne $32A0
329A  A5 3D     lda $3D
329C  F0 02     beq $32A0
329E  C6 3D     dec $3D
32A0  C6 69     dec $69
32A2  10 2E     bpl $32D2
32A4  A9 20     lda #$20
32A6  85 69     sta $69
32A8  A5 6A     lda $6A
32AA  30 26     bmi $32D2
32AC  F0 05     beq $32B3
32AE  C6 6A     dec $6A
32B0  20 D1 9D  jsr $9DD1
32B3  A9 FF     lda #$FF
32B5  8D 51 8E  sta $8E51
32B8  A5 6A     lda $6A
32BA  18        clc 
32BB  69 30     adc #$30
32BD  20 56 85  jsr $8556
32C0  A9 0F     lda #$0F
32C2  8D 51 8E  sta $8E51
32C5  A5 6A     lda $6A
32C7  D0 09     bne $32D2
32C9  A9 01     lda #$01
32CB  85 2A     sta $2A
32CD  A9 FF     lda #$FF
32CF  8D 20 B5  sta $B520
32D2  60        rts 
32D3  4C 0D 85  jmp $850D
32D6  A2 A9     ldx #$A9
32D8  A0 59     ldy #$59
32DA  20 00 93  jsr $9300
32DD  20 4E 8F  jsr $8F4E
32E0  A2 09     ldx #$09
32E2  A0 5A     ldy #$5A
32E4  20 00 93  jsr $9300
32E7  20 4E 8F  jsr $8F4E
32EA  60        rts 
32EB  18        clc 
32EC  65 87     adc $87
32EE  85 87     sta $87
32F0  60        rts 
32F1  A9 00     lda #$00
32F3  85 A8     sta $A8
32F5  8D F0 84  sta $84F0
32F8  A2 00     ldx #$00
32FA  86 3C     stx $3C
32FC  86 87     stx $87
32FE  86 7A     stx $7A
3300  EE F0 84  inc $84F0
3303  BD FA A1  lda $A1FA,x
3306  C9 FF     cmp #$FF
3308  F0 C9     beq $32D3
330A  85 83     sta $83
330C  BD FF A1  lda $A1FF,x
330F  48        pha 
3310  29 1C     and #$1C
3312  85 84     sta $84
3314  68        pla 
3315  29 03     and #$03
3317  A8        tay 
3318  B9 06 88  lda $8806,y
331B  85 86     sta $86
331D  A4 83     ldy $83
331F  C0 05     cpy #$05
3321  D0 15     bne $3338
3323  BD 52 A3  lda $A352,x
3326  09 02     ora #$02
3328  9D 52 A3  sta $A352,x
332B  AD 20 B5  lda $B520
332E  F0 08     beq $3338
3330  BD 52 A3  lda $A352,x
3333  29 FD     and #$FD
3335  9D 52 A3  sta $A352,x
3338  C0 06     cpy #$06
333A  D0 1F     bne $335B
333C  A5 6A     lda $6A
333E  30 1B     bmi $335B
3340  F0 19     beq $335B
3342  A5 69     lda $69
3344  29 04     and #$04
3346  D0 0B     bne $3353
3348  BD 52 A3  lda $A352,x
334B  09 02     ora #$02
334D  9D 52 A3  sta $A352,x
3350  4C DB 85  jmp $85DB
3353  BD 52 A3  lda $A352,x
3356  29 FD     and #$FD
3358  9D 52 A3  sta $A352,x
335B  A9 FF     lda #$FF
335D  85 AB     sta $AB
335F  A6 7A     ldx $7A
3361  BD 52 A3  lda $A352,x
3364  29 FE     and #$FE
3366  9D 52 A3  sta $A352,x
3369  BD 52 A3  lda $A352,x
336C  29 02     and #$02
336E  D0 03     bne $3373
3370  4C F8 87  jmp $87F8
3373  20 0A 88  jsr $880A
3376  A5 83     lda $83
3378  C9 05     cmp #$05
337A  F0 1B     beq $3397
337C  A5 6A     lda $6A
337E  D0 17     bne $3397
3380  A5 02     lda $02
3382  D0 04     bne $3388
3384  A9 0F     lda #$0F
3386  85 02     sta $02
3388  A9 3C     lda #$3C
338A  85 44     sta $44
338C  A9 01     lda #$01
338E  85 8D     sta $8D
3390  A9 00     lda #$00
3392  85 76     sta $76
3394  4C BE 86  jmp $86BE
3397  A6 83     ldx $83
3399  BD F1 84  lda $84F1,x
339C  85 81     sta $81
339E  BD FA 84  lda $84FA,x
33A1  85 82     sta $82
33A3  BD 03 85  lda $8503,x
33A6  85 8D     sta $8D
33A8  BD 08 85  lda $8508,x
33AB  85 76     sta $76
33AD  A2 03     ldx #$03
33AF  BD 20 07  lda $0720,x
33B2  F0 68     beq $341C
33B4  BD A0 07  lda $07A0,x
33B7  D0 63     bne $341C
33B9  38        sec 
33BA  BD 20 06  lda $0620,x
33BD  E5 7D     sbc $7D
33BF  90 5B     bcc $341C
33C1  C5 81     cmp $81
33C3  B0 57     bcs $341C
33C5  38        sec 
33C6  BD 60 06  lda $0660,x
33C9  E5 7E     sbc $7E
33CB  A8        tay 
33CC  BD 80 06  lda $0680,x
33CF  E5 7F     sbc $7F
33D1  D0 49     bne $341C
33D3  C4 82     cpy $82
33D5  B0 45     bcs $341C
33D7  BD 20 07  lda $0720,x
33DA  29 80     and #$80
33DC  9D 20 07  sta $0720,x
33DF  A5 83     lda $83
33E1  C9 07     cmp #$07
33E3  F0 07     beq $33EC
33E5  C9 08     cmp #$08
33E7  F0 03     beq $33EC
33E9  4C 73 86  jmp $8673
33EC  A9 FF     lda #$FF
33EE  85 6B     sta $6B
33F0  20 9F 86  jsr $869F
33F3  A5 83     lda $83
33F5  C9 06     cmp #$06
33F7  D0 3F     bne $3438
33F9  20 9F 86  jsr $869F
33FC  20 B8 AA  jsr $AAB8
33FF  29 1F     and #$1F
3401  65 3E     adc $3E
3403  85 3D     sta $3D
3405  85 3E     sta $3E
3407  90 2C     bcc $3435
3409  A5 6A     lda $6A
340B  10 28     bpl $3435
340D  A9 FF     lda #$FF
340F  85 3D     sta $3D
3411  A9 0A     lda #$0A
3413  85 6A     sta $6A
3415  A9 01     lda #$01
3417  85 69     sta $69
3419  4C B5 86  jmp $86B5
341C  4C E5 86  jmp $86E5
341F  BD 20 06  lda $0620,x
3422  85 89     sta $89
3424  BD 80 06  lda $0680,x
3427  85 8B     sta $8B
3429  BD 60 06  lda $0660,x
342C  85 8A     sta $8A
342E  A9 04     lda #$04
3430  85 8D     sta $8D
3432  4C F5 9E  jmp $9EF5
3435  4C EB 86  jmp $86EB
3438  A5 83     lda $83
343A  C9 05     cmp #$05
343C  B0 27     bcs $3465
343E  A6 7A     ldx $7A
3440  BD 52 A3  lda $A352,x
3443  29 FD     and #$FD
3445  9D 52 A3  sta $A352,x
3448  A5 7D     lda $7D
344A  69 02     adc #$02
344C  85 89     sta $89
344E  A5 7E     lda $7E
3450  69 04     adc #$04
3452  85 8A     sta $8A
3454  A5 7F     lda $7F
3456  69 00     adc #$00
3458  85 8B     sta $8B
345A  A5 76     lda $76
345C  20 6B 85  jsr $856B
345F  20 F5 9E  jsr $9EF5
3462  4C EB 86  jmp $86EB
3465  CA        dex 
3466  30 03     bmi $346B
3468  4C 2F 86  jmp $862F
346B  A5 44     lda $44
346D  30 03     bmi $3472
346F  4C 40 87  jmp $8740
3472  A5 22     lda $22
3474  D0 F9     bne $346F
3476  A5 83     lda $83
3478  C9 04     cmp #$04
347A  D0 F3     bne $346F
347C  C9 06     cmp #$06
347E  F0 EF     beq $346F
3480  A5 27     lda $27
3482  F0 EB     beq $346F
3484  A5 7D     lda $7D
3486  38        sec 
3487  E5 33     sbc $33
3489  F0 E4     beq $346F
348B  C9 06     cmp #$06
348D  B0 E0     bcs $346F
348F  A5 7E     lda $7E
3491  E5 2F     sbc $2F
3493  AA        tax 
3494  A5 7F     lda $7F
3496  E5 30     sbc $30
3498  D0 D5     bne $346F
349A  E0 1C     cpx #$1C
349C  B0 D1     bcs $346F
349E  A9 01     lda #$01
34A0  85 3C     sta $3C
34A2  A6 7A     ldx $7A
34A4  BC E0 07  ldy $07E0,x
34A7  C8        iny 
34A8  98        tya 
34A9  9D E0 07  sta $07E0,x
34AC  C9 1A     cmp #$1A
34AE  90 10     bcc $34C0
34B0  BD 52 A3  lda $A352,x
34B3  29 FD     and #$FD
34B5  9D 52 A3  sta $A352,x
34B8  A9 30     lda #$30
34BA  20 6B 85  jsr $856B
34BD  20 C4 9D  jsr $9DC4
34C0  A5 83     lda $83
34C2  C9 04     cmp #$04
34C4  B0 5C     bcs $3522
34C6  A5 3D     lda $3D
34C8  D0 58     bne $3522
34CA  A5 6A     lda $6A
34CC  10 54     bpl $3522
34CE  A5 85     lda $85
34D0  F0 50     beq $3522
34D2  20 B8 AA  jsr $AAB8
34D5  C5 A3     cmp $A3
34D7  B0 49     bcs $3522
34D9  20 85 9D  jsr $9D85
34DC  20 DD 9F  jsr $9FDD
34DF  98        tya 
34E0  AA        tax 
34E1  20 B8 AA  jsr $AAB8
34E4  29 03     and #$03
34E6  85 76     sta $76
34E8  A5 3B     lda $3B
34EA  25 86     and $86
34EC  65 84     adc $84
34EE  65 76     adc $76
34F0  29 1F     and #$1F
34F2  A8        tay 
34F3  20 C9 A9  jsr $A9C9
34F6  A9 03     lda #$03
34F8  9D A0 07  sta $07A0,x
34FB  9D 00 06  sta $0600,x
34FE  BD 20 07  lda $0720,x
3501  29 80     and #$80
3503  09 28     ora #$28
3505  9D 20 07  sta $0720,x
3508  A4 83     ldy $83
350A  A5 7D     lda $7D
350C  18        clc 
350D  79 FE 87  adc $87FE,y
3510  9D 20 06  sta $0620,x
3513  A5 7E     lda $7E
3515  79 02 88  adc $8802,y
3518  9D 60 06  sta $0660,x
351B  A5 7F     lda $7F
351D  69 00     adc #$00
351F  9D 80 06  sta $0680,x
3522  A5 19     lda $19
3524  29 07     and #$07
3526  D0 47     bne $356F
3528  A5 83     lda $83
352A  C9 06     cmp #$06
352C  D0 41     bne $356F
352E  A5 3D     lda $3D
3530  D0 3D     bne $356F
3532  A5 6A     lda $6A
3534  10 39     bpl $356F
3536  20 DD 9F  jsr $9FDD
3539  A5 7D     lda $7D
353B  18        clc 
353C  69 04     adc #$04
353E  99 20 06  sta $0620,y
3541  A9 00     lda #$00
3543  99 00 06  sta $0600,y
3546  99 A0 06  sta $06A0,y
3549  99 C0 06  sta $06C0,y
354C  A5 7E     lda $7E
354E  99 60 06  sta $0660,y
3551  A5 7F     lda $7F
3553  99 80 06  sta $0680,y
3556  A9 8E     lda #$8E
3558  99 E0 06  sta $06E0,y
355B  A9 FF     lda #$FF
355D  99 00 07  sta $0700,y
3560  A9 01     lda #$01
3562  99 A0 07  sta $07A0,y
3565  B9 20 07  lda $0720,y
3568  29 80     and #$80
356A  09 0A     ora #$0A
356C  99 20 07  sta $0720,y
356F  A6 7A     ldx $7A
3571  A5 AB     lda $AB
3573  30 03     bmi $3578
3575  20 9B 88  jsr $889B
3578  A6 7A     ldx $7A
357A  E8        inx 
357B  4C 7E 85  jmp $857E
357E  04        .byte $04
357F  04        .byte $04
3580  01 01     ora ($01,x)
3582  00        brk 
3583  08        php 
3584  00        brk 
3585  08        php 
3586  01 03     ora ($03,x)
3588  07        .byte $07
3589  0F        .byte $0F
358A  A6 7A     ldx $7A
358C  BD EE A1  lda $A1EE,x
358F  85 7D     sta $7D
3591  BD F2 A1  lda $A1F2,x
3594  85 7E     sta $7E
3596  BD F6 A1  lda $A1F6,x
3599  85 7F     sta $7F
359B  A9 00     lda #$00
359D  85 85     sta $85
359F  38        sec 
35A0  A5 7E     lda $7E
35A2  E5 03     sbc $03
35A4  85 74     sta $74
35A6  A5 7F     lda $7F
35A8  E5 04     sbc $04
35AA  85 75     sta $75
35AC  D0 22     bne $35D0
35AE  A9 01     lda #$01
35B0  85 85     sta $85
35B2  38        sec 
35B3  A5 74     lda $74
35B5  E9 38     sbc #$38
35B7  85 74     sta $74
35B9  C9 09     cmp #$09
35BB  90 13     bcc $35D0
35BD  C9 61     cmp #$61
35BF  B0 0F     bcs $35D0
35C1  A4 83     ldy $83
35C3  38        sec 
35C4  A5 7D     lda $7D
35C6  E5 62     sbc $62
35C8  69 05     adc #$05
35CA  85 73     sta $73
35CC  C9 64     cmp #$64
35CE  90 01     bcc $35D1
35D0  60        rts 
35D1  A5 7A     lda $7A
35D3  D0 13     bne $35E8
35D5  A9 00     lda #$00
35D7  85 64     sta $64
35D9  A5 7D     lda $7D
35DB  38        sec 
35DC  E9 02     sbc #$02
35DE  85 65     sta $65
35E0  A5 7F     lda $7F
35E2  85 67     sta $67
35E4  A5 7E     lda $7E
35E6  85 66     sta $66
35E8  A9 00     lda #$00
35EA  85 AB     sta $AB
35EC  A5 74     lda $74
35EE  18        clc 
35EF  2A        rol a
35F0  69 32     adc #$32
35F2  85 AC     sta $AC
35F4  A5 73     lda $73
35F6  18        clc 
35F7  2A        rol a
35F8  2A        rol a
35F9  26 AB     rol $AB
35FB  69 00     adc #$00
35FD  85 AA     sta $AA
35FF  90 02     bcc $3603
3601  E6 AB     inc $AB
3603  A5 7A     lda $7A
3605  D0 13     bne $361A
3607  A5 AC     lda $AC
3609  38        sec 
360A  E9 04     sbc #$04
360C  85 53     sta $53
360E  A5 AA     lda $AA
3610  E9 01     sbc #$01
3612  85 51     sta $51
3614  A5 AB     lda $AB
3616  E9 00     sbc #$00
3618  85 52     sta $52
361A  60        rts 
361B  A6 7A     ldx $7A
361D  BD 52 A3  lda $A352,x
3620  09 01     ora #$01
3622  9D 52 A3  sta $A352,x
3625  A5 83     lda $83
3627  C9 04     cmp #$04
3629  90 18     bcc $3643
362B  F0 25     beq $3652
362D  C9 06     cmp #$06
362F  90 50     bcc $3681
3631  F0 67     beq $369A
3633  18        clc 
3634  69 25     adc #$25
3636  85 A8     sta $A8
3638  AD EF 84  lda $84EF
363B  85 A9     sta $A9
363D  20 52 8B  jsr $8B52
3640  A6 7A     ldx $7A
3642  60        rts 
3643  69 22     adc #$22
3645  85 A8     sta $A8
3647  AD E9 84  lda $84E9
364A  85 A9     sta $A9
364C  20 52 8B  jsr $8B52
364F  A6 7A     ldx $7A
3651  60        rts 
3652  AD F0 84  lda $84F0
3655  29 01     and #$01
3657  F0 19     beq $3672
3659  A9 26     lda #$26
365B  85 A8     sta $A8
365D  AD EA 84  lda $84EA
3660  85 A9     sta $A9
3662  20 52 8B  jsr $8B52
3665  E6 A8     inc $A8
3667  AD EB 84  lda $84EB
366A  85 A9     sta $A9
366C  20 52 8B  jsr $8B52
366F  A6 7A     ldx $7A
3671  60        rts 
3672  A9 2E     lda #$2E
3674  85 A8     sta $A8
3676  AD EA 84  lda $84EA
3679  85 A9     sta $A9
367B  20 52 8B  jsr $8B52
367E  A6 7A     ldx $7A
3680  60        rts 
3681  A9 28     lda #$28
3683  85 A8     sta $A8
3685  AD AF 9A  lda $9AAF
3688  85 A9     sta $A9
368A  20 52 8B  jsr $8B52
368D  E6 A8     inc $A8
368F  AD EC 84  lda $84EC
3692  85 A9     sta $A9
3694  20 52 8B  jsr $8B52
3697  A6 7A     ldx $7A
3699  60        rts 
369A  A9 2A     lda #$2A
369C  85 A8     sta $A8
369E  AD ED 84  lda $84ED
36A1  85 A9     sta $A9
36A3  20 52 8B  jsr $8B52
36A6  E6 A8     inc $A8
36A8  AD EE 84  lda $84EE
36AB  85 A9     sta $A9
36AD  20 52 8B  jsr $8B52
36B0  A6 7A     ldx $7A
36B2  60        rts 
36B3  00        brk 
36B4  00        brk 
36B5  00        brk 
36B6  00        brk 
36B7  00        brk 
36B8  00        brk 
36B9  00        brk 
36BA  00        brk 
36BB  00        brk 
36BC  00        brk 
36BD  68        pla 
36BE  A8        tay 
36BF  68        pla 
36C0  AA        tax 
36C1  68        pla 
36C2  40        rti 
36C3  D8        cld 
36C4  A9 01     lda #$01
36C6  2C 19 D0  bit $D019
36C9  D0 19     bne $36E4
36CB  AD 0D DC  lda $DC0D
36CE  29 01     and #$01
36D0  F0 06     beq $36D8
36D2  CE 79 B4  dec $B479
36D5  4C 3D 89  jmp $893D
36D8  AD 19 D0  lda $D019
36DB  8D 19 D0  sta $D019
36DE  AD 0D DD  lda $DD0D
36E1  4C 3D 89  jmp $893D
36E4  A9 01     lda #$01
36E6  8D 19 D0  sta $D019
36E9  A4 AD     ldy $AD
36EB  B9 02 0E  lda $0E02,y
36EE  AA        tax 
36EF  C9 FF     cmp #$FF
36F1  F0 20     beq $3713
36F3  B9 03 0E  lda $0E03,y
36F6  8D 12 D0  sta $D012
36F9  B9 01 0E  lda $0E01,y
36FC  A8        tay 
36FD  B9 BA 89  lda $89BA,y
3700  8D B8 89  sta $89B8
3703  B9 BF 89  lda $89BF,y
3706  8D B9 89  sta $89B9
3709  18        clc 
370A  A5 AD     lda $AD
370C  69 03     adc #$03
370E  85 AD     sta $AD
3710  6C B8 89  jmp ($89B8)
3713  B9 01 0E  lda $0E01,y
3716  A8        tay 
3717  B9 BA 89  lda $89BA,y
371A  8D B8 89  sta $89B8
371D  B9 BF 89  lda $89BF,y
3720  8D B9 89  sta $89B9
3723  A9 00     lda #$00
3725  85 AD     sta $AD
3727  AD 00 0E  lda $0E00
372A  8D 12 D0  sta $D012
372D  AD 11 D0  lda $D011
3730  29 7F     and #$7F
3732  8D 11 D0  sta $D011
3735  6C B8 89  jmp ($89B8)
3738  00        brk 
3739  00        brk 
373A  C4 A1     cpy $A1
373C  3E 4D 8C  rol $8C4D,x
373F  89        .byte $89
3740  8A        txa 
3741  8A        txa 
3742  8A        txa 
3743  8A        txa 
3744  A9 00     lda #$00
3746  8D 21 D0  sta $D021
3749  AD 36 89  lda $8936
374C  F0 03     beq $3751
374E  20 9B 8C  jsr $8C9B
3751  A9 00     lda #$00
3753  85 AE     sta $AE
3755  85 A1     sta $A1
3757  AD 15 D0  lda $D015
375A  29 C0     and #$C0
375C  8D 15 D0  sta $D015
375F  E6 1A     inc $1A
3761  A5 1A     lda $1A
3763  29 07     and #$07
3765  38        sec 
3766  E9 06     sbc #$06
3768  B0 02     bcs $376C
376A  69 06     adc #$06
376C  8D 38 89  sta $8938
376F  EE 38 89  inc $8938
3772  20 E2 9D  jsr $9DE2
3775  A6 02     ldx $02
3777  F0 15     beq $378E
3779  BD 31 8B  lda $8B31,x
377C  A0 00     ldy #$00
377E  8D 3B 89  sta $893B
3781  A9 00     lda #$00
3783  8D 8F AF  sta $AF8F
3786  A5 1A     lda $1A
3788  29 01     and #$01
378A  F0 02     beq $378E
378C  C6 02     dec $02
378E  A9 76     lda #$76
3790  AE 8F AF  ldx $AF8F
3793  D0 02     bne $3797
3795  A9 56     lda #$56
3797  8D 18 D0  sta $D018
379A  AD 11 D0  lda $D011
379D  29 5F     and #$5F
379F  8D 11 D0  sta $D011
37A2  A9 07     lda #$07
37A4  8D 21 D0  sta $D021
37A7  A9 00     lda #$00
37A9  8D 22 D0  sta $D022
37AC  AD 3C 89  lda $893C
37AF  8D 23 D0  sta $D023
37B2  20 58 9B  jsr $9B58
37B5  20 7D 97  jsr $977D
37B8  20 00 30  jsr $3000
37BB  4C A1 8A  jmp $8AA1
37BE  AD 12 D0  lda $D012
37C1  C9 34     cmp #$34
37C3  90 F9     bcc $37BE
37C5  A9 00     lda #$00
37C7  8D 21 D0  sta $D021
37CA  4C 3D 89  jmp $893D
37CD  AD 11 D0  lda $D011
37D0  09 20     ora #$20
37D2  AA        tax 
37D3  AD 12 D0  lda $D012
37D6  C9 41     cmp #$41
37D8  90 F9     bcc $37D3
37DA  AD 18 D0  lda $D018
37DD  29 F0     and #$F0
37DF  09 08     ora #$08
37E1  8D 18 D0  sta $D018
37E4  8E 11 D0  stx $D011
37E7  AD 16 D0  lda $D016
37EA  09 10     ora #$10
37EC  AE 3A 89  ldx $893A
37EF  F0 02     beq $37F3
37F1  49 10     eor #$10
37F3  AA        tax 
37F4  AD 12 D0  lda $D012
37F7  C9 43     cmp #$43
37F9  90 F9     bcc $37F4
37FB  8E 16 D0  stx $D016
37FE  AD 3B 89  lda $893B
3801  8D 21 D0  sta $D021
3804  A9 04     lda #$04
3806  8D 22 D0  sta $D022
3809  4C 3D 89  jmp $893D
380C  AD 16 D0  lda $D016
380F  09 10     ora #$10
3811  8D 16 D0  sta $D016
3814  A9 FF     lda #$FF
3816  8D 3A 89  sta $893A
3819  4C 3D 89  jmp $893D
381C  E6 AE     inc $AE
381E  4C 3D 89  jmp $893D
3821  AD 38 89  lda $8938
3824  85 B1     sta $B1
3826  A6 AE     ldx $AE
3828  BD 00 0C  lda $0C00,x
382B  85 B3     sta $B3
382D  E6 AE     inc $AE
382F  A6 AE     ldx $AE
3831  BD 00 0C  lda $0C00,x
3834  C9 FF     cmp #$FF
3836  F0 E4     beq $381C
3838  A8        tay 
3839  A5 B3     lda $B3
383B  F0 12     beq $384F
383D  C6 B1     dec $B1
383F  D0 0E     bne $384F
3841  A5 AE     lda $AE
3843  18        clc 
3844  69 05     adc #$05
3846  C6 B3     dec $B3
3848  D0 F9     bne $3843
384A  85 AE     sta $AE
384C  4C AF 8A  jmp $8AAF
384F  A6 B2     ldx $B2
3851  E8        inx 
3852  E0 06     cpx #$06
3854  D0 02     bne $3858
3856  A2 00     ldx #$00
3858  86 B2     stx $B2
385A  98        tya 
385B  9D F8 5F  sta $5FF8,x
385E  9D F8 57  sta $57F8,x
3861  A4 AE     ldy $AE
3863  B9 01 0C  lda $0C01,y
3866  9D 27 D0  sta $D027,x
3869  BD F4 B4  lda $B4F4,x
386C  48        pha 
386D  B9 03 0C  lda $0C03,y
3870  F0 0B     beq $387D
3872  68        pla 
3873  48        pha 
3874  0D 10 D0  ora $D010
3877  8D 10 D0  sta $D010
387A  4C 08 8B  jmp $8B08
387D  68        pla 
387E  48        pha 
387F  2D 10 D0  and $D010
3882  4D 10 D0  eor $D010
3885  8D 10 D0  sta $D010
3888  8A        txa 
3889  18        clc 
388A  2A        rol a
388B  AA        tax 
388C  B9 02 0C  lda $0C02,y
388F  9D 00 D0  sta $D000,x
3892  B9 04 0C  lda $0C04,y
3895  9D 01 D0  sta $D001,x
3898  68        pla 
3899  0D 15 D0  ora $D015
389C  8D 15 D0  sta $D015
389F  18        clc 
38A0  A5 AE     lda $AE
38A2  69 05     adc #$05
38A4  85 AE     sta $AE
38A6  4C AF 8A  jmp $8AAF
38A9  01 02     ora ($02,x)
38AB  04        .byte $04
38AC  08        php 
38AD  10 20     bpl $38CF
38AF  40        rti 
38B0  80        .byte $80
38B1  00        brk 
38B2  00        brk 
38B3  06 02     asl $02
38B5  04        .byte $04
38B6  05 03     ora $03
38B8  07        .byte $07
38B9  01 01     ora ($01,x)
38BB  07        .byte $07
38BC  03        .byte $03
38BD  05 04     ora $04
38BF  02        .byte $02
38C0  06 A9     asl $A9
38C2  00        brk 
38C3  8D 33 89  sta $8933
38C6  8D 34 89  sta $8934
38C9  A9 FF     lda #$FF
38CB  8D 00 0F  sta $0F00
38CE  8D C0 07  sta $07C0
38D1  60        rts 
38D2  AD 34 89  lda $8934
38D5  C9 1F     cmp #$1F
38D7  90 01     bcc $38DA
38D9  60        rts 
38DA  AE 33 89  ldx $8933
38DD  A0 00     ldy #$00
38DF  B9 A8 00  lda $00A8,y
38E2  9D 00 0F  sta $0F00,x
38E5  E8        inx 
38E6  C8        iny 
38E7  C0 05     cpy #$05
38E9  D0 F4     bne $38DF
38EB  A9 FF     lda #$FF
38ED  9D 00 0F  sta $0F00,x
38F0  A2 00     ldx #$00
38F2  BD C0 07  lda $07C0,x
38F5  C9 FF     cmp #$FF
38F7  F0 0C     beq $3905
38F9  A8        tay 
38FA  B9 04 0F  lda $0F04,y
38FD  C5 AC     cmp $AC
38FF  B0 04     bcs $3905
3901  E8        inx 
3902  4C 72 8B  jmp $8B72
3905  8E 97 8B  stx $8B97
3908  AE 34 89  ldx $8934
390B  E8        inx 
390C  8E 34 89  stx $8934
390F  CA        dex 
3910  BD C0 07  lda $07C0,x
3913  9D C1 07  sta $07C1,x
3916  E0 00     cpx #$00
3918  D0 F5     bne $390F
391A  AD 33 89  lda $8933
391D  9D C0 07  sta $07C0,x
3920  18        clc 
3921  69 05     adc #$05
3923  8D 33 89  sta $8933
3926  60        rts 
3927  A0 00     ldy #$00
3929  A5 71     lda $71
392B  C9 07     cmp #$07
392D  90 03     bcc $3932
392F  E9 06     sbc #$06
3931  A8        tay 
3932  98        tya 
3933  A4 B4     ldy $B4
3935  99 00 0D  sta $0D00,y
3938  A4 72     ldy $72
393A  A9 FF     lda #$FF
393C  99 00 0D  sta $0D00,y
393F  A4 73     ldy $73
3941  A9 FF     lda #$FF
3943  99 80 0E  sta $0E80,y
3946  C8        iny 
3947  A9 00     lda #$00
3949  99 80 0E  sta $0E80,y
394C  C8        iny 
394D  A9 FF     lda #$FF
394F  99 80 0E  sta $0E80,y
3952  78        sei 
3953  84 B0     sty $B0
3955  A5 72     lda $72
3957  85 AF     sta $AF
3959  58        cli 
395A  A9 FF     lda #$FF
395C  8D 36 89  sta $8936
395F  A9 00     lda #$00
3961  8D 37 89  sta $8937
3964  60        rts 
3965  4C A7 8B  jmp $8BA7
3968  A9 FF     lda #$FF
396A  8D 37 89  sta $8937
396D  A9 00     lda #$00
396F  85 70     sta $70
3971  8D 34 89  sta $8934
3974  85 72     sta $72
3976  85 73     sta $73
3978  85 71     sta $71
397A  85 B4     sta $B4
397C  CE 34 89  dec $8934
397F  E6 72     inc $72
3981  EE 34 89  inc $8934
3984  AE 34 89  ldx $8934
3987  BD C0 07  lda $07C0,x
398A  C9 FF     cmp #$FF
398C  F0 D7     beq $3965
398E  AA        tax 
398F  BD 04 0F  lda $0F04,x
3992  C5 70     cmp $70
3994  B0 31     bcs $39C7
3996  A4 72     ldy $72
3998  BD 00 0F  lda $0F00,x
399B  99 00 0D  sta $0D00,y
399E  E8        inx 
399F  C8        iny 
39A0  BD 00 0F  lda $0F00,x
39A3  99 00 0D  sta $0D00,y
39A6  E8        inx 
39A7  C8        iny 
39A8  BD 00 0F  lda $0F00,x
39AB  99 00 0D  sta $0D00,y
39AE  E8        inx 
39AF  C8        iny 
39B0  BD 00 0F  lda $0F00,x
39B3  99 00 0D  sta $0D00,y
39B6  E8        inx 
39B7  C8        iny 
39B8  BD 00 0F  lda $0F00,x
39BB  99 00 0D  sta $0D00,y
39BE  E8        inx 
39BF  C8        iny 
39C0  E6 71     inc $71
39C2  84 72     sty $72
39C4  4C 01 8C  jmp $8C01
39C7  48        pha 
39C8  A5 70     lda $70
39CA  D0 08     bne $39D4
39CC  68        pla 
39CD  69 0C     adc #$0C
39CF  85 70     sta $70
39D1  4C 16 8C  jmp $8C16
39D4  A4 72     ldy $72
39D6  A9 FF     lda #$FF
39D8  99 00 0D  sta $0D00,y
39DB  E6 72     inc $72
39DD  A0 00     ldy #$00
39DF  A5 71     lda $71
39E1  C9 07     cmp #$07
39E3  90 03     bcc $39E8
39E5  E9 06     sbc #$06
39E7  A8        tay 
39E8  98        tya 
39E9  A4 B4     ldy $B4
39EB  99 00 0D  sta $0D00,y
39EE  A5 72     lda $72
39F0  85 B4     sta $B4
39F2  E6 72     inc $72
39F4  A9 00     lda #$00
39F6  85 71     sta $71
39F8  68        pla 
39F9  69 0C     adc #$0C
39FB  90 02     bcc $39FF
39FD  A9 FF     lda #$FF
39FF  85 70     sta $70
3A01  E9 19     sbc #$19
3A03  A4 73     ldy $73
3A05  99 80 0E  sta $0E80,y
3A08  C8        iny 
3A09  A9 01     lda #$01
3A0B  99 80 0E  sta $0E80,y
3A0E  C8        iny 
3A0F  A9 00     lda #$00
3A11  99 80 0E  sta $0E80,y
3A14  C8        iny 
3A15  84 73     sty $73
3A17  4C 16 8C  jmp $8C16
3A1A  60        rts 
3A1B  AD 37 89  lda $8937
3A1E  30 FA     bmi $3A1A
3A20  A6 AF     ldx $AF
3A22  E8        inx 
3A23  BD FF 0C  lda $0CFF,x
3A26  9D FF 0B  sta $0BFF,x
3A29  CA        dex 
3A2A  D0 F7     bne $3A23
3A2C  A6 B0     ldx $B0
3A2E  E8        inx 
3A2F  AD 39 89  lda $8939
3A32  F0 03     beq $3A37
3A34  4C 4E 8D  jmp $8D4E
3A37  A9 00     lda #$00
3A39  8D 3A 89  sta $893A
3A3C  BD 7F 0E  lda $0E7F,x
3A3F  9D 05 0E  sta $0E05,x
3A42  CA        dex 
3A43  D0 F7     bne $3A3C
3A45  8E 36 89  stx $8936
3A48  AD 90 AF  lda $AF90
3A4B  F0 09     beq $3A56
3A4D  CE 90 AF  dec $AF90
3A50  AD 1F D0  lda $D01F
3A53  AD 1E D0  lda $D01E
3A56  A5 4A     lda $4A
3A58  F0 05     beq $3A5F
3A5A  C6 4A     dec $4A
3A5C  4C E8 8C  jmp $8CE8
3A5F  AD 1E D0  lda $D01E
3A62  10 04     bpl $3A68
3A64  A9 FF     lda #$FF
3A66  85 2A     sta $2A
3A68  AD 1E D0  lda $D01E
3A6B  AD 1F D0  lda $D01F
3A6E  2A        rol a
3A6F  90 06     bcc $3A77
3A71  48        pha 
3A72  A9 FF     lda #$FF
3A74  85 2A     sta $2A
3A76  68        pla 
3A77  2A        rol a
3A78  90 10     bcc $3A8A
3A7A  A5 0C     lda $0C
3A7C  C9 01     cmp #$01
3A7E  D0 06     bne $3A86
3A80  A5 0B     lda $0B
3A82  C9 78     cmp #$78
3A84  90 04     bcc $3A8A
3A86  A9 FF     lda #$FF
3A88  85 2B     sta $2B
3A8A  AD 92 97  lda $9792
3A8D  8D 0F D0  sta $D00F
3A90  AD 93 97  lda $9793
3A93  8D 0E D0  sta $D00E
3A96  AD 96 97  lda $9796
3A99  8D FF 5F  sta $5FFF
3A9C  8D FF 57  sta $57FF
3A9F  AD B0 9A  lda $9AB0
3AA2  8D 0D D0  sta $D00D
3AA5  AD B1 9A  lda $9AB1
3AA8  8D 0C D0  sta $D00C
3AAB  AD 10 D0  lda $D010
3AAE  29 3F     and #$3F
3AB0  0D 94 97  ora $9794
3AB3  0D B2 9A  ora $9AB2
3AB6  8D 10 D0  sta $D010
3AB9  AD 15 D0  lda $D015
3ABC  29 3F     and #$3F
3ABE  0D 95 97  ora $9795
3AC1  0D B3 9A  ora $9AB3
3AC4  8D 15 D0  sta $D015
3AC7  AD 98 97  lda $9798
3ACA  8D 2E D0  sta $D02E
3ACD  60        rts 
3ACE  A9 FF     lda #$FF
3AD0  8D 3A 89  sta $893A
3AD3  BD 7F 0E  lda $0E7F,x
3AD6  9D 08 0E  sta $0E08,x
3AD9  CA        dex 
3ADA  D0 F7     bne $3AD3
3ADC  A9 B8     lda #$B8
3ADE  8D 06 0E  sta $0E06
3AE1  A9 04     lda #$04
3AE3  8D 07 0E  sta $0E07
3AE6  A9 00     lda #$00
3AE8  8D 08 0E  sta $0E08
3AEB  8D 36 89  sta $8936
3AEE  60        rts 
3AEF  14        .byte $14
3AF0  0D 00 00  ora $0000
3AF3  00        brk 
3AF4  00        brk 
3AF5  00        brk 
3AF6  00        brk 
3AF7  33        .byte $33
3AF8  57        .byte $57
3AF9  41 34     eor ($34,x)
3AFB  5A        .byte $5A
3AFC  53        .byte $53
3AFD  45 00     eor $00
3AFF  35 52     and $52,x
3B01  44        .byte $44
3B02  36 43     rol $43,x
3B04  46 54     lsr $54
3B06  58        cli 
3B07  37        .byte $37
3B08  59 47 38  eor $3847,y
3B0B  42        .byte $42
3B0C  48        pha 
3B0D  55 56     eor $56,x
3B0F  39 49 4A  and $4A49,y
3B12  30 4D     bmi $3B61
3B14  4B        .byte $4B
3B15  4F        .byte $4F
3B16  4E 2B 50  lsr $502B
3B19  4C 2D 2E  jmp $2E2D
3B1C  3A        .byte $3A
3B1D  40        rti 
3B1E  2C 5C 2A  bit $2A5C
3B21  3B        .byte $3B
3B22  00        brk 
3B23  00        brk 
3B24  3D 5E 2F  and $2F5E,x
3B27  31 00     and ($00),y
3B29  00        brk 
3B2A  32        .byte $32
3B2B  20 00 51  jsr $5100
3B2E  00        brk 
3B2F  00        brk 
3B30  00        brk 
3B31  00        brk 
3B32  00        brk 
3B33  8A        txa 
3B34  48        pha 
3B35  98        tya 
3B36  48        pha 
3B37  20 35 8E  jsr $8E35
3B3A  CD B2 8D  cmp $8DB2
3B3D  F0 F8     beq $3B37
3B3F  8D B2 8D  sta $8DB2
3B42  AE AF 8D  ldx $8DAF
3B45  30 0A     bmi $3B51
3B47  20 84 B4  jsr $B484
3B4A  F0 05     beq $3B51
3B4C  A9 80     lda #$80
3B4E  8D AF 8D  sta $8DAF
3B51  AE B0 8D  ldx $8DB0
3B54  30 0A     bmi $3B60
3B56  20 84 B4  jsr $B484
3B59  F0 05     beq $3B60
3B5B  A9 80     lda #$80
3B5D  8D B0 8D  sta $8DB0
3B60  AD AF 8D  lda $8DAF
3B63  30 08     bmi $3B6D
3B65  AD B0 8D  lda $8DB0
3B68  30 0E     bmi $3B78
3B6A  4C B7 8D  jmp $8DB7
3B6D  AD B0 8D  lda $8DB0
3B70  8D AF 8D  sta $8DAF
3B73  A9 80     lda #$80
3B75  8D B0 8D  sta $8DB0
3B78  A2 00     ldx #$00
3B7A  A0 00     ldy #$00
3B7C  B9 DA 9D  lda $9DDA,y
3B7F  85 FD     sta $FD
3B81  18        clc 
3B82  66 FD     ror $FD
3B84  B0 0E     bcs $3B94
3B86  E8        inx 
3B87  8A        txa 
3B88  29 07     and #$07
3B8A  D0 F5     bne $3B81
3B8C  C8        iny 
3B8D  C0 08     cpy #$08
3B8F  D0 EB     bne $3B7C
3B91  4C B7 8D  jmp $8DB7
3B94  EC AF 8D  cpx $8DAF
3B97  F0 ED     beq $3B86
3B99  8E B0 8D  stx $8DB0
3B9C  AD B2 8D  lda $8DB2
3B9F  49 FF     eor #$FF
3BA1  8D B2 8D  sta $8DB2
3BA4  AE B0 8D  ldx $8DB0
3BA7  BD 6F 8D  lda $8D6F,x
3BAA  8D B1 8D  sta $8DB1
3BAD  68        pla 
3BAE  A8        tay 
3BAF  68        pla 
3BB0  AA        tax 
3BB1  AD B1 8D  lda $8DB1
3BB4  60        rts 
3BB5  08        php 
3BB6  A9 00     lda #$00
3BB8  A2 07     ldx #$07
3BBA  5D DA 9D  eor $9DDA,x
3BBD  CA        dex 
3BBE  10 FA     bpl $3BBA
3BC0  28        plp 
3BC1  60        rts 
3BC2  A9 80     lda #$80
3BC4  8D AF 8D  sta $8DAF
3BC7  8D B0 8D  sta $8DB0
3BCA  20 35 8E  jsr $8E35
3BCD  8D B2 8D  sta $8DB2
3BD0  60        rts 
3BD1  00        brk 
3BD2  00        brk 
3BD3  1E FC FE  asl $FEFC,x
3BD6  FE FE FE  inc $FEFE,x
3BD9  F8        sed 
3BDA  C6 7E     dec $7E
3BDC  7E CC C0  ror $C0CC,x
3BDF  FE F6 FE  inc $FEF6,x
3BE2  FE FE FE  inc $FEFE,x
3BE5  FE FE C6  inc $C6FE,x
3BE8  C6 C6     dec $C6
3BEA  C6 C6     dec $C6
3BEC  FE FE 78  inc $78FE,x
3BEF  7E 78 C0  ror $C078,x
3BF2  F8        sed 
3BF3  F0 FE     beq $3BF3
3BF5  7C        .byte $7C
3BF6  FE 00 36  inc $3600,x
3BF9  CC C6 C6  cpy $C6C6
3BFC  C0 C0     cpy #$C0
3BFE  C0 C6     cpy #$C6
3C00  18        clc 
3C01  18        clc 
3C02  D8        cld 
3C03  C0 D6     cpy #$D6
3C05  D6 C6     dec $C6,x
3C07  C6 C6     dec $C6
3C09  C6 C0     dec $C0
3C0B  30 C6     bmi $3BD3
3C0D  C6 C6     dec $C6
3C0F  6C C6 06  jmp ($06C6)
3C12  C6 18     dec $18
3C14  06 18     asl $18
3C16  CE C0 C0  dec $C0C0
3C19  06 6C     asl $6C
3C1B  C6 00     dec $00
3C1D  66 FE     ror $FE
3C1F  C0 C6     cpy #$C6
3C21  F8        sed 
3C22  F8        sed 
3C23  DE FE 18  dec $18FE,x
3C26  18        clc 
3C27  FE C0 D6  inc $D6C0,x
3C2A  D6 C6     dec $C6,x
3C2C  C6 C6     dec $C6
3C2E  FE FE 30  inc $30FE,x
3C31  C6 CC     dec $CC
3C33  D6 38     dec $38,x
3C35  FE FE C6  inc $C6FE,x
3C38  18        clc 
3C39  FE 7E FE  inc $FE7E,x
3C3C  FE FE 7E  inc $7EFE,x
3C3F  FE FE 30  inc $30FE,x
3C42  FE C6 C0  inc $C0C6,x
3C45  CC C0 C0  cpy $C0C0
3C48  C6 C6     dec $C6
3C4A  18        clc 
3C4B  D8        cld 
3C4C  C6 C0     dec $C0
3C4E  D6 D6     dec $D6,x
3C50  C6 FE     dec $FE
3C52  CC CC 06  cpy $06CC
3C55  30 C6     bmi $3C1D
3C57  D8        cld 
3C58  D6 6C     dec $6C,x
3C5A  06 C0     asl $C0
3C5C  DE 7E E0  dec $E07E,x
3C5F  1E 0E 0E  asl $0E0E,x
3C62  CE 70 EE  dec $EE70
3C65  1E 30 C6  asl $C630,x
3C68  FE FE F8  inc $F8FE,x
3C6B  FE C0 FE  inc $FEC0,x
3C6E  C6 7E     dec $7E
3C70  F8        sed 
3C71  C6 FE     dec $FE
3C73  C6 DE     dec $DE
3C75  FE C0 FE  inc $FEC0,x
3C78  C6 FE     dec $FE
3C7A  30 FE     bmi $3C7A
3C7C  F0 FE     beq $3C7C
3C7E  C6 7E     dec $7E
3C80  FE FE 7E  inc $7EFE,x
3C83  FE FE 0E  inc $0EFE,x
3C86  FE FE 70  inc $70FE,x
3C89  FE 1E 18  inc $181E,x
3C8C  A5 FB     lda $FB
3C8E  69 08     adc #$08
3C90  85 FB     sta $FB
3C92  90 02     bcc $3C96
3C94  E6 FC     inc $FC
3C96  60        rts 
3C97  A9 00     lda #$00
3C99  A0 04     ldy #$04
3C9B  91 FB     sta ($FB),y
3C9D  38        sec 
3C9E  A5 FB     lda $FB
3CA0  E9 08     sbc #$08
3CA2  85 FB     sta $FB
3CA4  B0 02     bcs $3CA8
3CA6  C6 FC     dec $FC
3CA8  60        rts 
3CA9  AD D3 8F  lda $8FD3
3CAC  F0 06     beq $3CB4
3CAE  A9 FF     lda #$FF
3CB0  A0 04     ldy #$04
3CB2  91 FB     sta ($FB),y
3CB4  68        pla 
3CB5  A8        tay 
3CB6  68        pla 
3CB7  AA        tax 
3CB8  68        pla 
3CB9  18        clc 
3CBA  60        rts 
3CBB  48        pha 
3CBC  98        tya 
3CBD  48        pha 
3CBE  A0 00     ldy #$00
3CC0  AD 51 8E  lda $8E51
3CC3  91 B5     sta ($B5),y
3CC5  E6 B5     inc $B5
3CC7  D0 02     bne $3CCB
3CC9  E6 B6     inc $B6
3CCB  68        pla 
3CCC  A8        tay 
3CCD  68        pla 
3CCE  8D D2 8F  sta $8FD2
3CD1  48        pha 
3CD2  8A        txa 
3CD3  48        pha 
3CD4  98        tya 
3CD5  48        pha 
3CD6  AD D2 8F  lda $8FD2
3CD9  C9 07     cmp #$07
3CDB  F0 27     beq $3D04
3CDD  C9 20     cmp #$20
3CDF  90 C8     bcc $3CA9
3CE1  F0 1B     beq $3CFE
3CE3  C9 7F     cmp #$7F
3CE5  F0 2D     beq $3D14
3CE7  C9 30     cmp #$30
3CE9  90 04     bcc $3CEF
3CEB  C9 3A     cmp #$3A
3CED  90 37     bcc $3D26
3CEF  09 20     ora #$20
3CF1  C9 61     cmp #$61
3CF3  90 04     bcc $3CF9
3CF5  C9 7B     cmp #$7B
3CF7  90 27     bcc $3D20
3CF9  A9 00     lda #$00
3CFB  4C AC 8F  jmp $8FAC
3CFE  20 87 8F  jsr $8F87
3D01  4C 29 8F  jmp $8F29
3D04  4C 29 8F  jmp $8F29
3D07  A0 04     ldy #$04
3D09  A9 00     lda #$00
3D0B  91 FB     sta ($FB),y
3D0D  88        dey 
3D0E  10 FB     bpl $3D0B
3D10  20 0B 8F  jsr $8F0B
3D13  60        rts 
3D14  20 17 8F  jsr $8F17
3D17  20 87 8F  jsr $8F87
3D1A  20 17 8F  jsr $8F17
3D1D  4C 29 8F  jmp $8F29
3D20  38        sec 
3D21  E9 60     sbc #$60
3D23  4C AC 8F  jmp $8FAC
3D26  38        sec 
3D27  E9 15     sbc #$15
3D29  4C AC 8F  jmp $8FAC
3D2C  AA        tax 
3D2D  A0 00     ldy #$00
3D2F  BD 52 8E  lda $8E52,x
3D32  91 FB     sta ($FB),y
3D34  C8        iny 
3D35  BD 77 8E  lda $8E77,x
3D38  91 FB     sta ($FB),y
3D3A  C8        iny 
3D3B  BD 9C 8E  lda $8E9C,x
3D3E  91 FB     sta ($FB),y
3D40  C8        iny 
3D41  BD C1 8E  lda $8EC1,x
3D44  91 FB     sta ($FB),y
3D46  C8        iny 
3D47  BD E6 8E  lda $8EE6,x
3D4A  91 FB     sta ($FB),y
3D4C  20 0B 8F  jsr $8F0B
3D4F  4C 29 8F  jmp $8F29
3D52  00        brk 
3D53  00        brk 
3D54  85 8B     sta $8B
3D56  A9 00     lda #$00
3D58  85 89     sta $89
3D5A  85 8A     sta $8A
3D5C  85 8C     sta $8C
3D5E  A5 88     lda $88
3D60  10 0E     bpl $3D70
3D62  49 FF     eor #$FF
3D64  85 88     sta $88
3D66  E6 88     inc $88
3D68  A5 8B     lda $8B
3D6A  49 FF     eor #$FF
3D6C  85 8B     sta $8B
3D6E  E6 8B     inc $8B
3D70  A5 8B     lda $8B
3D72  10 04     bpl $3D78
3D74  A9 FF     lda #$FF
3D76  85 8C     sta $8C
3D78  A2 08     ldx #$08
3D7A  66 88     ror $88
3D7C  90 0D     bcc $3D8B
3D7E  A5 8B     lda $8B
3D80  18        clc 
3D81  65 89     adc $89
3D83  85 89     sta $89
3D85  A5 8C     lda $8C
3D87  65 8A     adc $8A
3D89  85 8A     sta $8A
3D8B  18        clc 
3D8C  26 8B     rol $8B
3D8E  26 8C     rol $8C
3D90  CA        dex 
3D91  D0 E7     bne $3D7A
3D93  60        rts 
3D94  18        clc 
3D95  A5 05     lda $05
3D97  65 62     adc $62
3D99  85 62     sta $62
3D9B  18        clc 
3D9C  A5 06     lda $06
3D9E  30 19     bmi $3DB9
3DA0  F0 2B     beq $3DCD
3DA2  65 03     adc $03
3DA4  85 03     sta $03
3DA6  90 02     bcc $3DAA
3DA8  E6 04     inc $04
3DAA  A5 06     lda $06
3DAC  48        pha 
3DAD  20 0F 84  jsr $840F
3DB0  68        pla 
3DB1  38        sec 
3DB2  E9 01     sbc #$01
3DB4  D0 F6     bne $3DAC
3DB6  4C 4D 90  jmp $904D
3DB9  65 03     adc $03
3DBB  85 03     sta $03
3DBD  B0 02     bcs $3DC1
3DBF  C6 04     dec $04
3DC1  A5 06     lda $06
3DC3  48        pha 
3DC4  20 FE 83  jsr $83FE
3DC7  68        pla 
3DC8  18        clc 
3DC9  69 01     adc #$01
3DCB  D0 F6     bne $3DC3
3DCD  20 7D 91  jsr $917D
3DD0  38        sec 
3DD1  A5 0B     lda $0B
3DD3  E5 03     sbc $03
3DD5  38        sec 
3DD6  E9 38     sbc #$38
3DD8  85 4C     sta $4C
3DDA  38        sec 
3DDB  A5 16     lda $16
3DDD  30 24     bmi $3E03
3DDF  A5 4C     lda $4C
3DE1  C9 46     cmp #$46
3DE3  B0 16     bcs $3DFB
3DE5  A5 06     lda $06
3DE7  30 0F     bmi $3DF8
3DE9  F0 0D     beq $3DF8
3DEB  A6 16     ldx $16
3DED  E8        inx 
3DEE  E4 06     cpx $06
3DF0  B0 06     bcs $3DF8
3DF2  C6 06     dec $06
3DF4  D0 02     bne $3DF8
3DF6  E6 06     inc $06
3DF8  4C A1 90  jmp $90A1
3DFB  A6 16     ldx $16
3DFD  E8        inx 
3DFE  86 06     stx $06
3E00  4C A1 90  jmp $90A1
3E03  A5 4C     lda $4C
3E05  C9 20     cmp #$20
3E07  90 13     bcc $3E1C
3E09  A5 06     lda $06
3E0B  10 0C     bpl $3E19
3E0D  A5 06     lda $06
3E0F  C5 16     cmp $16
3E11  B0 06     bcs $3E19
3E13  E6 06     inc $06
3E15  D0 02     bne $3E19
3E17  C6 06     dec $06
3E19  4C A1 90  jmp $90A1
3E1C  A6 16     ldx $16
3E1E  CA        dex 
3E1F  86 06     stx $06
3E21  A5 06     lda $06
3E23  F0 19     beq $3E3E
3E25  30 0D     bmi $3E34
3E27  A5 4C     lda $4C
3E29  C9 2D     cmp #$2D
3E2B  B0 11     bcs $3E3E
3E2D  A9 00     lda #$00
3E2F  85 06     sta $06
3E31  4C BE 90  jmp $90BE
3E34  A5 4C     lda $4C
3E36  C9 39     cmp #$39
3E38  90 04     bcc $3E3E
3E3A  A9 00     lda #$00
3E3C  85 06     sta $06
3E3E  38        sec 
3E3F  A5 09     lda $09
3E41  E5 62     sbc $62
3E43  85 4B     sta $4B
3E45  38        sec 
3E46  E9 14     sbc #$14
3E48  B0 05     bcs $3E4F
3E4A  85 05     sta $05
3E4C  4C DA 90  jmp $90DA
3E4F  A5 4B     lda $4B
3E51  38        sec 
3E52  E9 32     sbc #$32
3E54  F0 04     beq $3E5A
3E56  90 02     bcc $3E5A
3E58  85 05     sta $05
3E5A  A5 05     lda $05
3E5C  F0 33     beq $3E91
3E5E  30 1A     bmi $3E7A
3E60  A5 4B     lda $4B
3E62  C9 1D     cmp #$1D
3E64  B0 07     bcs $3E6D
3E66  A9 00     lda #$00
3E68  85 05     sta $05
3E6A  4C 11 91  jmp $9111
3E6D  C9 32     cmp #$32
3E6F  B0 20     bcs $3E91
3E71  C6 05     dec $05
3E73  D0 1C     bne $3E91
3E75  E6 05     inc $05
3E77  4C 11 91  jmp $9111
3E7A  A5 4B     lda $4B
3E7C  C9 29     cmp #$29
3E7E  90 07     bcc $3E87
3E80  A9 00     lda #$00
3E82  85 05     sta $05
3E84  4C 11 91  jmp $9111
3E87  C9 14     cmp #$14
3E89  90 06     bcc $3E91
3E8B  E6 05     inc $05
3E8D  D0 02     bne $3E91
3E8F  C6 05     dec $05
3E91  A5 62     lda $62
3E93  F0 04     beq $3E99
3E95  C9 D8     cmp #$D8
3E97  90 04     bcc $3E9D
3E99  A9 AF     lda #$AF
3E9B  D0 06     bne $3EA3
3E9D  C9 B0     cmp #$B0
3E9F  90 5B     bcc $3EFC
3EA1  A9 51     lda #$51
3EA3  85 80     sta $80
3EA5  A5 62     lda $62
3EA7  18        clc 
3EA8  65 80     adc $80
3EAA  85 62     sta $62
3EAC  A5 09     lda $09
3EAE  18        clc 
3EAF  65 80     adc $80
3EB1  85 09     sta $09
3EB3  A5 33     lda $33
3EB5  18        clc 
3EB6  65 80     adc $80
3EB8  85 33     sta $33
3EBA  A5 59     lda $59
3EBC  18        clc 
3EBD  65 80     adc $80
3EBF  85 59     sta $59
3EC1  A2 1F     ldx #$1F
3EC3  BD 20 06  lda $0620,x
3EC6  18        clc 
3EC7  65 80     adc $80
3EC9  9D 20 06  sta $0620,x
3ECC  CA        dex 
3ECD  10 F4     bpl $3EC3
3ECF  A2 09     ldx #$09
3ED1  BD 77 0A  lda $0A77,x
3ED4  D0 10     bne $3EE6
3ED6  BD F7 09  lda $09F7,x
3ED9  D0 1E     bne $3EF9
3EDB  A9 50     lda #$50
3EDD  9D F7 09  sta $09F7,x
3EE0  9D 77 0A  sta $0A77,x
3EE3  4C 79 91  jmp $9179
3EE6  C9 50     cmp #$50
3EE8  D0 0F     bne $3EF9
3EEA  BD F7 09  lda $09F7,x
3EED  C9 50     cmp #$50
3EEF  D0 08     bne $3EF9
3EF1  A9 00     lda #$00
3EF3  9D 77 0A  sta $0A77,x
3EF6  9D F7 09  sta $09F7,x
3EF9  E8        inx 
3EFA  10 D5     bpl $3ED1
3EFC  60        rts 
3EFD  A5 6B     lda $6B
3EFF  F0 02     beq $3F03
3F01  C6 6B     dec $6B
3F03  AD A4 A6  lda $A6A4
3F06  C9 03     cmp #$03
3F08  F0 0F     beq $3F19
3F0A  C9 05     cmp #$05
3F0C  F0 05     beq $3F13
3F0E  C9 04     cmp #$04
3F10  F0 04     beq $3F16
3F12  60        rts 
3F13  4C 1B 92  jmp $921B
3F16  4C D8 91  jmp $91D8
3F19  38        sec 
3F1A  A9 69     lda #$69
3F1C  E5 03     sbc $03
3F1E  85 81     sta $81
3F20  A9 02     lda #$02
3F22  E5 04     sbc $04
3F24  D0 06     bne $3F2C
3F26  A5 81     lda $81
3F28  C9 F1     cmp #$F1
3F2A  90 01     bcc $3F2D
3F2C  60        rts 
3F2D  A5 6B     lda $6B
3F2F  C9 10     cmp #$10
3F31  B0 05     bcs $3F38
3F33  85 6C     sta $6C
3F35  4C C0 91  jmp $91C0
3F38  A5 6C     lda $6C
3F3A  C9 10     cmp #$10
3F3C  B0 02     bcs $3F40
3F3E  E6 6C     inc $6C
3F40  38        sec 
3F41  A9 AE     lda #$AE
3F43  E5 6C     sbc $6C
3F45  48        pha 
3F46  A5 81     lda $81
3F48  18        clc 
3F49  6D B3 84  adc $84B3
3F4C  A8        tay 
3F4D  68        pla 
3F4E  A2 0D     ldx #$0D
3F50  99 00 04  sta $0400,y
3F53  C8        iny 
3F54  CA        dex 
3F55  D0 F9     bne $3F50
3F57  60        rts 
3F58  38        sec 
3F59  A9 43     lda #$43
3F5B  E5 03     sbc $03
3F5D  85 81     sta $81
3F5F  A9 03     lda #$03
3F61  E5 04     sbc $04
3F63  D0 06     bne $3F6B
3F65  A5 81     lda $81
3F67  C9 E9     cmp #$E9
3F69  90 01     bcc $3F6C
3F6B  60        rts 
3F6C  A5 6B     lda $6B
3F6E  C9 15     cmp #$15
3F70  B0 05     bcs $3F77
3F72  85 6C     sta $6C
3F74  4C FF 91  jmp $91FF
3F77  A5 6C     lda $6C
3F79  C9 15     cmp #$15
3F7B  B0 02     bcs $3F7F
3F7D  E6 6C     inc $6C
3F7F  A5 81     lda $81
3F81  18        clc 
3F82  6D B3 84  adc $84B3
3F85  18        clc 
3F86  69 15     adc #$15
3F88  AA        tax 
3F89  A9 A6     lda #$A6
3F8B  A0 15     ldy #$15
3F8D  C4 6C     cpy $6C
3F8F  D0 02     bne $3F93
3F91  A9 98     lda #$98
3F93  9D 00 04  sta $0400,x
3F96  CA        dex 
3F97  88        dey 
3F98  D0 F3     bne $3F8D
3F9A  60        rts 
3F9B  38        sec 
3F9C  A9 70     lda #$70
3F9E  E5 03     sbc $03
3FA0  85 81     sta $81
3FA2  A9 03     lda #$03
3FA4  E5 04     sbc $04
3FA6  D0 06     bne $3FAE
3FA8  A5 81     lda $81
3FAA  C9 EF     cmp #$EF
3FAC  90 01     bcc $3FAF
3FAE  60        rts 
3FAF  A5 6B     lda $6B
3FB1  C9 12     cmp #$12
3FB3  B0 05     bcs $3FBA
3FB5  85 6C     sta $6C
3FB7  4C 42 92  jmp $9242
3FBA  A5 6C     lda $6C
3FBC  C9 12     cmp #$12
3FBE  B0 02     bcs $3FC2
3FC0  E6 6C     inc $6C
3FC2  38        sec 
3FC3  A9 C0     lda #$C0
3FC5  E5 6C     sbc $6C
3FC7  48        pha 
3FC8  A5 81     lda $81
3FCA  18        clc 
3FCB  6D B3 84  adc $84B3
3FCE  A8        tay 
3FCF  68        pla 
3FD0  18        clc 
3FD1  A2 07     ldx #$07
3FD3  99 00 04  sta $0400,y
3FD6  69 01     adc #$01
3FD8  C8        iny 
3FD9  CA        dex 
3FDA  D0 F7     bne $3FD3
3FDC  38        sec 
3FDD  A2 08     ldx #$08
3FDF  99 00 04  sta $0400,y
3FE2  E9 01     sbc #$01
3FE4  C8        iny 
3FE5  CA        dex 
3FE6  D0 F7     bne $3FDF
3FE8  60        rts 
3FE9  AD 03 94  lda $9403
3FEC  38        sec 
3FED  F8        sed 
3FEE  E9 01     sbc #$01
3FF0  8D 03 94  sta $9403
3FF3  D8        cld 
3FF4  10 0E     bpl $4004
3FF6  A2 FF     ldx #$FF
3FF8  60        rts 
3FF9  AD 03 94  lda $9403
3FFC  18        clc 
3FFD  F8        sed 
3FFE  69 01     adc #$01
