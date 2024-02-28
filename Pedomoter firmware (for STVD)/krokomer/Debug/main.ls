   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  15                     	bsct
  16  0000               _stav:
  17  0000 00            	dc.b	0
  18  0001               _wut:
  19  0001 00            	dc.b	0
  20  0002               _odp:
  21  0002 00            	dc.b	0
  22  0003               _dup:
  23  0003 00            	dc.b	0
  24  0004               _preteceni:
  25  0004 00            	dc.b	0
  26  0005               _vymaz:
  27  0005 01            	dc.b	1
  28  0006               _nab_pripojeno:
  29  0006 00            	dc.b	0
  30  0007               _wut_vyp:
  31  0007 00            	dc.b	0
  32  0008               _zobrazeno0:
  33  0008 00            	dc.b	0
  34  0009               _zobrazeno1:
  35  0009 00            	dc.b	0
  36  000a               _zobrazeno2:
  37  000a 00            	dc.b	0
  38  000b               _menu:
  39  000b 00            	dc.b	0
  40  000c               _rozdil_max_min:
  41  000c 0263          	dc.w	611
  42  000e               _minU:
  43  000e 097d          	dc.w	2429
  44  0010               _kroky:
  45  0010 00000000      	dc.l	0
  46  0014               _posun:
  47  0014 00            	dc.b	0
  48  0015 02            	dc.b	2
  49  0016 04            	dc.b	4
  50  0017 06            	dc.b	6
  51  0018 08            	dc.b	8
  52  0019               _celkovyvysledek:
  53  0019 00            	dc.b	0
  54  001a 00            	dc.b	0
  55  001b 03            	dc.b	3
  56  001c 00            	dc.b	0
  57  001d 07            	dc.b	7
  58  001e 00            	dc.b	0
  59  001f 0a            	dc.b	10
  60  0020 00            	dc.b	0
  61  0021 01            	dc.b	1
  62  0022 00            	dc.b	0
  63  0023 04            	dc.b	4
  64  0024 00            	dc.b	0
  65  0025 08            	dc.b	8
  66  0026 00            	dc.b	0
  67  0027 0b            	dc.b	11
  68  0028 00            	dc.b	0
  69  0029               _vyber:
  70  0029 01            	dc.b	1
  71  002a 03            	dc.b	3
  72  002b 04            	dc.b	4
  73  002c 20            	dc.b	32
  74  002d 08            	dc.b	8
  75  002e 03            	dc.b	3
  76  002f 0b            	dc.b	11
  77  0030 20            	dc.b	32
  78  0031 01            	dc.b	1
  79  0032 01            	dc.b	1
  80  0033 04            	dc.b	4
  81  0034 00            	dc.b	0
  82  0035 08            	dc.b	8
  83  0036 01            	dc.b	1
  84  0037 0b            	dc.b	11
  85  0038 00            	dc.b	0
  86  0039 01            	dc.b	1
  87  003a 03            	dc.b	3
  88  003b 04            	dc.b	4
  89  003c 10            	dc.b	16
  90  003d 08            	dc.b	8
  91  003e 02            	dc.b	2
  92  003f 0b            	dc.b	11
  93  0040 20            	dc.b	32
  94  0041 01            	dc.b	1
  95  0042 03            	dc.b	3
  96  0043 04            	dc.b	4
  97  0044 10            	dc.b	16
  98  0045 08            	dc.b	8
  99  0046 01            	dc.b	1
 100  0047 0b            	dc.b	11
 101  0048 20            	dc.b	32
 102  0049 01            	dc.b	1
 103  004a 01            	dc.b	1
 104  004b 04            	dc.b	4
 105  004c 30            	dc.b	48
 106  004d 08            	dc.b	8
 107  004e 01            	dc.b	1
 108  004f 0b            	dc.b	11
 109  0050 00            	dc.b	0
 110  0051 01            	dc.b	1
 111  0052 02            	dc.b	2
 112  0053 04            	dc.b	4
 113  0054 30            	dc.b	48
 114  0055 08            	dc.b	8
 115  0056 01            	dc.b	1
 116  0057 0b            	dc.b	11
 117  0058 20            	dc.b	32
 118  0059 01            	dc.b	1
 119  005a 02            	dc.b	2
 120  005b 04            	dc.b	4
 121  005c 30            	dc.b	48
 122  005d 08            	dc.b	8
 123  005e 03            	dc.b	3
 124  005f 0b            	dc.b	11
 125  0060 20            	dc.b	32
 126  0061 01            	dc.b	1
 127  0062 03            	dc.b	3
 128  0063 04            	dc.b	4
 129  0064 00            	dc.b	0
 130  0065 08            	dc.b	8
 131  0066 01            	dc.b	1
 132  0067 0b            	dc.b	11
 133  0068 00            	dc.b	0
 134  0069 01            	dc.b	1
 135  006a 03            	dc.b	3
 136  006b 04            	dc.b	4
 137  006c 30            	dc.b	48
 138  006d 08            	dc.b	8
 139  006e 03            	dc.b	3
 140  006f 0b            	dc.b	11
 141  0070 20            	dc.b	32
 142  0071 01            	dc.b	1
 143  0072 03            	dc.b	3
 144  0073 04            	dc.b	4
 145  0074 30            	dc.b	48
 146  0075 08            	dc.b	8
 147  0076 01            	dc.b	1
 148  0077 0b            	dc.b	11
 149  0078 20            	dc.b	32
 215                     ; 71 void main(void)			//nastavení požívaných preriferií, hodinového signálu a interruptù
 215                     ; 72 {
 217                     	switch	.text
 218  0000               _main:
 222                     ; 73 	disableInterrupts();
 225  0000 9b            sim
 227                     ; 74 	nastaveniCLK();
 230  0001 cd02e2        	call	_nastaveniCLK
 232                     ; 75 	nastaveniINTERRUPTU();
 234  0004 cd03bb        	call	_nastaveniINTERRUPTU
 236                     ; 76 	init_milis();
 238  0007 cd031e        	call	_init_milis
 240                     ; 77 	nastaveniGPIO();
 242  000a cd0338        	call	_nastaveniGPIO
 244                     ; 78 	nastaveniLCD();
 246  000d cd0382        	call	_nastaveniLCD
 248                     ; 79 	nastaveniADC();
 250  0010 cd03f5        	call	_nastaveniADC
 252                     ; 80 	GPIO_WriteBit(GPIOB, GPIO_Pin_2, RESET);
 254  0013 4b00          	push	#0
 255  0015 4b04          	push	#4
 256  0017 ae5005        	ldw	x,#20485
 257  001a cd0000        	call	_GPIO_WriteBit
 259  001d 85            	popw	x
 260                     ; 81 	enableInterrupts();
 263  001e 9a            rim
 265                     ; 83 	if(EEPROMcteni(0x001008) != 0 && EEPROMcteni(0x001004) != 0){			//pokud máž v EEPROM zapsány referenèní napìtí prourèení stavubaterie tak si je naèti a pracuj s nimi 
 268  001f ae1008        	ldw	x,#4104
 269  0022 89            	pushw	x
 270  0023 ae0000        	ldw	x,#0
 271  0026 89            	pushw	x
 272  0027 cd0823        	call	_EEPROMcteni
 274  002a 5b04          	addw	sp,#4
 275  002c cd0000        	call	c_lrzmp
 277  002f 2734          	jreq	L72
 279  0031 ae1004        	ldw	x,#4100
 280  0034 89            	pushw	x
 281  0035 ae0000        	ldw	x,#0
 282  0038 89            	pushw	x
 283  0039 cd0823        	call	_EEPROMcteni
 285  003c 5b04          	addw	sp,#4
 286  003e cd0000        	call	c_lrzmp
 288  0041 2722          	jreq	L72
 289                     ; 84 		rozdil_max_min = (uint16_t)EEPROMcteni(0x001008);
 291  0043 ae1008        	ldw	x,#4104
 292  0046 89            	pushw	x
 293  0047 ae0000        	ldw	x,#0
 294  004a 89            	pushw	x
 295  004b cd0823        	call	_EEPROMcteni
 297  004e 5b04          	addw	sp,#4
 298  0050 be02          	ldw	x,c_lreg+2
 299  0052 bf0c          	ldw	_rozdil_max_min,x
 300                     ; 85 		minU = (uint16_t)EEPROMcteni(0x001004);
 302  0054 ae1004        	ldw	x,#4100
 303  0057 89            	pushw	x
 304  0058 ae0000        	ldw	x,#0
 305  005b 89            	pushw	x
 306  005c cd0823        	call	_EEPROMcteni
 308  005f 5b04          	addw	sp,#4
 309  0061 be02          	ldw	x,c_lreg+2
 310  0063 bf0e          	ldw	_minU,x
 311  0065               L72:
 312                     ; 89 		detekce_nabijeni();			//zkontroluj jestli není pøipojena nabíjeèka
 314  0065 cd0954        	call	_detekce_nabijeni
 316                     ; 91 		if (preteceni){			//zkontroluj jestli nedošlo k pøekroèení maximálního poèetu krokù, které dokážeme zobrazit
 318  0068 3d04          	tnz	_preteceni
 319  006a 2717          	jreq	L33
 320                     ; 92 			EEPROMzapis(99999, 0x001000);
 322  006c ae1000        	ldw	x,#4096
 323  006f 89            	pushw	x
 324  0070 ae0000        	ldw	x,#0
 325  0073 89            	pushw	x
 326  0074 ae869f        	ldw	x,#34463
 327  0077 89            	pushw	x
 328  0078 ae0001        	ldw	x,#1
 329  007b 89            	pushw	x
 330  007c cd07f7        	call	_EEPROMzapis
 332  007f 5b08          	addw	sp,#8
 333                     ; 93 			preteceni = 0;
 335  0081 3f04          	clr	_preteceni
 336  0083               L33:
 337                     ; 96 		if(GPIO_ReadInputDataBit(GPIOE,GPIO_Pin_6) != RESET){			//pokud je ovl. tlaèítko puštìno stav je 0 a pokud šlo o probuzení interruptem z tleèítka pohni se v menu 
 339  0083 4b40          	push	#64
 340  0085 ae5014        	ldw	x,#20500
 341  0088 cd0000        	call	_GPIO_ReadInputDataBit
 343  008b 5b01          	addw	sp,#1
 344  008d 4d            	tnz	a
 345  008e 2728          	jreq	L53
 346                     ; 97 			stav = 0;
 348  0090 3f00          	clr	_stav
 349                     ; 98 			if(!vymaz && !dup && !wut && !odp && (TIM5_GetCounter() > 8)){
 351  0092 3d05          	tnz	_vymaz
 352  0094 2620          	jrne	L73
 354  0096 3d03          	tnz	_dup
 355  0098 261c          	jrne	L73
 357  009a 3d01          	tnz	_wut
 358  009c 2618          	jrne	L73
 360  009e 3d02          	tnz	_odp
 361  00a0 2614          	jrne	L73
 363  00a2 cd0000        	call	_TIM5_GetCounter
 365  00a5 a30009        	cpw	x,#9
 366  00a8 250c          	jrult	L73
 367                     ; 99 				menu++;
 369  00aa 3c0b          	inc	_menu
 370                     ; 100 				if (menu == 3){			// když je menu 3 tak se vra zpìt na nulu › toèíme se v kruhu
 372  00ac b60b          	ld	a,_menu
 373  00ae a103          	cp	a,#3
 374  00b0 2606          	jrne	L53
 375                     ; 101 					menu = 0;
 377  00b2 3f0b          	clr	_menu
 378  00b4 2002          	jra	L53
 379  00b6               L73:
 380                     ; 104 				vymaz = 0;
 382  00b6 3f05          	clr	_vymaz
 383  00b8               L53:
 384                     ; 108 		if(menu == 0){			//pokud chceme zobrazit menu 0 (aktuální poèet krokù)
 386  00b8 3d0b          	tnz	_menu
 387  00ba 2672          	jrne	L54
 388                     ; 109 			if( TIM5_GetCounter() > 1000 && !vymaz && !dup && !wut){ //pokud držím tlaèítko, ubìhly 2s a mám povoleno vymazávání tak vymaž kroky a zakaž další vymazávání
 390  00bc cd0000        	call	_TIM5_GetCounter
 392  00bf a303e9        	cpw	x,#1001
 393  00c2 2548          	jrult	L74
 395  00c4 3d05          	tnz	_vymaz
 396  00c6 2644          	jrne	L74
 398  00c8 3d03          	tnz	_dup
 399  00ca 2640          	jrne	L74
 401  00cc 3d01          	tnz	_wut
 402  00ce 263c          	jrne	L74
 403                     ; 110 				if (EEPROMcteni(0x001000) < kroky){			//pøekonali jsme rekord? pokud ano tak ho ulož do EEPROM
 405  00d0 ae1000        	ldw	x,#4096
 406  00d3 89            	pushw	x
 407  00d4 ae0000        	ldw	x,#0
 408  00d7 89            	pushw	x
 409  00d8 cd0823        	call	_EEPROMcteni
 411  00db 5b04          	addw	sp,#4
 412  00dd ae0010        	ldw	x,#_kroky
 413  00e0 cd0000        	call	c_lcmp
 415  00e3 2413          	jruge	L15
 416                     ; 111 					EEPROMzapis(kroky,0x001000);
 418  00e5 ae1000        	ldw	x,#4096
 419  00e8 89            	pushw	x
 420  00e9 ae0000        	ldw	x,#0
 421  00ec 89            	pushw	x
 422  00ed be12          	ldw	x,_kroky+2
 423  00ef 89            	pushw	x
 424  00f0 be10          	ldw	x,_kroky
 425  00f2 89            	pushw	x
 426  00f3 cd07f7        	call	_EEPROMzapis
 428  00f6 5b08          	addw	sp,#8
 429  00f8               L15:
 430                     ; 113 				kroky = 0;
 432  00f8 ae0000        	ldw	x,#0
 433  00fb bf12          	ldw	_kroky+2,x
 434  00fd ae0000        	ldw	x,#0
 435  0100 bf10          	ldw	_kroky,x
 436                     ; 114 				zobrazeno0 = 0;			//zobraz smazané kroky na displeji
 438  0102 3f08          	clr	_zobrazeno0
 439                     ; 115 				vymaz = 1;
 441  0104 35010005      	mov	_vymaz,#1
 442                     ; 116 				TIM5_SetCounter(0);			//vynuluj èasovaè 
 444  0108 5f            	clrw	x
 445  0109 cd0000        	call	_TIM5_SetCounter
 447  010c               L74:
 448                     ; 119 			if (dup || !zobrazeno0){			//udìlali jsme krok nebo nebo jsme povolili zobrazení krokù tak zobraz aktuální poèet krokù 
 450  010c 3d03          	tnz	_dup
 451  010e 2604          	jrne	L55
 453  0110 3d08          	tnz	_zobrazeno0
 454  0112 2614          	jrne	L35
 455  0114               L55:
 456                     ; 120 				cislanaLCD(kroky);
 458  0114 be12          	ldw	x,_kroky+2
 459  0116 89            	pushw	x
 460  0117 be10          	ldw	x,_kroky
 461  0119 89            	pushw	x
 462  011a cd04bb        	call	_cislanaLCD
 464  011d 5b04          	addw	sp,#4
 465                     ; 121 				zobraz_na_LCD();
 467  011f cd0528        	call	_zobraz_na_LCD
 469                     ; 122 				zobrazeno0 = 1;	
 471  0122 35010008      	mov	_zobrazeno0,#1
 472                     ; 123 				dup = 0;
 474  0126 3f03          	clr	_dup
 475  0128               L35:
 476                     ; 125 			zobrazeno1 = 0;
 478  0128 3f09          	clr	_zobrazeno1
 480  012a acf101f1      	jpf	L75
 481  012e               L54:
 482                     ; 127 		}else if(menu == 1){			// chceme se podívat na náš rekord
 484  012e b60b          	ld	a,_menu
 485  0130 a101          	cp	a,#1
 486  0132 2660          	jrne	L16
 487                     ; 128 			if(TIM5_GetCounter() > 1333 && !vymaz && !dup && !wut){			//pokd držím tlaèítko cca 4.5 sekundy tak vypaž rekord
 489  0134 cd0000        	call	_TIM5_GetCounter
 491  0137 a30536        	cpw	x,#1334
 492  013a 252b          	jrult	L36
 494  013c 3d05          	tnz	_vymaz
 495  013e 2627          	jrne	L36
 497  0140 3d03          	tnz	_dup
 498  0142 2623          	jrne	L36
 500  0144 3d01          	tnz	_wut
 501  0146 261f          	jrne	L36
 502                     ; 129 				EEPROMzapis(0, 0x001000);
 504  0148 ae1000        	ldw	x,#4096
 505  014b 89            	pushw	x
 506  014c ae0000        	ldw	x,#0
 507  014f 89            	pushw	x
 508  0150 ae0000        	ldw	x,#0
 509  0153 89            	pushw	x
 510  0154 ae0000        	ldw	x,#0
 511  0157 89            	pushw	x
 512  0158 cd07f7        	call	_EEPROMzapis
 514  015b 5b08          	addw	sp,#8
 515                     ; 130 				vymaz = 1;
 517  015d 35010005      	mov	_vymaz,#1
 518                     ; 131 				zobrazeno1 = 0;
 520  0161 3f09          	clr	_zobrazeno1
 521                     ; 132 				TIM5_SetCounter(0);
 523  0163 5f            	clrw	x
 524  0164 cd0000        	call	_TIM5_SetCounter
 526  0167               L36:
 527                     ; 135 			if(!zobrazeno1){			//chceme zobrazit rekord na displeji
 529  0167 3d09          	tnz	_zobrazeno1
 530  0169 2625          	jrne	L56
 531                     ; 136 				rekord = EEPROMcteni(0x001000);
 533  016b ae1000        	ldw	x,#4096
 534  016e 89            	pushw	x
 535  016f ae0000        	ldw	x,#0
 536  0172 89            	pushw	x
 537  0173 cd0823        	call	_EEPROMcteni
 539  0176 5b04          	addw	sp,#4
 540  0178 ae0015        	ldw	x,#_rekord
 541  017b cd0000        	call	c_rtol
 543                     ; 137 				cislanaLCD(rekord);
 545  017e be17          	ldw	x,_rekord+2
 546  0180 89            	pushw	x
 547  0181 be15          	ldw	x,_rekord
 548  0183 89            	pushw	x
 549  0184 cd04bb        	call	_cislanaLCD
 551  0187 5b04          	addw	sp,#4
 552                     ; 138 				zobraz_na_LCD();
 554  0189 cd0528        	call	_zobraz_na_LCD
 556                     ; 139 				zobrazeno1 = 1;
 558  018c 35010009      	mov	_zobrazeno1,#1
 559  0190               L56:
 560                     ; 141 			zobrazeno2 = 0;
 562  0190 3f0a          	clr	_zobrazeno2
 564  0192 205d          	jra	L75
 565  0194               L16:
 566                     ; 143 		}else if(menu == 2){			//chceme vidìt stav baterie
 568  0194 b60b          	ld	a,_menu
 569  0196 a102          	cp	a,#2
 570  0198 2657          	jrne	L75
 571                     ; 144 			if(!zobrazeno2 || odp){			//chceme zobrazit stav baterie na displeji
 573  019a 3d0a          	tnz	_zobrazeno2
 574  019c 2704          	jreq	L57
 576  019e 3d02          	tnz	_odp
 577  01a0 2726          	jreq	L37
 578  01a2               L57:
 579                     ; 145 				if(!nab_pripojeno){			//baterie se nenabíjí - zobraz její procentuální stav
 581  01a2 3d06          	tnz	_nab_pripojeno
 582  01a4 261b          	jrne	L77
 583                     ; 146 					cislanaLCD(baterie());
 585  01a6 cd088a        	call	_baterie
 587  01a9 b703          	ld	c_lreg+3,a
 588  01ab 3f02          	clr	c_lreg+2
 589  01ad 3f01          	clr	c_lreg+1
 590  01af 3f00          	clr	c_lreg
 591  01b1 be02          	ldw	x,c_lreg+2
 592  01b3 89            	pushw	x
 593  01b4 be00          	ldw	x,c_lreg
 594  01b6 89            	pushw	x
 595  01b7 cd04bb        	call	_cislanaLCD
 597  01ba 5b04          	addw	sp,#4
 598                     ; 147 					zobraz_na_LCD();
 600  01bc cd0528        	call	_zobraz_na_LCD
 603  01bf 2003          	jra	L101
 604  01c1               L77:
 605                     ; 149 					zobraz_pomlcky();
 607  01c1 cd07c2        	call	_zobraz_pomlcky
 609  01c4               L101:
 610                     ; 151 				zobrazeno2 = 1;
 612  01c4 3501000a      	mov	_zobrazeno2,#1
 613  01c8               L37:
 614                     ; 154 			if(TIM5_GetCounter() > 667 && !vymaz && !dup && !wut){			//pokud držím tlaèítko cca 2 sekundy zmìò podsvícení displeje na opak aktuálního stavu
 616  01c8 cd0000        	call	_TIM5_GetCounter
 618  01cb a3029c        	cpw	x,#668
 619  01ce 251f          	jrult	L301
 621  01d0 3d05          	tnz	_vymaz
 622  01d2 261b          	jrne	L301
 624  01d4 3d03          	tnz	_dup
 625  01d6 2617          	jrne	L301
 627  01d8 3d01          	tnz	_wut
 628  01da 2613          	jrne	L301
 629                     ; 155 				GPIO_ToggleBits(GPIOB,GPIO_Pin_2);
 631  01dc 4b04          	push	#4
 632  01de ae5005        	ldw	x,#20485
 633  01e1 cd0000        	call	_GPIO_ToggleBits
 635  01e4 84            	pop	a
 636                     ; 156 				vymaz = 1;
 638  01e5 35010005      	mov	_vymaz,#1
 639                     ; 157 				wut = 0;
 641  01e9 3f01          	clr	_wut
 642                     ; 158 				TIM5_SetCounter(0);
 644  01eb 5f            	clrw	x
 645  01ec cd0000        	call	_TIM5_SetCounter
 647  01ef               L301:
 648                     ; 160 			zobrazeno0 = 0;
 650  01ef 3f08          	clr	_zobrazeno0
 651  01f1               L75:
 652                     ; 163 		odp = 0;
 654  01f1 3f02          	clr	_odp
 655                     ; 164 		dup = 0;
 657  01f3 3f03          	clr	_dup
 658                     ; 166 		if(!stav){			//pokud není ovl. tlaèítko stisknuto pøedi do režimu spánku
 660  01f5 3d00          	tnz	_stav
 661  01f7 2703          	jreq	L6
 662  01f9 cc0065        	jp	L72
 663  01fc               L6:
 664                     ; 167 			spanek ();
 666  01fc cd0a0c        	call	_spanek
 668  01ff ac650065      	jpf	L72
 695                     .const:	section	.text
 696  0000               L21:
 697  0000 000186a0      	dc.l	100000
 698                     ; 173 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)			//rutina pro obsluhu pøerušení z modulu krokomìru
 698                     ; 174 {
 699                     	scross	on
 700                     	switch	.text
 701  0203               f_EXTI7_IRQHandler:
 703  0203 8a            	push	cc
 704  0204 84            	pop	a
 705  0205 a4bf          	and	a,#191
 706  0207 88            	push	a
 707  0208 86            	pop	cc
 708  0209 3b0002        	push	c_x+2
 709  020c be00          	ldw	x,c_x
 710  020e 89            	pushw	x
 711  020f 3b0002        	push	c_y+2
 712  0212 be00          	ldw	x,c_y
 713  0214 89            	pushw	x
 714  0215 be02          	ldw	x,c_lreg+2
 715  0217 89            	pushw	x
 716  0218 be00          	ldw	x,c_lreg
 717  021a 89            	pushw	x
 720                     ; 175 	kroky++;
 722  021b ae0010        	ldw	x,#_kroky
 723  021e a601          	ld	a,#1
 724  0220 cd0000        	call	c_lgadc
 726                     ; 176 	dup = 1;
 728  0223 35010003      	mov	_dup,#1
 729                     ; 177 	EXTI_ClearITPendingBit(EXTI_IT_Pin7);
 731  0227 ae0080        	ldw	x,#128
 732  022a cd0000        	call	_EXTI_ClearITPendingBit
 734                     ; 178 	if (kroky > 99999){
 736  022d ae0010        	ldw	x,#_kroky
 737  0230 cd0000        	call	c_ltor
 739  0233 ae0000        	ldw	x,#L21
 740  0236 cd0000        	call	c_lcmp
 742  0239 250e          	jrult	L711
 743                     ; 179 		kroky = 0;
 745  023b ae0000        	ldw	x,#0
 746  023e bf12          	ldw	_kroky+2,x
 747  0240 ae0000        	ldw	x,#0
 748  0243 bf10          	ldw	_kroky,x
 749                     ; 180 		preteceni = 1;
 751  0245 35010004      	mov	_preteceni,#1
 752  0249               L711:
 753                     ; 182 }
 756  0249 85            	popw	x
 757  024a bf00          	ldw	c_lreg,x
 758  024c 85            	popw	x
 759  024d bf02          	ldw	c_lreg+2,x
 760  024f 85            	popw	x
 761  0250 bf00          	ldw	c_y,x
 762  0252 320002        	pop	c_y+2
 763  0255 85            	popw	x
 764  0256 bf00          	ldw	c_x,x
 765  0258 320002        	pop	c_x+2
 766  025b 80            	iret
 790                     ; 184 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)			//rutina pro obsluhu pøerušení z ovl. tlaèítka
 790                     ; 185 {	
 791                     	switch	.text
 792  025c               f_EXTI6_IRQHandler:
 794  025c 8a            	push	cc
 795  025d 84            	pop	a
 796  025e a4bf          	and	a,#191
 797  0260 88            	push	a
 798  0261 86            	pop	cc
 799  0262 3b0002        	push	c_x+2
 800  0265 be00          	ldw	x,c_x
 801  0267 89            	pushw	x
 802  0268 3b0002        	push	c_y+2
 803  026b be00          	ldw	x,c_y
 804  026d 89            	pushw	x
 807                     ; 186 	stav = 1;
 809  026e 35010000      	mov	_stav,#1
 810                     ; 187 	EXTI_ClearITPendingBit(EXTI_IT_Pin6);
 812  0272 ae0040        	ldw	x,#64
 813  0275 cd0000        	call	_EXTI_ClearITPendingBit
 815                     ; 188 }
 818  0278 85            	popw	x
 819  0279 bf00          	ldw	c_y,x
 820  027b 320002        	pop	c_y+2
 821  027e 85            	popw	x
 822  027f bf00          	ldw	c_x,x
 823  0281 320002        	pop	c_x+2
 824  0284 80            	iret
 848                     ; 190 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)			//rutina pro obsluhu pøerušení pøi nabíjení
 848                     ; 191 {	
 849                     	switch	.text
 850  0285               f_EXTI5_IRQHandler:
 852  0285 8a            	push	cc
 853  0286 84            	pop	a
 854  0287 a4bf          	and	a,#191
 855  0289 88            	push	a
 856  028a 86            	pop	cc
 857  028b 3b0002        	push	c_x+2
 858  028e be00          	ldw	x,c_x
 859  0290 89            	pushw	x
 860  0291 3b0002        	push	c_y+2
 861  0294 be00          	ldw	x,c_y
 862  0296 89            	pushw	x
 865                     ; 192 	odp = 1;
 867  0297 35010002      	mov	_odp,#1
 868                     ; 193 	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
 870  029b ae0020        	ldw	x,#32
 871  029e cd0000        	call	_EXTI_ClearITPendingBit
 873                     ; 194 }
 876  02a1 85            	popw	x
 877  02a2 bf00          	ldw	c_y,x
 878  02a4 320002        	pop	c_y+2
 879  02a7 85            	popw	x
 880  02a8 bf00          	ldw	c_x,x
 881  02aa 320002        	pop	c_x+2
 882  02ad 80            	iret
 908                     ; 196 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)			//rutina pro obsluhu pøerušení èasovaèe probuzení
 908                     ; 197 {
 909                     	switch	.text
 910  02ae               f_RTC_CSSLSE_IRQHandler:
 912  02ae 8a            	push	cc
 913  02af 84            	pop	a
 914  02b0 a4bf          	and	a,#191
 915  02b2 88            	push	a
 916  02b3 86            	pop	cc
 917  02b4 3b0002        	push	c_x+2
 918  02b7 be00          	ldw	x,c_x
 919  02b9 89            	pushw	x
 920  02ba 3b0002        	push	c_y+2
 921  02bd be00          	ldw	x,c_y
 922  02bf 89            	pushw	x
 925                     ; 198 	GPIO_WriteBit(GPIOB, GPIO_Pin_2, RESET);
 927  02c0 4b00          	push	#0
 928  02c2 4b04          	push	#4
 929  02c4 ae5005        	ldw	x,#20485
 930  02c7 cd0000        	call	_GPIO_WriteBit
 932  02ca 85            	popw	x
 933                     ; 199 	wut = 1;
 935  02cb 35010001      	mov	_wut,#1
 936                     ; 200 	RTC_ClearITPendingBit(RTC_IT_WUT);
 938  02cf ae0040        	ldw	x,#64
 939  02d2 cd0000        	call	_RTC_ClearITPendingBit
 941                     ; 202 }
 944  02d5 85            	popw	x
 945  02d6 bf00          	ldw	c_y,x
 946  02d8 320002        	pop	c_y+2
 947  02db 85            	popw	x
 948  02dc bf00          	ldw	c_x,x
 949  02de 320002        	pop	c_x+2
 950  02e1 80            	iret
 980                     ; 205 void nastaveniCLK(void){			//nastavení hlavního zdroje hodinového signálu
 982                     	switch	.text
 983  02e2               _nastaveniCLK:
 987                     ; 206 	CLK_DeInit();			//vynuluj nastavení 
 989  02e2 cd0000        	call	_CLK_DeInit
 991                     ; 207 	CLK_LSICmd(ENABLE);			//zapni vnitøní oscilátor 38 kHz
 993  02e5 a601          	ld	a,#1
 994  02e7 cd0000        	call	_CLK_LSICmd
 997  02ea               L361:
 998                     ; 208 	while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY)== RESET);			//dokud není zapnut poèkej
1000  02ea a613          	ld	a,#19
1001  02ec cd0000        	call	_CLK_GetFlagStatus
1003  02ef 4d            	tnz	a
1004  02f0 27f8          	jreq	L361
1005                     ; 209 	CLK_SYSCLKSourceSwitchCmd(ENABLE);			//zapni pøepínání taktovacích hodin
1007  02f2 a601          	ld	a,#1
1008  02f4 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
1010                     ; 210 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);			//zmìò taktovací hodiny na LSI
1012  02f7 a602          	ld	a,#2
1013  02f9 cd0000        	call	_CLK_SYSCLKSourceConfig
1015                     ; 211 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);			//dìlièku LSI nastav ne jedna
1017  02fc 4f            	clr	a
1018  02fd cd0000        	call	_CLK_SYSCLKDivConfig
1021  0300               L171:
1022                     ; 212 	while(CLK_GetFlagStatus(CLK_FLAG_SWBSY)== SET);			//dokud není výmìna taktovacích hodin dokonèena tak èekej 
1024  0300 a640          	ld	a,#64
1025  0302 cd0000        	call	_CLK_GetFlagStatus
1027  0305 a101          	cp	a,#1
1028  0307 27f7          	jreq	L171
1029                     ; 213 	CLK_SYSCLKSourceSwitchCmd(DISABLE);			//vypni možnost zmìnit taktovací hodiny
1031  0309 4f            	clr	a
1032  030a cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
1034                     ; 214 	CLK_HSICmd(DISABLE);			//vypni vsnitøní oscilátor 16 Mhz - moc velká spotøeba
1036  030d 4f            	clr	a
1037  030e cd0000        	call	_CLK_HSICmd
1039                     ; 215 	CLK_HaltConfig(CLK_Halt_FastWakeup, DISABLE);			//nastav jak se chovat pøi halt modu
1041  0311 ae2000        	ldw	x,#8192
1042  0314 cd0000        	call	_CLK_HaltConfig
1044                     ; 216 	CLK_HaltConfig(CLK_Halt_SlowWakeup, ENABLE);
1046  0317 ae1001        	ldw	x,#4097
1047  031a cd0000        	call	_CLK_HaltConfig
1049                     ; 217 	}
1052  031d 81            	ret
1079                     ; 219 void init_milis(void){			//nastavení èasovaèe požívaného pro výpoèet èasu
1080                     	switch	.text
1081  031e               _init_milis:
1085                     ; 220 	TIM5_DeInit();			//vynuluj nastavení èasovaèe 5
1087  031e cd0000        	call	_TIM5_DeInit
1089                     ; 221 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM5, ENABLE);			//zapni pøívod taktovacího signálu do èasovaèe 5
1091  0321 ae2101        	ldw	x,#8449
1092  0324 cd0000        	call	_CLK_PeripheralClockConfig
1094                     ; 222 	TIM5_TimeBaseInit(TIM5_Prescaler_128,TIM5_CounterMode_Up, 0xffff);			//dìl pøíchozí taktovací signál 128, poèít nahoru, poèítej do 65535 (65536 taktù - zaèíná se od 0)
1096  0327 aeffff        	ldw	x,#65535
1097  032a 89            	pushw	x
1098  032b ae0700        	ldw	x,#1792
1099  032e cd0000        	call	_TIM5_TimeBaseInit
1101  0331 85            	popw	x
1102                     ; 223 	TIM5_Cmd(ENABLE);			//zapni èasovaè 5
1104  0332 a601          	ld	a,#1
1105  0334 cd0000        	call	_TIM5_Cmd
1107                     ; 224 }
1110  0337 81            	ret
1135                     ; 226 void nastaveniGPIO(void){			//nastavení pinù vstupù a výstupù
1136                     	switch	.text
1137  0338               _nastaveniGPIO:
1141                     ; 227 	GPIO_DeInit(GPIOC);			//resetuj nastavení požívaných portù
1143  0338 ae500a        	ldw	x,#20490
1144  033b cd0000        	call	_GPIO_DeInit
1146                     ; 228 	GPIO_DeInit(GPIOE);
1148  033e ae5014        	ldw	x,#20500
1149  0341 cd0000        	call	_GPIO_DeInit
1151                     ; 229 	GPIO_DeInit(GPIOB);
1153  0344 ae5005        	ldw	x,#20485
1154  0347 cd0000        	call	_GPIO_DeInit
1156                     ; 230 	GPIO_Init(GPIOE, GPIO_Pin_6, GPIO_Mode_In_PU_IT);			//nastav E6 pro vstup ovl. tlaèítka
1158  034a 4b60          	push	#96
1159  034c 4b40          	push	#64
1160  034e ae5014        	ldw	x,#20500
1161  0351 cd0000        	call	_GPIO_Init
1163  0354 85            	popw	x
1164                     ; 231 	GPIO_Init(GPIOE, GPIO_Pin_7, GPIO_Mode_In_FL_IT);			//nastav E7 pro vstup krokomìrového modulu
1166  0355 4b20          	push	#32
1167  0357 4b80          	push	#128
1168  0359 ae5014        	ldw	x,#20500
1169  035c cd0000        	call	_GPIO_Init
1171  035f 85            	popw	x
1172                     ; 232 	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_In_FL_IT);			//nastav C5 na detekci nabijeni
1174  0360 4b20          	push	#32
1175  0362 4b20          	push	#32
1176  0364 ae500a        	ldw	x,#20490
1177  0367 cd0000        	call	_GPIO_Init
1179  036a 85            	popw	x
1180                     ; 233 	GPIO_Init(GPIOC, GPIO_Pin_7, GPIO_Mode_In_FL_No_IT);			//nastav C7 pro ètení napeti baterie
1182  036b 4b00          	push	#0
1183  036d 4b80          	push	#128
1184  036f ae500a        	ldw	x,#20490
1185  0372 cd0000        	call	_GPIO_Init
1187  0375 85            	popw	x
1188                     ; 234 	GPIO_Init(GPIOB, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Slow);			//nastav B2 jako výstup pro ovládání podsvícení dispelje
1190  0376 4bc0          	push	#192
1191  0378 4b04          	push	#4
1192  037a ae5005        	ldw	x,#20485
1193  037d cd0000        	call	_GPIO_Init
1195  0380 85            	popw	x
1196                     ; 235 }
1199  0381 81            	ret
1229                     ; 237 void nastaveniLCD (void){			//nastavení LCD driveru
1230                     	switch	.text
1231  0382               _nastaveniLCD:
1235                     ; 238 	CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);			//zapni RTC hodiny jejichž hodinovým signálem bude LSI dìlený 1
1237  0382 ae0400        	ldw	x,#1024
1238  0385 cd0000        	call	_CLK_RTCClockConfig
1240                     ; 239 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);			//zapni pøívod hodinového signálu do LCD driveru
1242  0388 ae1201        	ldw	x,#4609
1243  038b cd0000        	call	_CLK_PeripheralClockConfig
1245                     ; 240 	RTC_WakeUpClockConfig(RTC_WakeUpClock_RTCCLK_Div16);			//nastav signál jsoucí do èítaèe pro automatické probuzení jako hodiny z RTC dìlené 16
1247  038e 4f            	clr	a
1248  038f cd0000        	call	_RTC_WakeUpClockConfig
1250                     ; 241 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);			//pøiveï hodinový signál do LCD driveru
1252  0392 ae1301        	ldw	x,#4865
1253  0395 cd0000        	call	_CLK_PeripheralClockConfig
1255                     ; 242 	LCD_Init(LCD_Prescaler_1,LCD_Divider_16,LCD_Duty_1_4,LCD_Bias_1_3,LCD_VoltageSource_Internal);			//nastav LCD driver
1257  0398 4b00          	push	#0
1258  039a 4b00          	push	#0
1259  039c 4b06          	push	#6
1260  039e 5f            	clrw	x
1261  039f cd0000        	call	_LCD_Init
1263  03a2 5b03          	addw	sp,#3
1264                     ; 243 	LCD_PortMaskConfig(LCD_PortMaskRegister_0,255);			//nastav vybrané piny jako vývody pro LCD
1266  03a4 ae00ff        	ldw	x,#255
1267  03a7 cd0000        	call	_LCD_PortMaskConfig
1269                     ; 244 	LCD_PortMaskConfig(LCD_PortMaskRegister_1,15);
1271  03aa ae010f        	ldw	x,#271
1272  03ad cd0000        	call	_LCD_PortMaskConfig
1274                     ; 245 	LCD_ContrastConfig(LCD_Contrast_Level_5);			//nastav kontrast LCD
1276  03b0 a60a          	ld	a,#10
1277  03b2 cd0000        	call	_LCD_ContrastConfig
1279                     ; 246 	LCD_Cmd(ENABLE);			//zapni LCD driver
1281  03b5 a601          	ld	a,#1
1282  03b7 cd0000        	call	_LCD_Cmd
1284                     ; 247 }
1287  03ba 81            	ret
1315                     ; 249 void nastaveniINTERRUPTU(void){			//nastavení interruptù
1316                     	switch	.text
1317  03bb               _nastaveniINTERRUPTU:
1321                     ; 250 	EXTI_DeInit();			//vymaž nastavvení interruptù
1323  03bb cd0000        	call	_EXTI_DeInit
1325                     ; 251 	EXTI_ClearITPendingBit(EXTI_IT_Pin7);			//vymaž bit signalizující interrupt na daném pinu
1327  03be ae0080        	ldw	x,#128
1328  03c1 cd0000        	call	_EXTI_ClearITPendingBit
1330                     ; 252 	EXTI_ClearITPendingBit(EXTI_IT_Pin6);
1332  03c4 ae0040        	ldw	x,#64
1333  03c7 cd0000        	call	_EXTI_ClearITPendingBit
1335                     ; 253 	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
1337  03ca ae0020        	ldw	x,#32
1338  03cd cd0000        	call	_EXTI_ClearITPendingBit
1340                     ; 254 	EXTI_SetPinSensitivity(EXTI_Pin_7,EXTI_Trigger_Rising);			//nastav kdy se generuje interrupt na daném pinu - z modulu krokmìru
1342  03d0 ae1601        	ldw	x,#5633
1343  03d3 cd0000        	call	_EXTI_SetPinSensitivity
1345                     ; 255 	EXTI_SetPinSensitivity(EXTI_Pin_6,EXTI_Trigger_Falling);			//z ovl. tlaèítka
1347  03d6 ae1402        	ldw	x,#5122
1348  03d9 cd0000        	call	_EXTI_SetPinSensitivity
1350                     ; 256 	EXTI_SetPinSensitivity(EXTI_Pin_5,EXTI_Trigger_Rising_Falling);			//interrupt z C5 - detekce nabijeni
1352  03dc ae1203        	ldw	x,#4611
1353  03df cd0000        	call	_EXTI_SetPinSensitivity
1355                     ; 257 	ITC_SetSoftwarePriority(EXTI6_IRQn,ITC_PriorityLevel_3);			//nastav prioritu pøerušení
1357  03e2 ae0e03        	ldw	x,#3587
1358  03e5 cd0000        	call	_ITC_SetSoftwarePriority
1360                     ; 258 	ITC_SetSoftwarePriority(EXTI5_IRQn,ITC_PriorityLevel_3);
1362  03e8 ae0d03        	ldw	x,#3331
1363  03eb cd0000        	call	_ITC_SetSoftwarePriority
1365                     ; 259 	ITC_SetSoftwarePriority(EXTI7_IRQn,ITC_PriorityLevel_1);
1367  03ee ae0f01        	ldw	x,#3841
1368  03f1 cd0000        	call	_ITC_SetSoftwarePriority
1370                     ; 260 }
1373  03f4 81            	ret
1400                     ; 262 void nastaveniADC(void){			//nastavení ADC pøevodníku
1401                     	switch	.text
1402  03f5               _nastaveniADC:
1406                     ; 263 	ADC_DeInit(ADC1);			//vymaž nastavení ADC pøeodníku
1408  03f5 ae5340        	ldw	x,#21312
1409  03f8 cd0000        	call	_ADC_DeInit
1411                     ; 264 	ADC_Init(ADC1, ADC_ConversionMode_Single, ADC_Resolution_12Bit, ADC_Prescaler_2);			//nastav jak bude ADC fungovt: vezme pouze jeden vzorek, rozlišení 12 b frekvence vzorkoání je taktovací signál /2
1413  03fb 4b80          	push	#128
1414  03fd 4b00          	push	#0
1415  03ff 4b00          	push	#0
1416  0401 ae5340        	ldw	x,#21312
1417  0404 cd0000        	call	_ADC_Init
1419  0407 5b03          	addw	sp,#3
1420                     ; 265 	ADC_SchmittTriggerConfig(ADC1,ADC_Channel_3,DISABLE);			//vypni schmittuv pøepínaè na pinu 7
1422  0409 4b00          	push	#0
1423  040b ae0308        	ldw	x,#776
1424  040e 89            	pushw	x
1425  040f ae5340        	ldw	x,#21312
1426  0412 cd0000        	call	_ADC_SchmittTriggerConfig
1428  0415 5b03          	addw	sp,#3
1429                     ; 266 	ADC_SamplingTimeConfig(ADC1,ADC_Group_SlowChannels, ADC_SamplingTime_4Cycles);			//nastavení èasu pro oedbírání jednoho vzorku
1431  0417 4b00          	push	#0
1432  0419 4b00          	push	#0
1433  041b ae5340        	ldw	x,#21312
1434  041e cd0000        	call	_ADC_SamplingTimeConfig
1436  0421 85            	popw	x
1437                     ; 267 }
1440  0422 81            	ret
1506                     ; 270 void ADC (bool stav){			//zapnutí a pøipravení ADC na pøevod (to vše kvùli spotøebì)
1507                     	switch	.text
1508  0423               _ADC:
1512                     ; 271 	if (stav){			//když bylo ovl. tlaèítko stisknuto
1514  0423 4d            	tnz	a
1515  0424 274f          	jreq	L123
1516                     ; 272 		CLK_HSICmd(ENABLE);			//nastav taktovací signál z LSI oscilátoru na HSI protože LSI je pro ADC pøíliš pomalý (min f ADC kolme 400 kHz)
1518  0426 a601          	ld	a,#1
1519  0428 cd0000        	call	_CLK_HSICmd
1522  042b               L303:
1523                     ; 273 		while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY)== RESET);
1525  042b a611          	ld	a,#17
1526  042d cd0000        	call	_CLK_GetFlagStatus
1528  0430 4d            	tnz	a
1529  0431 27f8          	jreq	L303
1530                     ; 274 		CLK_SYSCLKSourceSwitchCmd(ENABLE);
1532  0433 a601          	ld	a,#1
1533  0435 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
1535                     ; 275 		CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
1537  0438 a601          	ld	a,#1
1538  043a cd0000        	call	_CLK_SYSCLKSourceConfig
1540                     ; 276 		CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_16);
1542  043d a604          	ld	a,#4
1543  043f cd0000        	call	_CLK_SYSCLKDivConfig
1546  0442               L113:
1547                     ; 277 		while(CLK_GetFlagStatus(CLK_FLAG_SWBSY)== SET);
1549  0442 a640          	ld	a,#64
1550  0444 cd0000        	call	_CLK_GetFlagStatus
1552  0447 a101          	cp	a,#1
1553  0449 27f7          	jreq	L113
1554                     ; 278 		CLK_SYSCLKSourceSwitchCmd(DISABLE);
1556  044b 4f            	clr	a
1557  044c cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
1559                     ; 279 		CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);			//spuštìní ADC
1561  044f ae1001        	ldw	x,#4097
1562  0452 cd0000        	call	_CLK_PeripheralClockConfig
1564                     ; 280 		ADC_Cmd(ADC1, ENABLE);
1566  0455 4b01          	push	#1
1567  0457 ae5340        	ldw	x,#21312
1568  045a cd0000        	call	_ADC_Cmd
1570  045d 84            	pop	a
1571                     ; 281 		ADC_ChannelCmd(ADC1,ADC_Channel_3, ENABLE);
1573  045e 4b01          	push	#1
1574  0460 ae0308        	ldw	x,#776
1575  0463 89            	pushw	x
1576  0464 ae5340        	ldw	x,#21312
1577  0467 cd0000        	call	_ADC_ChannelCmd
1579  046a 5b03          	addw	sp,#3
1580                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1584  046c ae0026        	ldw	x,#38
1586  046f 9d            nop
1587  0470                L04:
1588  0470 5a             decw X
1589  0471 26fd           jrne L04
1590  0473 9d             nop
1591                      
1593  0474               L513:
1594                     ; 295 }
1597  0474 81            	ret
1598  0475               L123:
1599                     ; 284 		while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY)== RESET);			//nastav taktovací signál zpìt
1601  0475 a613          	ld	a,#19
1602  0477 cd0000        	call	_CLK_GetFlagStatus
1604  047a 4d            	tnz	a
1605  047b 27f8          	jreq	L123
1606                     ; 285 		CLK_SYSCLKSourceSwitchCmd(ENABLE);
1608  047d a601          	ld	a,#1
1609  047f cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
1611                     ; 286 		CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);
1613  0482 a602          	ld	a,#2
1614  0484 cd0000        	call	_CLK_SYSCLKSourceConfig
1616                     ; 287 		CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
1618  0487 4f            	clr	a
1619  0488 cd0000        	call	_CLK_SYSCLKDivConfig
1622  048b               L723:
1623                     ; 288 		while(CLK_GetFlagStatus(CLK_FLAG_SWBSY)== SET);
1625  048b a640          	ld	a,#64
1626  048d cd0000        	call	_CLK_GetFlagStatus
1628  0490 a101          	cp	a,#1
1629  0492 27f7          	jreq	L723
1630                     ; 289 		CLK_SYSCLKSourceSwitchCmd(DISABLE);
1632  0494 4f            	clr	a
1633  0495 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
1635                     ; 290 		CLK_HSICmd(DISABLE);
1637  0498 4f            	clr	a
1638  0499 cd0000        	call	_CLK_HSICmd
1640                     ; 291 		ADC_Cmd(ADC1, DISABLE);			//vypni ADC
1642  049c 4b00          	push	#0
1643  049e ae5340        	ldw	x,#21312
1644  04a1 cd0000        	call	_ADC_Cmd
1646  04a4 84            	pop	a
1647                     ; 292 		ADC_ChannelCmd(ADC1,ADC_Channel_3, DISABLE);
1649  04a5 4b00          	push	#0
1650  04a7 ae0308        	ldw	x,#776
1651  04aa 89            	pushw	x
1652  04ab ae5340        	ldw	x,#21312
1653  04ae cd0000        	call	_ADC_ChannelCmd
1655  04b1 5b03          	addw	sp,#3
1656                     ; 293 		CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
1658  04b3 ae1000        	ldw	x,#4096
1659  04b6 cd0000        	call	_CLK_PeripheralClockConfig
1661  04b9 20b9          	jra	L513
1714                     ; 297 void cislanaLCD (uint32_t cislo){			//pøíprava èísel na zobrazení na LCD
1715                     	switch	.text
1716  04bb               _cislanaLCD:
1718  04bb 5207          	subw	sp,#7
1719       00000007      OFST:	set	7
1722                     ; 299 	uint16_t delitel= 10000;
1724  04bd ae2710        	ldw	x,#10000
1725  04c0 1f06          	ldw	(OFST-1,sp),x
1727                     ; 301 	for (i = 0; i != 5; i++){			//rozdìlí èíslo na jednoky desítky stovky...
1729  04c2 0f05          	clr	(OFST-2,sp)
1731  04c4               L163:
1732                     ; 302 		if (cislo < 100000){
1734  04c4 96            	ldw	x,sp
1735  04c5 1c000a        	addw	x,#OFST+3
1736  04c8 cd0000        	call	c_ltor
1738  04cb ae0000        	ldw	x,#L21
1739  04ce cd0000        	call	c_lcmp
1741  04d1 244a          	jruge	L763
1742                     ; 303 			cislanaseg[i] = cislo/delitel;
1744  04d3 1e06          	ldw	x,(OFST-1,sp)
1745  04d5 cd0000        	call	c_uitolx
1747  04d8 96            	ldw	x,sp
1748  04d9 1c0001        	addw	x,#OFST-6
1749  04dc cd0000        	call	c_rtol
1752  04df 96            	ldw	x,sp
1753  04e0 1c000a        	addw	x,#OFST+3
1754  04e3 cd0000        	call	c_ltor
1756  04e6 96            	ldw	x,sp
1757  04e7 1c0001        	addw	x,#OFST-6
1758  04ea cd0000        	call	c_ludv
1760  04ed 7b05          	ld	a,(OFST-2,sp)
1761  04ef 5f            	clrw	x
1762  04f0 97            	ld	xl,a
1763  04f1 b603          	ld	a,c_lreg+3
1764  04f3 e710          	ld	(_cislanaseg,x),a
1765                     ; 304 			cislo = cislo % delitel;
1767  04f5 1e06          	ldw	x,(OFST-1,sp)
1768  04f7 cd0000        	call	c_uitolx
1770  04fa 96            	ldw	x,sp
1771  04fb 1c0001        	addw	x,#OFST-6
1772  04fe cd0000        	call	c_rtol
1775  0501 96            	ldw	x,sp
1776  0502 1c000a        	addw	x,#OFST+3
1777  0505 cd0000        	call	c_ltor
1779  0508 96            	ldw	x,sp
1780  0509 1c0001        	addw	x,#OFST-6
1781  050c cd0000        	call	c_lumd
1783  050f 96            	ldw	x,sp
1784  0510 1c000a        	addw	x,#OFST+3
1785  0513 cd0000        	call	c_rtol
1787                     ; 305 			delitel = delitel/10;
1789  0516 1e06          	ldw	x,(OFST-1,sp)
1790  0518 a60a          	ld	a,#10
1791  051a 62            	div	x,a
1792  051b 1f06          	ldw	(OFST-1,sp),x
1794  051d               L763:
1795                     ; 301 	for (i = 0; i != 5; i++){			//rozdìlí èíslo na jednoky desítky stovky...
1797  051d 0c05          	inc	(OFST-2,sp)
1801  051f 7b05          	ld	a,(OFST-2,sp)
1802  0521 a105          	cp	a,#5
1803  0523 269f          	jrne	L163
1804                     ; 308 }
1807  0525 5b07          	addw	sp,#7
1808  0527 81            	ret
1811                     	switch	.const
1812  0004               L173_celkovyvysledek:
1813  0004 01            	dc.b	1
1814  0005 00            	dc.b	0
1815  0006 04            	dc.b	4
1816  0007 00            	dc.b	0
1817  0008 08            	dc.b	8
1818  0009 00            	dc.b	0
1819  000a 0b            	dc.b	11
1820  000b 00            	dc.b	0
1821  000c 00            	dc.b	0
1822  000d 00            	dc.b	0
1823  000e 03            	dc.b	3
1824  000f 00            	dc.b	0
1825  0010 07            	dc.b	7
1826  0011 00            	dc.b	0
1827  0012 0a            	dc.b	10
1828  0013 00            	dc.b	0
1942                     ; 310 void zobraz_na_LCD(void){			//zobrazení èísel na LCD
1943                     	switch	.text
1944  0528               _zobraz_na_LCD:
1946  0528 5219          	subw	sp,#25
1947       00000019      OFST:	set	25
1950                     ; 316 	uint8_t pocetpred1 =0 ;
1952  052a 0f04          	clr	(OFST-21,sp)
1954                     ; 317 	uint8_t pocetpo1 = 0;
1956  052c 0f05          	clr	(OFST-20,sp)
1958                     ; 318 	uint8_t celkovyvysledek [8][2] = {{1,0b00000000},{4,0b0000000},{8,0b0000000},{11,0b0000000},{0,0b00000000},{3,0b0000000},{7,0b00000000},{10,0b0000000}};
1960  052e 96            	ldw	x,sp
1961  052f 1c0006        	addw	x,#OFST-19
1962  0532 90ae0004      	ldw	y,#L173_celkovyvysledek
1963  0536 a610          	ld	a,#16
1964  0538 cd0000        	call	c_xymvx
1966                     ; 319 	bool nezobrazovat = 0;
1968  053b 0f03          	clr	(OFST-22,sp)
1970                     ; 321 	for (i = 0; i != 5; i++){			//cyklus pro zpracování 5 èísel
1972  053d 0f16          	clr	(OFST-3,sp)
1974  053f               L154:
1975                     ; 323 		if (cislanaseg[0] == 0 && cislanaseg[1] == 0 && cislanaseg[2] == 0 && cislanaseg[3] == 0 && cislanaseg[4] == 0){			//ošetøení pro zobrazování nul
1977  053f 3d10          	tnz	_cislanaseg
1978  0541 2622          	jrne	L754
1980  0543 3d11          	tnz	_cislanaseg+1
1981  0545 261e          	jrne	L754
1983  0547 3d12          	tnz	_cislanaseg+2
1984  0549 261a          	jrne	L754
1986  054b 3d13          	tnz	_cislanaseg+3
1987  054d 2616          	jrne	L754
1989  054f 3d14          	tnz	_cislanaseg+4
1990  0551 2612          	jrne	L754
1991                     ; 324 			celkovyvysledek[4][1] = 0b00000011;
1993  0553 a603          	ld	a,#3
1994  0555 6b0f          	ld	(OFST-10,sp),a
1996                     ; 325 			celkovyvysledek[5][1] = 0b00100000;
1998  0557 a620          	ld	a,#32
1999  0559 6b11          	ld	(OFST-8,sp),a
2001                     ; 326 			celkovyvysledek[6][1] = 0b00000011;
2003  055b a603          	ld	a,#3
2004  055d 6b13          	ld	(OFST-6,sp),a
2006                     ; 327 			celkovyvysledek[7][1] = 0b00100000;
2008  055f a620          	ld	a,#32
2009  0561 6b15          	ld	(OFST-4,sp),a
2011                     ; 328 			break;
2013  0563 2014          	jra	L554
2014  0565               L754:
2015                     ; 329 		}else if (cislanaseg[i] == 0 && !nezobrazovat){
2017  0565 7b16          	ld	a,(OFST-3,sp)
2018  0567 5f            	clrw	x
2019  0568 97            	ld	xl,a
2020  0569 6d10          	tnz	(_cislanaseg,x)
2021  056b 2613          	jrne	L364
2023  056d 0d03          	tnz	(OFST-22,sp)
2024  056f 260f          	jrne	L364
2025                     ; 330 			continue;
2026  0571               L354:
2027                     ; 321 	for (i = 0; i != 5; i++){			//cyklus pro zpracování 5 èísel
2029  0571 0c16          	inc	(OFST-3,sp)
2033  0573 7b16          	ld	a,(OFST-3,sp)
2034  0575 a105          	cp	a,#5
2035  0577 26c6          	jrne	L154
2036  0579               L554:
2037                     ; 376 	LCD_ClearFlag();			//ukládáí dat do jednotlivých registrù
2039  0579 cd0000        	call	_LCD_ClearFlag
2042  057c ac340734      	jpf	L145
2043  0580               L364:
2044                     ; 331 		}else if (cislanaseg[i] > 0){
2046  0580 7b16          	ld	a,(OFST-3,sp)
2047  0582 5f            	clrw	x
2048  0583 97            	ld	xl,a
2049  0584 6d10          	tnz	(_cislanaseg,x)
2050  0586 2704          	jreq	L164
2051                     ; 332 			nezobrazovat = 1;
2053  0588 a601          	ld	a,#1
2054  058a 6b03          	ld	(OFST-22,sp),a
2056  058c               L164:
2057                     ; 335 		for (x = 0; x != 4; x++){			//každé jedno èíslo je zapisováno pomocí 4 registrù protože máme 4 comy
2059  058c 0f18          	clr	(OFST-1,sp)
2061  058e               L174:
2062                     ; 337 			posunute = vyber[cislanaseg[i]][x][1];			//vezme pøedpis daneého èísla pro první pozici na displeji a podle pozice právì zpracovávaného èísla ji posune tak aby se zprávnì zobrazovaly na øádech jednotek desítek stovek...
2064  058e 7b18          	ld	a,(OFST-1,sp)
2065  0590 5f            	clrw	x
2066  0591 97            	ld	xl,a
2067  0592 58            	sllw	x
2068  0593 1f01          	ldw	(OFST-24,sp),x
2070  0595 7b16          	ld	a,(OFST-3,sp)
2071  0597 5f            	clrw	x
2072  0598 97            	ld	xl,a
2073  0599 e610          	ld	a,(_cislanaseg,x)
2074  059b 97            	ld	xl,a
2075  059c a608          	ld	a,#8
2076  059e 42            	mul	x,a
2077  059f 72fb01        	addw	x,(OFST-24,sp)
2078  05a2 e62a          	ld	a,(_vyber+1,x)
2079  05a4 6b19          	ld	(OFST+0,sp),a
2081                     ; 338 			pomoc = posunute;
2083  05a6 7b19          	ld	a,(OFST+0,sp)
2084  05a8 6b17          	ld	(OFST-2,sp),a
2087  05aa 2009          	jra	L305
2088  05ac               L774:
2089                     ; 341 				pomoc &= (pomoc -1);
2091  05ac 7b17          	ld	a,(OFST-2,sp)
2092  05ae 4a            	dec	a
2093  05af 1417          	and	a,(OFST-2,sp)
2094  05b1 6b17          	ld	(OFST-2,sp),a
2096                     ; 342 				pocetpred1 ++;
2098  05b3 0c04          	inc	(OFST-21,sp)
2100  05b5               L305:
2101                     ; 340 			while (pomoc){			//zajištìní správnosti bitová rotace
2103  05b5 0d17          	tnz	(OFST-2,sp)
2104  05b7 26f3          	jrne	L774
2105                     ; 345 			pomoc = posunute >> posun[i];
2107  05b9 7b16          	ld	a,(OFST-3,sp)
2108  05bb 5f            	clrw	x
2109  05bc 97            	ld	xl,a
2110  05bd e614          	ld	a,(_posun,x)
2111  05bf 5f            	clrw	x
2112  05c0 97            	ld	xl,a
2113  05c1 7b19          	ld	a,(OFST+0,sp)
2114  05c3 5d            	tnzw	x
2115  05c4 2704          	jreq	L64
2116  05c6               L05:
2117  05c6 44            	srl	a
2118  05c7 5a            	decw	x
2119  05c8 26fc          	jrne	L05
2120  05ca               L64:
2121  05ca 6b17          	ld	(OFST-2,sp),a
2124  05cc 2009          	jra	L315
2125  05ce               L705:
2126                     ; 348 				pomoc &= (pomoc -1);
2128  05ce 7b17          	ld	a,(OFST-2,sp)
2129  05d0 4a            	dec	a
2130  05d1 1417          	and	a,(OFST-2,sp)
2131  05d3 6b17          	ld	(OFST-2,sp),a
2133                     ; 349 				pocetpo1 ++;
2135  05d5 0c05          	inc	(OFST-20,sp)
2137  05d7               L315:
2138                     ; 347 			while (pomoc){
2140  05d7 0d17          	tnz	(OFST-2,sp)
2141  05d9 26f3          	jrne	L705
2142                     ; 352 			posunute =  posunute >> posun[i] | posunute << 8u-posun[i];			//bitová rotace
2144  05db 7b16          	ld	a,(OFST-3,sp)
2145  05dd 5f            	clrw	x
2146  05de 97            	ld	xl,a
2147  05df e614          	ld	a,(_posun,x)
2148  05e1 a008          	sub	a,#8
2149  05e3 40            	neg	a
2150  05e4 5f            	clrw	x
2151  05e5 97            	ld	xl,a
2152  05e6 7b19          	ld	a,(OFST+0,sp)
2153  05e8 5d            	tnzw	x
2154  05e9 2704          	jreq	L25
2155  05eb               L45:
2156  05eb 48            	sll	a
2157  05ec 5a            	decw	x
2158  05ed 26fc          	jrne	L45
2159  05ef               L25:
2160  05ef 6b02          	ld	(OFST-23,sp),a
2162  05f1 7b16          	ld	a,(OFST-3,sp)
2163  05f3 5f            	clrw	x
2164  05f4 97            	ld	xl,a
2165  05f5 e614          	ld	a,(_posun,x)
2166  05f7 5f            	clrw	x
2167  05f8 97            	ld	xl,a
2168  05f9 7b19          	ld	a,(OFST+0,sp)
2169  05fb 5d            	tnzw	x
2170  05fc 2704          	jreq	L65
2171  05fe               L06:
2172  05fe 44            	srl	a
2173  05ff 5a            	decw	x
2174  0600 26fc          	jrne	L06
2175  0602               L65:
2176  0602 1a02          	or	a,(OFST-23,sp)
2177  0604 6b19          	ld	(OFST+0,sp),a
2179                     ; 354 			if (pocetpred1 == pocetpo1){			//úprava pro zápis do registrù
2181  0606 7b04          	ld	a,(OFST-21,sp)
2182  0608 1105          	cp	a,(OFST-20,sp)
2183  060a 2637          	jrne	L715
2184                     ; 355 				vysledek[x][0] = vyber[cislanaseg[i]][x][0];
2186  060c 7b18          	ld	a,(OFST-1,sp)
2187  060e 5f            	clrw	x
2188  060f 97            	ld	xl,a
2189  0610 58            	sllw	x
2190  0611 7b18          	ld	a,(OFST-1,sp)
2191  0613 905f          	clrw	y
2192  0615 9097          	ld	yl,a
2193  0617 9058          	sllw	y
2194  0619 1701          	ldw	(OFST-24,sp),y
2196  061b 7b16          	ld	a,(OFST-3,sp)
2197  061d 905f          	clrw	y
2198  061f 9097          	ld	yl,a
2199  0621 90e610        	ld	a,(_cislanaseg,y)
2200  0624 905f          	clrw	y
2201  0626 9097          	ld	yl,a
2202  0628 9058          	sllw	y
2203  062a 9058          	sllw	y
2204  062c 9058          	sllw	y
2205  062e 72f901        	addw	y,(OFST-24,sp)
2206  0631 90e629        	ld	a,(_vyber,y)
2207  0634 e700          	ld	(_vysledek,x),a
2208                     ; 356 				vysledek[x][1] = posunute;
2210  0636 7b18          	ld	a,(OFST-1,sp)
2211  0638 5f            	clrw	x
2212  0639 97            	ld	xl,a
2213  063a 58            	sllw	x
2214  063b 7b19          	ld	a,(OFST+0,sp)
2215  063d e701          	ld	(_vysledek+1,x),a
2217  063f acee06ee      	jpf	L125
2218  0643               L715:
2219                     ; 357 			}else if (pocetpo1 == 0){
2221  0643 0d05          	tnz	(OFST-20,sp)
2222  0645 2636          	jrne	L325
2223                     ; 358 				vysledek[x+4][0] = vyber[cislanaseg[i]][x][0]-1;
2225  0647 7b18          	ld	a,(OFST-1,sp)
2226  0649 5f            	clrw	x
2227  064a 97            	ld	xl,a
2228  064b 58            	sllw	x
2229  064c 7b18          	ld	a,(OFST-1,sp)
2230  064e 905f          	clrw	y
2231  0650 9097          	ld	yl,a
2232  0652 9058          	sllw	y
2233  0654 1701          	ldw	(OFST-24,sp),y
2235  0656 7b16          	ld	a,(OFST-3,sp)
2236  0658 905f          	clrw	y
2237  065a 9097          	ld	yl,a
2238  065c 90e610        	ld	a,(_cislanaseg,y)
2239  065f 905f          	clrw	y
2240  0661 9097          	ld	yl,a
2241  0663 9058          	sllw	y
2242  0665 9058          	sllw	y
2243  0667 9058          	sllw	y
2244  0669 72f901        	addw	y,(OFST-24,sp)
2245  066c 90e629        	ld	a,(_vyber,y)
2246  066f 4a            	dec	a
2247  0670 e708          	ld	(_vysledek+8,x),a
2248                     ; 359 				vysledek[x+4][1] = posunute;
2250  0672 7b18          	ld	a,(OFST-1,sp)
2251  0674 5f            	clrw	x
2252  0675 97            	ld	xl,a
2253  0676 58            	sllw	x
2254  0677 7b19          	ld	a,(OFST+0,sp)
2255  0679 e709          	ld	(_vysledek+9,x),a
2257  067b 2071          	jra	L125
2258  067d               L325:
2259                     ; 360 			}else if (pocetpo1 < pocetpred1){
2261  067d 7b05          	ld	a,(OFST-20,sp)
2262  067f 1104          	cp	a,(OFST-21,sp)
2263  0681 246b          	jruge	L125
2264                     ; 361 				vysledek[x][0] = vyber[cislanaseg[i]][x][0];
2266  0683 7b18          	ld	a,(OFST-1,sp)
2267  0685 5f            	clrw	x
2268  0686 97            	ld	xl,a
2269  0687 58            	sllw	x
2270  0688 7b18          	ld	a,(OFST-1,sp)
2271  068a 905f          	clrw	y
2272  068c 9097          	ld	yl,a
2273  068e 9058          	sllw	y
2274  0690 1701          	ldw	(OFST-24,sp),y
2276  0692 7b16          	ld	a,(OFST-3,sp)
2277  0694 905f          	clrw	y
2278  0696 9097          	ld	yl,a
2279  0698 90e610        	ld	a,(_cislanaseg,y)
2280  069b 905f          	clrw	y
2281  069d 9097          	ld	yl,a
2282  069f 9058          	sllw	y
2283  06a1 9058          	sllw	y
2284  06a3 9058          	sllw	y
2285  06a5 72f901        	addw	y,(OFST-24,sp)
2286  06a8 90e629        	ld	a,(_vyber,y)
2287  06ab e700          	ld	(_vysledek,x),a
2288                     ; 362 				vysledek[x][1] = posunute & 0b00001111;
2290  06ad 7b18          	ld	a,(OFST-1,sp)
2291  06af 5f            	clrw	x
2292  06b0 97            	ld	xl,a
2293  06b1 58            	sllw	x
2294  06b2 7b19          	ld	a,(OFST+0,sp)
2295  06b4 a40f          	and	a,#15
2296  06b6 e701          	ld	(_vysledek+1,x),a
2297                     ; 363 				vysledek[x+4][0] = vyber[cislanaseg[i]][x][0]-1;
2299  06b8 7b18          	ld	a,(OFST-1,sp)
2300  06ba 5f            	clrw	x
2301  06bb 97            	ld	xl,a
2302  06bc 58            	sllw	x
2303  06bd 7b18          	ld	a,(OFST-1,sp)
2304  06bf 905f          	clrw	y
2305  06c1 9097          	ld	yl,a
2306  06c3 9058          	sllw	y
2307  06c5 1701          	ldw	(OFST-24,sp),y
2309  06c7 7b16          	ld	a,(OFST-3,sp)
2310  06c9 905f          	clrw	y
2311  06cb 9097          	ld	yl,a
2312  06cd 90e610        	ld	a,(_cislanaseg,y)
2313  06d0 905f          	clrw	y
2314  06d2 9097          	ld	yl,a
2315  06d4 9058          	sllw	y
2316  06d6 9058          	sllw	y
2317  06d8 9058          	sllw	y
2318  06da 72f901        	addw	y,(OFST-24,sp)
2319  06dd 90e629        	ld	a,(_vyber,y)
2320  06e0 4a            	dec	a
2321  06e1 e708          	ld	(_vysledek+8,x),a
2322                     ; 364 				vysledek[x+4][1] = posunute & 0b11110000;
2324  06e3 7b18          	ld	a,(OFST-1,sp)
2325  06e5 5f            	clrw	x
2326  06e6 97            	ld	xl,a
2327  06e7 58            	sllw	x
2328  06e8 7b19          	ld	a,(OFST+0,sp)
2329  06ea a4f0          	and	a,#240
2330  06ec e709          	ld	(_vysledek+9,x),a
2331  06ee               L125:
2332                     ; 366 			pocetpred1 = 0;
2334  06ee 0f04          	clr	(OFST-21,sp)
2336                     ; 367 			pocetpo1 = 0;
2338  06f0 0f05          	clr	(OFST-20,sp)
2340                     ; 368 			pomoc = 0;
2342                     ; 335 		for (x = 0; x != 4; x++){			//každé jedno èíslo je zapisováno pomocí 4 registrù protože máme 4 comy
2344  06f2 0c18          	inc	(OFST-1,sp)
2348  06f4 7b18          	ld	a,(OFST-1,sp)
2349  06f6 a104          	cp	a,#4
2350  06f8 2703          	jreq	L26
2351  06fa cc058e        	jp	L174
2352  06fd               L26:
2353                     ; 370 			for (y = 0; y != 8; y++){			//uložení mezivýsledku
2355  06fd 0f19          	clr	(OFST+0,sp)
2357  06ff               L135:
2358                     ; 371 			celkovyvysledek[y][1] = celkovyvysledek[y][1] | vysledek[y][1];
2360  06ff 96            	ldw	x,sp
2361  0700 1c0007        	addw	x,#OFST-18
2362  0703 1f01          	ldw	(OFST-24,sp),x
2364  0705 7b19          	ld	a,(OFST+0,sp)
2365  0707 5f            	clrw	x
2366  0708 97            	ld	xl,a
2367  0709 58            	sllw	x
2368  070a 72fb01        	addw	x,(OFST-24,sp)
2369  070d 7b19          	ld	a,(OFST+0,sp)
2370  070f 905f          	clrw	y
2371  0711 9097          	ld	yl,a
2372  0713 9058          	sllw	y
2373  0715 f6            	ld	a,(x)
2374  0716 90ea01        	or	a,(_vysledek+1,y)
2375  0719 f7            	ld	(x),a
2376                     ; 372 			vysledek[y][0] = 0;
2378  071a 7b19          	ld	a,(OFST+0,sp)
2379  071c 5f            	clrw	x
2380  071d 97            	ld	xl,a
2381  071e 58            	sllw	x
2382  071f 6f00          	clr	(_vysledek,x)
2383                     ; 373 			vysledek[y][1] = 0;
2385  0721 7b19          	ld	a,(OFST+0,sp)
2386  0723 5f            	clrw	x
2387  0724 97            	ld	xl,a
2388  0725 58            	sllw	x
2389  0726 6f01          	clr	(_vysledek+1,x)
2390                     ; 370 			for (y = 0; y != 8; y++){			//uložení mezivýsledku
2392  0728 0c19          	inc	(OFST+0,sp)
2396  072a 7b19          	ld	a,(OFST+0,sp)
2397  072c a108          	cp	a,#8
2398  072e 26cf          	jrne	L135
2399  0730 ac710571      	jpf	L354
2400  0734               L145:
2401                     ; 377 	while(LCD_GetFlagStatus() == RESET);
2403  0734 cd0000        	call	_LCD_GetFlagStatus
2405  0737 4d            	tnz	a
2406  0738 27fa          	jreq	L145
2407                     ; 378 	LCD_WriteRAM(LCD_RAMRegister_1, celkovyvysledek[0][1]);
2409  073a 7b07          	ld	a,(OFST-18,sp)
2410  073c ae0100        	ldw	x,#256
2411  073f 97            	ld	xl,a
2412  0740 cd0000        	call	_LCD_WriteRAM
2414                     ; 380 	LCD_ClearFlag();
2416  0743 cd0000        	call	_LCD_ClearFlag
2419  0746               L745:
2420                     ; 381 	while(LCD_GetFlagStatus() == RESET);
2422  0746 cd0000        	call	_LCD_GetFlagStatus
2424  0749 4d            	tnz	a
2425  074a 27fa          	jreq	L745
2426                     ; 382 	LCD_WriteRAM(LCD_RAMRegister_0, celkovyvysledek[4][1]);
2428  074c 7b0f          	ld	a,(OFST-10,sp)
2429  074e 5f            	clrw	x
2430  074f 97            	ld	xl,a
2431  0750 cd0000        	call	_LCD_WriteRAM
2433                     ; 384 	LCD_ClearFlag();
2435  0753 cd0000        	call	_LCD_ClearFlag
2438  0756               L555:
2439                     ; 385 	while(LCD_GetFlagStatus() == RESET);
2441  0756 cd0000        	call	_LCD_GetFlagStatus
2443  0759 4d            	tnz	a
2444  075a 27fa          	jreq	L555
2445                     ; 386 	LCD_WriteRAM(LCD_RAMRegister_4, celkovyvysledek[1][1]);
2447  075c 7b09          	ld	a,(OFST-16,sp)
2448  075e ae0400        	ldw	x,#1024
2449  0761 97            	ld	xl,a
2450  0762 cd0000        	call	_LCD_WriteRAM
2452                     ; 388 	LCD_ClearFlag();
2454  0765 cd0000        	call	_LCD_ClearFlag
2457  0768               L365:
2458                     ; 389 	while(LCD_GetFlagStatus() == RESET);
2460  0768 cd0000        	call	_LCD_GetFlagStatus
2462  076b 4d            	tnz	a
2463  076c 27fa          	jreq	L365
2464                     ; 390 	LCD_WriteRAM(LCD_RAMRegister_3, celkovyvysledek[5][1]);
2466  076e 7b11          	ld	a,(OFST-8,sp)
2467  0770 ae0300        	ldw	x,#768
2468  0773 97            	ld	xl,a
2469  0774 cd0000        	call	_LCD_WriteRAM
2471                     ; 392 	LCD_ClearFlag();
2473  0777 cd0000        	call	_LCD_ClearFlag
2476  077a               L175:
2477                     ; 393 	while(LCD_GetFlagStatus() == RESET);
2479  077a cd0000        	call	_LCD_GetFlagStatus
2481  077d 4d            	tnz	a
2482  077e 27fa          	jreq	L175
2483                     ; 394 	LCD_WriteRAM(LCD_RAMRegister_8, celkovyvysledek[2][1]);
2485  0780 7b0b          	ld	a,(OFST-14,sp)
2486  0782 ae0800        	ldw	x,#2048
2487  0785 97            	ld	xl,a
2488  0786 cd0000        	call	_LCD_WriteRAM
2490                     ; 396 	LCD_ClearFlag();
2492  0789 cd0000        	call	_LCD_ClearFlag
2495  078c               L775:
2496                     ; 397 	while(LCD_GetFlagStatus() == RESET);
2498  078c cd0000        	call	_LCD_GetFlagStatus
2500  078f 4d            	tnz	a
2501  0790 27fa          	jreq	L775
2502                     ; 398 	LCD_WriteRAM(LCD_RAMRegister_7, celkovyvysledek[6][1]);
2504  0792 7b13          	ld	a,(OFST-6,sp)
2505  0794 ae0700        	ldw	x,#1792
2506  0797 97            	ld	xl,a
2507  0798 cd0000        	call	_LCD_WriteRAM
2509                     ; 400 	LCD_ClearFlag();
2511  079b cd0000        	call	_LCD_ClearFlag
2514  079e               L506:
2515                     ; 401 	while(LCD_GetFlagStatus() == RESET);
2517  079e cd0000        	call	_LCD_GetFlagStatus
2519  07a1 4d            	tnz	a
2520  07a2 27fa          	jreq	L506
2521                     ; 402 	LCD_WriteRAM(LCD_RAMRegister_11, celkovyvysledek[3][1]);
2523  07a4 7b0d          	ld	a,(OFST-12,sp)
2524  07a6 ae0b00        	ldw	x,#2816
2525  07a9 97            	ld	xl,a
2526  07aa cd0000        	call	_LCD_WriteRAM
2528                     ; 404 	LCD_ClearFlag();
2530  07ad cd0000        	call	_LCD_ClearFlag
2533  07b0               L316:
2534                     ; 405 	while(LCD_GetFlagStatus() == RESET);
2536  07b0 cd0000        	call	_LCD_GetFlagStatus
2538  07b3 4d            	tnz	a
2539  07b4 27fa          	jreq	L316
2540                     ; 406 	LCD_WriteRAM(LCD_RAMRegister_10, celkovyvysledek[7][1]);
2542  07b6 7b15          	ld	a,(OFST-4,sp)
2543  07b8 ae0a00        	ldw	x,#2560
2544  07bb 97            	ld	xl,a
2545  07bc cd0000        	call	_LCD_WriteRAM
2547                     ; 408 }
2550  07bf 5b19          	addw	sp,#25
2551  07c1 81            	ret
2575                     ; 410 void zobraz_pomlcky(void){			//zobrazení pomlèek na LCD
2576                     	switch	.text
2577  07c2               _zobraz_pomlcky:
2581                     ; 411 	LCD_WriteRAM(LCD_RAMRegister_8, 0);			//ulož do LCD registrù data pro zobrazení pomlèek
2583  07c2 ae0800        	ldw	x,#2048
2584  07c5 cd0000        	call	_LCD_WriteRAM
2586                     ; 412 	LCD_WriteRAM(LCD_RAMRegister_0, 0 );
2588  07c8 5f            	clrw	x
2589  07c9 cd0000        	call	_LCD_WriteRAM
2591                     ; 413 	LCD_WriteRAM(LCD_RAMRegister_1, 0 );
2593  07cc ae0100        	ldw	x,#256
2594  07cf cd0000        	call	_LCD_WriteRAM
2596                     ; 414 	LCD_WriteRAM(LCD_RAMRegister_3, 0b01010000 );
2598  07d2 ae0350        	ldw	x,#848
2599  07d5 cd0000        	call	_LCD_WriteRAM
2601                     ; 415 	LCD_WriteRAM(LCD_RAMRegister_4, 0 );
2603  07d8 ae0400        	ldw	x,#1024
2604  07db cd0000        	call	_LCD_WriteRAM
2606                     ; 416 	LCD_WriteRAM(LCD_RAMRegister_7, 0 );
2608  07de ae0700        	ldw	x,#1792
2609  07e1 cd0000        	call	_LCD_WriteRAM
2611                     ; 417 	LCD_WriteRAM(LCD_RAMRegister_8, 0 );
2613  07e4 ae0800        	ldw	x,#2048
2614  07e7 cd0000        	call	_LCD_WriteRAM
2616                     ; 418 	LCD_WriteRAM(LCD_RAMRegister_10, 0 );
2618  07ea ae0a00        	ldw	x,#2560
2619  07ed cd0000        	call	_LCD_WriteRAM
2621                     ; 419 	LCD_WriteRAM(LCD_RAMRegister_11, 0 );
2623  07f0 ae0b00        	ldw	x,#2816
2624  07f3 cd0000        	call	_LCD_WriteRAM
2626                     ; 420 }
2629  07f6 81            	ret
2677                     ; 422 void EEPROMzapis(uint32_t zapsat,uint32_t adresa){			//ukládání do EEPROM
2678                     	switch	.text
2679  07f7               _EEPROMzapis:
2681       00000000      OFST:	set	0
2684                     ; 423 	FLASH_Unlock(FLASH_MemType_Data);			//odemkni zabezpeèenou EEPROM
2686  07f7 a6f7          	ld	a,#247
2687  07f9 cd0000        	call	_FLASH_Unlock
2690  07fc               L356:
2691                     ; 424 	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL)== RESET);			//dokud není pøipravená èekej
2693  07fc a608          	ld	a,#8
2694  07fe cd0000        	call	_FLASH_GetFlagStatus
2696  0801 4d            	tnz	a
2697  0802 27f8          	jreq	L356
2698                     ; 426 		FLASH_ProgramWord(adresa, zapsat);
2700  0804 1e05          	ldw	x,(OFST+5,sp)
2701  0806 89            	pushw	x
2702  0807 1e05          	ldw	x,(OFST+5,sp)
2703  0809 89            	pushw	x
2704  080a 1e0d          	ldw	x,(OFST+13,sp)
2705  080c 89            	pushw	x
2706  080d 1e0d          	ldw	x,(OFST+13,sp)
2707  080f 89            	pushw	x
2708  0810 cd0000        	call	_FLASH_ProgramWord
2710  0813 5b08          	addw	sp,#8
2712  0815               L166:
2713                     ; 431 	while(FLASH_GetFlagStatus(FLASH_FLAG_EOP)== RESET);
2715  0815 a604          	ld	a,#4
2716  0817 cd0000        	call	_FLASH_GetFlagStatus
2718  081a 4d            	tnz	a
2719  081b 27f8          	jreq	L166
2720                     ; 432 	FLASH_Lock(FLASH_MemType_Data);			//zamkli EEPROM
2722  081d a6f7          	ld	a,#247
2723  081f cd0000        	call	_FLASH_Lock
2725                     ; 433 }
2728  0822 81            	ret
2793                     ; 435 uint32_t EEPROMcteni(uint32_t adresa){			// ètení z EEPROM
2794                     	switch	.text
2795  0823               _EEPROMcteni:
2797  0823 5206          	subw	sp,#6
2798       00000006      OFST:	set	6
2801                     ; 436 	uint32_t precteno = 0;	
2803  0825 ae0000        	ldw	x,#0
2804  0828 1f04          	ldw	(OFST-2,sp),x
2805  082a ae0000        	ldw	x,#0
2806  082d 1f02          	ldw	(OFST-4,sp),x
2808                     ; 437 	uint8_t byte = 0;
2810                     ; 439 	FLASH_Unlock(FLASH_MemType_Data);			//odemkni EEPROM
2812  082f a6f7          	ld	a,#247
2813  0831 cd0000        	call	_FLASH_Unlock
2816  0834               L127:
2817                     ; 440 	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL)== RESET);		//dokud není pøipravená èekej
2819  0834 a608          	ld	a,#8
2820  0836 cd0000        	call	_FLASH_GetFlagStatus
2822  0839 4d            	tnz	a
2823  083a 27f8          	jreq	L127
2824                     ; 442 	for (i=4; i>0; i--){			//umíme èíst jenom po Bytu ne po slovech proto požijeme cyklus
2826  083c a604          	ld	a,#4
2827  083e 6b06          	ld	(OFST+0,sp),a
2829  0840               L527:
2830                     ; 443 		byte = FLASH_ReadByte(adresa);
2832  0840 1e0b          	ldw	x,(OFST+5,sp)
2833  0842 89            	pushw	x
2834  0843 1e0b          	ldw	x,(OFST+5,sp)
2835  0845 89            	pushw	x
2836  0846 cd0000        	call	_FLASH_ReadByte
2838  0849 5b04          	addw	sp,#4
2839  084b 6b01          	ld	(OFST-5,sp),a
2841                     ; 444 		precteno = precteno | (byte<<((i-1)*8));
2843  084d 7b01          	ld	a,(OFST-5,sp)
2844  084f 5f            	clrw	x
2845  0850 97            	ld	xl,a
2846  0851 7b06          	ld	a,(OFST+0,sp)
2847  0853 48            	sll	a
2848  0854 48            	sll	a
2849  0855 48            	sll	a
2850  0856 a008          	sub	a,#8
2851  0858 4d            	tnz	a
2852  0859 2704          	jreq	L27
2853  085b               L47:
2854  085b 58            	sllw	x
2855  085c 4a            	dec	a
2856  085d 26fc          	jrne	L47
2857  085f               L27:
2858  085f cd0000        	call	c_itolx
2860  0862 96            	ldw	x,sp
2861  0863 1c0002        	addw	x,#OFST-4
2862  0866 cd0000        	call	c_lgor
2865                     ; 445 		adresa++;
2867  0869 96            	ldw	x,sp
2868  086a 1c0009        	addw	x,#OFST+3
2869  086d a601          	ld	a,#1
2870  086f cd0000        	call	c_lgadc
2872                     ; 442 	for (i=4; i>0; i--){			//umíme èíst jenom po Bytu ne po slovech proto požijeme cyklus
2874  0872 0a06          	dec	(OFST+0,sp)
2878  0874 9c            	rvf
2879  0875 7b06          	ld	a,(OFST+0,sp)
2880  0877 a100          	cp	a,#0
2881  0879 2cc5          	jrsgt	L527
2882                     ; 447 	FLASH_Lock(FLASH_MemType_Data);			//zamèi EEPROM
2884  087b a6f7          	ld	a,#247
2885  087d cd0000        	call	_FLASH_Lock
2887                     ; 448 	return precteno;			//hodnotou to funkce je pøeètená hodnota
2889  0880 96            	ldw	x,sp
2890  0881 1c0002        	addw	x,#OFST-4
2891  0884 cd0000        	call	c_ltor
2895  0887 5b06          	addw	sp,#6
2896  0889 81            	ret
2939                     	switch	.const
2940  0014               L001:
2941  0014 00000063      	dc.l	99
2942                     ; 451 uint8_t baterie (void){			//zjištìní stavu baterie
2943                     	switch	.text
2944  088a               _baterie:
2946  088a 5205          	subw	sp,#5
2947       00000005      OFST:	set	5
2950                     ; 453 	ADC(1);			//zapni a pøiprav ADC
2952  088c a601          	ld	a,#1
2953  088e cd0423        	call	_ADC
2955                     ; 454 	for (i = 0; i < 3; i++){			//vezmi tøetí vzorek - pár vzorkù trvá než se hodnota ustálí
2957  0891 0f05          	clr	(OFST+0,sp)
2959  0893               L157:
2960                     ; 455 		ADC_SoftwareStartConv(ADC1);			//zaèni pøevod
2962  0893 ae5340        	ldw	x,#21312
2963  0896 cd0000        	call	_ADC_SoftwareStartConv
2966  0899               L167:
2967                     ; 456 		while(ADC_GetFlagStatus(ADC1,ADC_FLAG_EOC) == RESET);			//dokud není vzorek zpracován èekej
2969  0899 4b01          	push	#1
2970  089b ae5340        	ldw	x,#21312
2971  089e cd0000        	call	_ADC_GetFlagStatus
2973  08a1 5b01          	addw	sp,#1
2974  08a3 4d            	tnz	a
2975  08a4 27f3          	jreq	L167
2976                     ; 457 		vzorek =  ADC_GetConversionValue(ADC1);			//získej pøevedenou hodnotu
2978  08a6 ae5340        	ldw	x,#21312
2979  08a9 cd0000        	call	_ADC_GetConversionValue
2981  08ac cd0000        	call	c_uitolx
2983  08af ae0019        	ldw	x,#_vzorek
2984  08b2 cd0000        	call	c_rtol
2986                     ; 458 		ADC_ClearFlag(ADC1, ADC_FLAG_EOC);			//pøevod ukonèen
2988  08b5 4b01          	push	#1
2989  08b7 ae5340        	ldw	x,#21312
2990  08ba cd0000        	call	_ADC_ClearFlag
2992  08bd 84            	pop	a
2993                     ; 454 	for (i = 0; i < 3; i++){			//vezmi tøetí vzorek - pár vzorkù trvá než se hodnota ustálí
2995  08be 0c05          	inc	(OFST+0,sp)
2999  08c0 7b05          	ld	a,(OFST+0,sp)
3000  08c2 a103          	cp	a,#3
3001  08c4 25cd          	jrult	L157
3002                     ; 460 	ADC(0);			//vypni ADC
3004  08c6 4f            	clr	a
3005  08c7 cd0423        	call	_ADC
3007                     ; 462 	vzorek = vzorek - minU;		//rozpìtí se musí pohybovat od 3.4V (- baterie vybita) až po 4.2V (plnì nabita) jinak by se procenta poèítala z celéo rozsahu 0 - 4.2
3009  08ca be0e          	ldw	x,_minU
3010  08cc cd0000        	call	c_uitolx
3012  08cf ae0019        	ldw	x,#_vzorek
3013  08d2 cd0000        	call	c_lgsub
3015                     ; 463 	if (vzorek <= 0){
3017  08d5 9c            	rvf
3018  08d6 ae0019        	ldw	x,#_vzorek
3019  08d9 cd0000        	call	c_lzmp
3021  08dc 2c0c          	jrsgt	L567
3022                     ; 464 		vzorek = 0;
3024  08de ae0000        	ldw	x,#0
3025  08e1 bf1b          	ldw	_vzorek+2,x
3026  08e3 ae0000        	ldw	x,#0
3027  08e6 bf19          	ldw	_vzorek,x
3029  08e8 2065          	jra	L767
3030  08ea               L567:
3031                     ; 465 	}else if(vzorek > rozdil_max_min){
3033  08ea 9c            	rvf
3034  08eb be0c          	ldw	x,_rozdil_max_min
3035  08ed cd0000        	call	c_uitolx
3037  08f0 ae0019        	ldw	x,#_vzorek
3038  08f3 cd0000        	call	c_lcmp
3040  08f6 2e0c          	jrsge	L177
3041                     ; 466 		 vzorek = 100;
3043  08f8 ae0064        	ldw	x,#100
3044  08fb bf1b          	ldw	_vzorek+2,x
3045  08fd ae0000        	ldw	x,#0
3046  0900 bf19          	ldw	_vzorek,x
3048  0902 204b          	jra	L767
3049  0904               L177:
3050                     ; 468 		vzorek = (vzorek*100)/rozdil_max_min;		
3052  0904 be0c          	ldw	x,_rozdil_max_min
3053  0906 cd0000        	call	c_uitolx
3055  0909 96            	ldw	x,sp
3056  090a 1c0001        	addw	x,#OFST-4
3057  090d cd0000        	call	c_rtol
3060  0910 ae0019        	ldw	x,#_vzorek
3061  0913 cd0000        	call	c_ltor
3063  0916 a664          	ld	a,#100
3064  0918 cd0000        	call	c_smul
3066  091b 96            	ldw	x,sp
3067  091c 1c0001        	addw	x,#OFST-4
3068  091f cd0000        	call	c_ldiv
3070  0922 ae0019        	ldw	x,#_vzorek
3071  0925 cd0000        	call	c_rtol
3073                     ; 469 		if((vzorek == 99) && (((minU + rozdil_max_min)- maxU) < 4)){
3075  0928 ae0019        	ldw	x,#_vzorek
3076  092b cd0000        	call	c_ltor
3078  092e ae0014        	ldw	x,#L001
3079  0931 cd0000        	call	c_lcmp
3081  0934 2619          	jrne	L767
3083  0936 be0e          	ldw	x,_minU
3084  0938 72bb000c      	addw	x,_rozdil_max_min
3085  093c 72b0001d      	subw	x,_maxU
3086  0940 a30004        	cpw	x,#4
3087  0943 240a          	jruge	L767
3088                     ; 470 			vzorek = 100;
3090  0945 ae0064        	ldw	x,#100
3091  0948 bf1b          	ldw	_vzorek+2,x
3092  094a ae0000        	ldw	x,#0
3093  094d bf19          	ldw	_vzorek,x
3094  094f               L767:
3095                     ; 473 	return vzorek;			//funkce nabývá procentuální hodnoty napìtí baterie
3097  094f b61c          	ld	a,_vzorek+3
3100  0951 5b05          	addw	sp,#5
3101  0953 81            	ret
3146                     ; 476 void detekce_nabijeni (void){			//nabíjí se baterie?
3147                     	switch	.text
3148  0954               _detekce_nabijeni:
3150  0954 88            	push	a
3151       00000001      OFST:	set	1
3154                     ; 477 	if(GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_5)!= RESET){			//baterie se nenabíjí
3156  0955 4b20          	push	#32
3157  0957 ae500a        	ldw	x,#20490
3158  095a cd0000        	call	_GPIO_ReadInputDataBit
3160  095d 5b01          	addw	sp,#1
3161  095f 4d            	tnz	a
3162  0960 2603          	jrne	L401
3163  0962 cc0a06        	jp	L5101
3164  0965               L401:
3165                     ; 478 		if(nab_pripojeno){			//pokud se pøed chvílí nabíjela odeber vozrek napìtí a ulož ho jako referenèní hodnotu do EEPROM
3167  0965 3d06          	tnz	_nab_pripojeno
3168  0967 2603          	jrne	L601
3169  0969 cc0a0a        	jp	L1401
3170  096c               L601:
3171                     ; 480 			ADC(1);
3173  096c a601          	ld	a,#1
3174  096e cd0423        	call	_ADC
3176                     ; 481 			for(i = 0; i < 3; i++){
3178  0971 0f01          	clr	(OFST+0,sp)
3180  0973               L1201:
3181                     ; 482 				ADC_SoftwareStartConv(ADC1);
3183  0973 ae5340        	ldw	x,#21312
3184  0976 cd0000        	call	_ADC_SoftwareStartConv
3187  0979               L1301:
3188                     ; 483 				while(ADC_GetFlagStatus(ADC1,ADC_FLAG_EOC) == RESET);
3190  0979 4b01          	push	#1
3191  097b ae5340        	ldw	x,#21312
3192  097e cd0000        	call	_ADC_GetFlagStatus
3194  0981 5b01          	addw	sp,#1
3195  0983 4d            	tnz	a
3196  0984 27f3          	jreq	L1301
3197                     ; 484 				maxU =  ADC_GetConversionValue(ADC1);
3199  0986 ae5340        	ldw	x,#21312
3200  0989 cd0000        	call	_ADC_GetConversionValue
3202  098c bf1d          	ldw	_maxU,x
3203                     ; 485 				ADC_ClearFlag(ADC1, ADC_FLAG_EOC);
3205  098e 4b01          	push	#1
3206  0990 ae5340        	ldw	x,#21312
3207  0993 cd0000        	call	_ADC_ClearFlag
3209  0996 84            	pop	a
3210                     ; 481 			for(i = 0; i < 3; i++){
3212  0997 0c01          	inc	(OFST+0,sp)
3216  0999 7b01          	ld	a,(OFST+0,sp)
3217  099b a103          	cp	a,#3
3218  099d 25d4          	jrult	L1201
3219                     ; 487 			ADC(0);
3221  099f 4f            	clr	a
3222  09a0 cd0423        	call	_ADC
3224                     ; 488 			minU = ((8 * maxU) / 10)-3;
3226  09a3 be1d          	ldw	x,_maxU
3227  09a5 58            	sllw	x
3228  09a6 58            	sllw	x
3229  09a7 58            	sllw	x
3230  09a8 a60a          	ld	a,#10
3231  09aa 62            	div	x,a
3232  09ab 1d0003        	subw	x,#3
3233  09ae bf0e          	ldw	_minU,x
3234                     ; 489 			rozdil_max_min = maxU - minU;
3236  09b0 be1d          	ldw	x,_maxU
3237  09b2 72b0000e      	subw	x,_minU
3238  09b6 bf0c          	ldw	_rozdil_max_min,x
3239                     ; 490 			nab_pripojeno = 0;
3241  09b8 3f06          	clr	_nab_pripojeno
3242                     ; 491 			if(rozdil_max_min > 610 && minU > 2428){
3244  09ba be0c          	ldw	x,_rozdil_max_min
3245  09bc a30263        	cpw	x,#611
3246  09bf 2539          	jrult	L5301
3248  09c1 be0e          	ldw	x,_minU
3249  09c3 a3097d        	cpw	x,#2429
3250  09c6 2532          	jrult	L5301
3251                     ; 492 				EEPROMzapis(minU,0x001004);
3253  09c8 ae1004        	ldw	x,#4100
3254  09cb 89            	pushw	x
3255  09cc ae0000        	ldw	x,#0
3256  09cf 89            	pushw	x
3257  09d0 be0e          	ldw	x,_minU
3258  09d2 cd0000        	call	c_uitolx
3260  09d5 be02          	ldw	x,c_lreg+2
3261  09d7 89            	pushw	x
3262  09d8 be00          	ldw	x,c_lreg
3263  09da 89            	pushw	x
3264  09db cd07f7        	call	_EEPROMzapis
3266  09de 5b08          	addw	sp,#8
3267                     ; 493 				EEPROMzapis(rozdil_max_min,0x001008);
3269  09e0 ae1008        	ldw	x,#4104
3270  09e3 89            	pushw	x
3271  09e4 ae0000        	ldw	x,#0
3272  09e7 89            	pushw	x
3273  09e8 be0c          	ldw	x,_rozdil_max_min
3274  09ea cd0000        	call	c_uitolx
3276  09ed be02          	ldw	x,c_lreg+2
3277  09ef 89            	pushw	x
3278  09f0 be00          	ldw	x,c_lreg
3279  09f2 89            	pushw	x
3280  09f3 cd07f7        	call	_EEPROMzapis
3282  09f6 5b08          	addw	sp,#8
3284  09f8 2010          	jra	L1401
3285  09fa               L5301:
3286                     ; 495 				rozdil_max_min = 610;
3288  09fa ae0262        	ldw	x,#610
3289  09fd bf0c          	ldw	_rozdil_max_min,x
3290                     ; 496 				minU = 2428;
3292  09ff ae097c        	ldw	x,#2428
3293  0a02 bf0e          	ldw	_minU,x
3294  0a04 2004          	jra	L1401
3295  0a06               L5101:
3296                     ; 500 		nab_pripojeno = 1;
3298  0a06 35010006      	mov	_nab_pripojeno,#1
3299  0a0a               L1401:
3300                     ; 502 }
3303  0a0a 84            	pop	a
3304  0a0b 81            	ret
3337                     ; 504 void spanek (void){			//potøebné pøípravy na spánek a samotný spánek
3338                     	switch	.text
3339  0a0c               _spanek:
3343                     ; 505 	if(GPIO_ReadOutputDataBit(GPIOB, GPIO_Pin_2) == 4 && !wut){			//pokud je podsvícení displeje zapnurto 
3345  0a0c 4b04          	push	#4
3346  0a0e ae5005        	ldw	x,#20485
3347  0a11 cd0000        	call	_GPIO_ReadOutputDataBit
3349  0a14 5b01          	addw	sp,#1
3350  0a16 a104          	cp	a,#4
3351  0a18 261c          	jrne	L3501
3353  0a1a 3d01          	tnz	_wut
3354  0a1c 2618          	jrne	L3501
3355                     ; 506 			RTC_SetWakeUpCounter(23750);			//nastav èas vypnutí na 10 skund
3357  0a1e ae5cc6        	ldw	x,#23750
3358  0a21 cd0000        	call	_RTC_SetWakeUpCounter
3360                     ; 507 			RTC_WakeUpCmd(ENABLE);
3362  0a24 a601          	ld	a,#1
3363  0a26 cd0000        	call	_RTC_WakeUpCmd
3365                     ; 508 			RTC_ITConfig(RTC_IT_WUT, ENABLE);			//vypnutí podsvícení se provede v rutinì interruptu
3367  0a29 4b01          	push	#1
3368  0a2b ae0040        	ldw	x,#64
3369  0a2e cd0000        	call	_RTC_ITConfig
3371  0a31 84            	pop	a
3372                     ; 509 			wut_vyp = 0;
3374  0a32 3f07          	clr	_wut_vyp
3376  0a34 2017          	jra	L5501
3377  0a36               L3501:
3378                     ; 510 		}else if(!wut_vyp){
3380  0a36 3d07          	tnz	_wut_vyp
3381  0a38 2613          	jrne	L5501
3382                     ; 511 			wut = 0;
3384  0a3a 3f01          	clr	_wut
3385                     ; 512 			wut_vyp = 1;
3387  0a3c 35010007      	mov	_wut_vyp,#1
3388                     ; 513 			RTC_ITConfig(RTC_IT_WUT, DISABLE);
3390  0a40 4b00          	push	#0
3391  0a42 ae0040        	ldw	x,#64
3392  0a45 cd0000        	call	_RTC_ITConfig
3394  0a48 84            	pop	a
3395                     ; 514 			RTC_WakeUpCmd(DISABLE);
3397  0a49 4f            	clr	a
3398  0a4a cd0000        	call	_RTC_WakeUpCmd
3400  0a4d               L5501:
3401                     ; 516 		vymaz = 0;
3403  0a4d 3f05          	clr	_vymaz
3404                     ; 517 		TIM5_Cmd(DISABLE);			//vypni èasovaè 5
3406  0a4f 4f            	clr	a
3407  0a50 cd0000        	call	_TIM5_Cmd
3409                     ; 518 		halt();			//zastav CPU
3412  0a53 8e            halt
3414                     ; 519 		TIM5_SetCounter(0);			//pokud dojde k interruptu probuï se a zaèni poèíta v èasovaèi 5 od 0
3417  0a54 5f            	clrw	x
3418  0a55 cd0000        	call	_TIM5_SetCounter
3420                     ; 520 		TIM5_Cmd(ENABLE);
3422  0a58 a601          	ld	a,#1
3423  0a5a cd0000        	call	_TIM5_Cmd
3425                     ; 521 	}
3428  0a5d 81            	ret
3670                     	xdef	_main
3671                     	xdef	_vyber
3672                     	switch	.ubsct
3673  0000               _vysledek:
3674  0000 000000000000  	ds.b	16
3675                     	xdef	_vysledek
3676                     	xdef	_celkovyvysledek
3677                     	xdef	_posun
3678  0010               _cislanaseg:
3679  0010 0000000000    	ds.b	5
3680                     	xdef	_cislanaseg
3681                     	xdef	_baterie
3682                     	xdef	_EEPROMcteni
3683                     	xdef	_EEPROMzapis
3684                     	xdef	_zobraz_na_LCD
3685                     	xdef	_cislanaLCD
3686                     	xdef	_spanek
3687                     	xdef	_ADC
3688                     	xdef	_zobraz_pomlcky
3689                     	xdef	_detekce_nabijeni
3690                     	xdef	_nastaveniCLK
3691                     	xdef	_nastaveniADC
3692                     	xdef	_nastaveniINTERRUPTU
3693                     	xdef	_nastaveniLCD
3694                     	xdef	_nastaveniGPIO
3695                     	xdef	_init_milis
3696  0015               _rekord:
3697  0015 00000000      	ds.b	4
3698                     	xdef	_rekord
3699                     	xdef	_kroky
3700  0019               _vzorek:
3701  0019 00000000      	ds.b	4
3702                     	xdef	_vzorek
3703                     	xdef	_minU
3704                     	xdef	_rozdil_max_min
3705  001d               _maxU:
3706  001d 0000          	ds.b	2
3707                     	xdef	_maxU
3708                     	xdef	_menu
3709                     	xdef	_zobrazeno2
3710                     	xdef	_zobrazeno1
3711                     	xdef	_zobrazeno0
3712                     	xdef	_wut_vyp
3713                     	xdef	_nab_pripojeno
3714                     	xdef	_vymaz
3715                     	xdef	_preteceni
3716                     	xdef	_dup
3717                     	xdef	_odp
3718                     	xdef	_wut
3719                     	xdef	_stav
3720                     	xdef	f_EXTI7_IRQHandler
3721                     	xdef	f_EXTI6_IRQHandler
3722                     	xdef	f_EXTI5_IRQHandler
3723                     	xdef	f_RTC_CSSLSE_IRQHandler
3724                     	xref	_TIM5_Cmd
3725                     	xref	_TIM5_GetCounter
3726                     	xref	_TIM5_SetCounter
3727                     	xref	_TIM5_TimeBaseInit
3728                     	xref	_TIM5_DeInit
3729                     	xref	_RTC_ClearITPendingBit
3730                     	xref	_RTC_ITConfig
3731                     	xref	_RTC_WakeUpCmd
3732                     	xref	_RTC_SetWakeUpCounter
3733                     	xref	_RTC_WakeUpClockConfig
3734                     	xref	_LCD_ClearFlag
3735                     	xref	_LCD_GetFlagStatus
3736                     	xref	_LCD_WriteRAM
3737                     	xref	_LCD_ContrastConfig
3738                     	xref	_LCD_Cmd
3739                     	xref	_LCD_PortMaskConfig
3740                     	xref	_LCD_Init
3741                     	xref	_ITC_SetSoftwarePriority
3742                     	xref	_GPIO_ReadOutputDataBit
3743                     	xref	_GPIO_ReadInputDataBit
3744                     	xref	_GPIO_ToggleBits
3745                     	xref	_GPIO_WriteBit
3746                     	xref	_GPIO_Init
3747                     	xref	_GPIO_DeInit
3748                     	xref	_FLASH_GetFlagStatus
3749                     	xref	_FLASH_ReadByte
3750                     	xref	_FLASH_ProgramWord
3751                     	xref	_FLASH_ProgramByte
3752                     	xref	_FLASH_Lock
3753                     	xref	_FLASH_Unlock
3754                     	xref	_EXTI_ClearITPendingBit
3755                     	xref	_EXTI_SetPinSensitivity
3756                     	xref	_EXTI_DeInit
3757                     	xref	_CLK_GetFlagStatus
3758                     	xref	_CLK_HaltConfig
3759                     	xref	_CLK_PeripheralClockConfig
3760                     	xref	_CLK_RTCClockConfig
3761                     	xref	_CLK_SYSCLKSourceSwitchCmd
3762                     	xref	_CLK_SYSCLKDivConfig
3763                     	xref	_CLK_SYSCLKSourceConfig
3764                     	xref	_CLK_LSICmd
3765                     	xref	_CLK_HSICmd
3766                     	xref	_CLK_DeInit
3767                     	xref	_ADC_ClearFlag
3768                     	xref	_ADC_GetFlagStatus
3769                     	xref	_ADC_GetConversionValue
3770                     	xref	_ADC_SchmittTriggerConfig
3771                     	xref	_ADC_SamplingTimeConfig
3772                     	xref	_ADC_ChannelCmd
3773                     	xref	_ADC_SoftwareStartConv
3774                     	xref	_ADC_Cmd
3775                     	xref	_ADC_Init
3776                     	xref	_ADC_DeInit
3777                     	xref.b	c_lreg
3778                     	xref.b	c_x
3779                     	xref.b	c_y
3799                     	xref	c_ldiv
3800                     	xref	c_smul
3801                     	xref	c_lzmp
3802                     	xref	c_lgsub
3803                     	xref	c_lgor
3804                     	xref	c_itolx
3805                     	xref	c_xymvx
3806                     	xref	c_lumd
3807                     	xref	c_ludv
3808                     	xref	c_uitolx
3809                     	xref	c_ltor
3810                     	xref	c_lgadc
3811                     	xref	c_rtol
3812                     	xref	c_lcmp
3813                     	xref	c_lrzmp
3814                     	end
