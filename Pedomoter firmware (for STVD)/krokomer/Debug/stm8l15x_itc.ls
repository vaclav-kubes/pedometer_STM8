   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  43                     ; 56 uint8_t ITC_GetCPUCC(void)
  43                     ; 57 {
  45                     	switch	.text
  46  0000               _ITC_GetCPUCC:
  50                     ; 59   _asm("push cc");
  53  0000 8a            push cc
  55                     ; 60   _asm("pop a");
  58  0001 84            pop a
  60                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  63  0002 81            	ret
  86                     ; 87 void ITC_DeInit(void)
  86                     ; 88 {
  87                     	switch	.text
  88  0003               _ITC_DeInit:
  92                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  94  0003 35ff7f70      	mov	32624,#255
  95                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  97  0007 35ff7f71      	mov	32625,#255
  98                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 100  000b 35ff7f72      	mov	32626,#255
 101                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 103  000f 35ff7f73      	mov	32627,#255
 104                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 106  0013 35ff7f74      	mov	32628,#255
 107                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 109  0017 35ff7f75      	mov	32629,#255
 110                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 112  001b 35ff7f76      	mov	32630,#255
 113                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 115  001f 35ff7f77      	mov	32631,#255
 116                     ; 97 }
 119  0023 81            	ret
 144                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 144                     ; 105 {
 145                     	switch	.text
 146  0024               _ITC_GetSoftIntStatus:
 150                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 152  0024 adda          	call	_ITC_GetCPUCC
 154  0026 a428          	and	a,#40
 157  0028 81            	ret
 466                     .const:	section	.text
 467  0000               L22:
 468  0000 004d          	dc.w	L14
 469  0002 004d          	dc.w	L14
 470  0004 004d          	dc.w	L14
 471  0006 0056          	dc.w	L34
 472  0008 0056          	dc.w	L34
 473  000a 0056          	dc.w	L34
 474  000c 0056          	dc.w	L34
 475  000e 005f          	dc.w	L54
 476  0010 005f          	dc.w	L54
 477  0012 005f          	dc.w	L54
 478  0014 005f          	dc.w	L54
 479  0016 0068          	dc.w	L74
 480  0018 0068          	dc.w	L74
 481  001a 0068          	dc.w	L74
 482  001c 0068          	dc.w	L74
 483  001e 0071          	dc.w	L15
 484  0020 0071          	dc.w	L15
 485  0022 0071          	dc.w	L15
 486  0024 0071          	dc.w	L15
 487  0026 007a          	dc.w	L35
 488  0028 007a          	dc.w	L35
 489  002a 007a          	dc.w	L35
 490  002c 007a          	dc.w	L35
 491  002e 0083          	dc.w	L55
 492  0030 0083          	dc.w	L55
 493  0032 0083          	dc.w	L55
 494  0034 0083          	dc.w	L55
 495  0036 008c          	dc.w	L75
 496  0038 008c          	dc.w	L75
 497                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 497                     ; 115 {
 498                     	switch	.text
 499  0029               _ITC_GetSoftwarePriority:
 501  0029 88            	push	a
 502  002a 89            	pushw	x
 503       00000002      OFST:	set	2
 506                     ; 116   uint8_t Value = 0;
 508  002b 0f02          	clr	(OFST+0,sp)
 510                     ; 117   uint8_t Mask = 0;
 512                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 514                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 516  002d a403          	and	a,#3
 517  002f 48            	sll	a
 518  0030 5f            	clrw	x
 519  0031 97            	ld	xl,a
 520  0032 a603          	ld	a,#3
 521  0034 5d            	tnzw	x
 522  0035 2704          	jreq	L41
 523  0037               L61:
 524  0037 48            	sll	a
 525  0038 5a            	decw	x
 526  0039 26fc          	jrne	L61
 527  003b               L41:
 528  003b 6b01          	ld	(OFST-1,sp),a
 530                     ; 125   switch (IRQn)
 532  003d 7b03          	ld	a,(OFST+1,sp)
 534                     ; 223     default:
 534                     ; 224       break;
 535  003f 4a            	dec	a
 536  0040 a11d          	cp	a,#29
 537  0042 2407          	jruge	L02
 538  0044 5f            	clrw	x
 539  0045 97            	ld	xl,a
 540  0046 58            	sllw	x
 541  0047 de0000        	ldw	x,(L22,x)
 542  004a fc            	jp	(x)
 543  004b               L02:
 544  004b 2046          	jra	L522
 545  004d               L14:
 546                     ; 127     case FLASH_IRQn:
 546                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 546                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 546                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 548  004d c67f70        	ld	a,32624
 549  0050 1401          	and	a,(OFST-1,sp)
 550  0052 6b02          	ld	(OFST+0,sp),a
 552                     ; 131       break;
 554  0054 203d          	jra	L522
 555  0056               L34:
 556                     ; 133     case EXTIE_F_PVD_IRQn:
 556                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 556                     ; 135     case RTC_IRQn:
 556                     ; 136     case EXTIB_IRQn:
 556                     ; 137     case EXTID_IRQn:
 556                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 556                     ; 139     case RTC_CSSLSE_IRQn:
 556                     ; 140     case EXTIB_IRQn:
 556                     ; 141     case EXTID_IRQn:
 556                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 556                     ; 143     case RTC_CSSLSE_IRQn:
 556                     ; 144     case EXTIB_G_IRQn:
 556                     ; 145     case EXTID_H_IRQn:
 556                     ; 146 #endif  /* STM8L15X_MD */
 556                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 558  0056 c67f71        	ld	a,32625
 559  0059 1401          	and	a,(OFST-1,sp)
 560  005b 6b02          	ld	(OFST+0,sp),a
 562                     ; 148       break;
 564  005d 2034          	jra	L522
 565  005f               L54:
 566                     ; 150     case EXTI0_IRQn:
 566                     ; 151     case EXTI1_IRQn:
 566                     ; 152     case EXTI2_IRQn:
 566                     ; 153     case EXTI3_IRQn:
 566                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 568  005f c67f72        	ld	a,32626
 569  0062 1401          	and	a,(OFST-1,sp)
 570  0064 6b02          	ld	(OFST+0,sp),a
 572                     ; 155       break;
 574  0066 202b          	jra	L522
 575  0068               L74:
 576                     ; 157     case EXTI4_IRQn:
 576                     ; 158     case EXTI5_IRQn:
 576                     ; 159     case EXTI6_IRQn:
 576                     ; 160     case EXTI7_IRQn:
 576                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 578  0068 c67f73        	ld	a,32627
 579  006b 1401          	and	a,(OFST-1,sp)
 580  006d 6b02          	ld	(OFST+0,sp),a
 582                     ; 162       break;
 584  006f 2022          	jra	L522
 585  0071               L15:
 586                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 586                     ; 168 #endif /* STM8L15X_LD */		
 586                     ; 169     case ADC1_COMP_IRQn:
 586                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 586                     ; 171     case LCD_IRQn:
 586                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 586                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 586                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 586                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 586                     ; 176     case LCD_AES_IRQn:
 586                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 586                     ; 178 #endif  /* STM8L15X_MD */
 586                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 588  0071 c67f74        	ld	a,32628
 589  0074 1401          	and	a,(OFST-1,sp)
 590  0076 6b02          	ld	(OFST+0,sp),a
 592                     ; 180       break;
 594  0078 2019          	jra	L522
 595  007a               L35:
 596                     ; 183     case TIM1_UPD_OVF_TRG_IRQn:
 596                     ; 184 #endif /* STM8L15X_LD */		
 596                     ; 185 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 596                     ; 186  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 596                     ; 187     case TIM2_CC_IRQn:
 596                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 596                     ; 189     case TIM3_CC_IRQn:
 596                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 596                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 596                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 596                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 596                     ; 194 #endif  /* STM8L15X_MD */
 596                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 598  007a c67f75        	ld	a,32629
 599  007d 1401          	and	a,(OFST-1,sp)
 600  007f 6b02          	ld	(OFST+0,sp),a
 602                     ; 196       break;
 604  0081 2010          	jra	L522
 605  0083               L55:
 606                     ; 199     case TIM1_CC_IRQn:
 606                     ; 200 #endif /* STM8L15X_LD */	
 606                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 606                     ; 202     case SPI1_IRQn:
 606                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 606                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 606                     ; 205     case USART1_TX_IRQn:
 606                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 606                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 606                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 606                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 608  0083 c67f76        	ld	a,32630
 609  0086 1401          	and	a,(OFST-1,sp)
 610  0088 6b02          	ld	(OFST+0,sp),a
 612                     ; 210       break;
 614  008a 2007          	jra	L522
 615  008c               L75:
 616                     ; 214     case USART1_RX_IRQn:
 616                     ; 215     case I2C1_IRQn:
 616                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 616                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 616                     ; 218     case I2C1_SPI2_IRQn:
 616                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 616                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 618  008c c67f77        	ld	a,32631
 619  008f 1401          	and	a,(OFST-1,sp)
 620  0091 6b02          	ld	(OFST+0,sp),a
 622                     ; 221       break;
 624  0093               L16:
 625                     ; 223     default:
 625                     ; 224       break;
 627  0093               L522:
 628                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 630  0093 7b03          	ld	a,(OFST+1,sp)
 631  0095 a403          	and	a,#3
 632  0097 48            	sll	a
 633  0098 5f            	clrw	x
 634  0099 97            	ld	xl,a
 635  009a 7b02          	ld	a,(OFST+0,sp)
 636  009c 5d            	tnzw	x
 637  009d 2704          	jreq	L42
 638  009f               L62:
 639  009f 44            	srl	a
 640  00a0 5a            	decw	x
 641  00a1 26fc          	jrne	L62
 642  00a3               L42:
 643  00a3 6b02          	ld	(OFST+0,sp),a
 645                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 647  00a5 7b02          	ld	a,(OFST+0,sp)
 650  00a7 5b03          	addw	sp,#3
 651  00a9 81            	ret
 715                     	switch	.const
 716  003a               L44:
 717  003a 00e2          	dc.w	L722
 718  003c 00e2          	dc.w	L722
 719  003e 00e2          	dc.w	L722
 720  0040 00f4          	dc.w	L132
 721  0042 00f4          	dc.w	L132
 722  0044 00f4          	dc.w	L132
 723  0046 00f4          	dc.w	L132
 724  0048 0106          	dc.w	L332
 725  004a 0106          	dc.w	L332
 726  004c 0106          	dc.w	L332
 727  004e 0106          	dc.w	L332
 728  0050 0118          	dc.w	L532
 729  0052 0118          	dc.w	L532
 730  0054 0118          	dc.w	L532
 731  0056 0118          	dc.w	L532
 732  0058 012a          	dc.w	L732
 733  005a 012a          	dc.w	L732
 734  005c 012a          	dc.w	L732
 735  005e 012a          	dc.w	L732
 736  0060 013c          	dc.w	L142
 737  0062 013c          	dc.w	L142
 738  0064 013c          	dc.w	L142
 739  0066 013c          	dc.w	L142
 740  0068 014e          	dc.w	L342
 741  006a 014e          	dc.w	L342
 742  006c 014e          	dc.w	L342
 743  006e 014e          	dc.w	L342
 744  0070 0160          	dc.w	L542
 745  0072 0160          	dc.w	L542
 746                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 746                     ; 251 {
 747                     	switch	.text
 748  00aa               _ITC_SetSoftwarePriority:
 750  00aa 89            	pushw	x
 751  00ab 89            	pushw	x
 752       00000002      OFST:	set	2
 755                     ; 252   uint8_t Mask = 0;
 757                     ; 253   uint8_t NewPriority = 0;
 759                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 761                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 763                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 765                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 767  00ac 9e            	ld	a,xh
 768  00ad a403          	and	a,#3
 769  00af 48            	sll	a
 770  00b0 5f            	clrw	x
 771  00b1 97            	ld	xl,a
 772  00b2 a603          	ld	a,#3
 773  00b4 5d            	tnzw	x
 774  00b5 2704          	jreq	L23
 775  00b7               L43:
 776  00b7 48            	sll	a
 777  00b8 5a            	decw	x
 778  00b9 26fc          	jrne	L43
 779  00bb               L23:
 780  00bb 43            	cpl	a
 781  00bc 6b01          	ld	(OFST-1,sp),a
 783                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 785  00be 7b03          	ld	a,(OFST+1,sp)
 786  00c0 a403          	and	a,#3
 787  00c2 48            	sll	a
 788  00c3 5f            	clrw	x
 789  00c4 97            	ld	xl,a
 790  00c5 7b04          	ld	a,(OFST+2,sp)
 791  00c7 5d            	tnzw	x
 792  00c8 2704          	jreq	L63
 793  00ca               L04:
 794  00ca 48            	sll	a
 795  00cb 5a            	decw	x
 796  00cc 26fc          	jrne	L04
 797  00ce               L63:
 798  00ce 6b02          	ld	(OFST+0,sp),a
 800                     ; 268   switch (IRQn)
 802  00d0 7b03          	ld	a,(OFST+1,sp)
 804                     ; 372     default:
 804                     ; 373       break;
 805  00d2 4a            	dec	a
 806  00d3 a11d          	cp	a,#29
 807  00d5 2407          	jruge	L24
 808  00d7 5f            	clrw	x
 809  00d8 97            	ld	xl,a
 810  00d9 58            	sllw	x
 811  00da de003a        	ldw	x,(L44,x)
 812  00dd fc            	jp	(x)
 813  00de               L24:
 814  00de ac700170      	jpf	L503
 815  00e2               L722:
 816                     ; 270     case FLASH_IRQn:
 816                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 816                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 816                     ; 273       ITC->ISPR1 &= Mask;
 818  00e2 c67f70        	ld	a,32624
 819  00e5 1401          	and	a,(OFST-1,sp)
 820  00e7 c77f70        	ld	32624,a
 821                     ; 274       ITC->ISPR1 |= NewPriority;
 823  00ea c67f70        	ld	a,32624
 824  00ed 1a02          	or	a,(OFST+0,sp)
 825  00ef c77f70        	ld	32624,a
 826                     ; 275       break;
 828  00f2 207c          	jra	L503
 829  00f4               L132:
 830                     ; 277     case EXTIE_F_PVD_IRQn:
 830                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 830                     ; 279     case RTC_IRQn:
 830                     ; 280     case EXTIB_IRQn:
 830                     ; 281     case EXTID_IRQn:
 830                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 830                     ; 283     case RTC_CSSLSE_IRQn:
 830                     ; 284     case EXTIB_IRQn:
 830                     ; 285     case EXTID_IRQn:
 830                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 830                     ; 287     case RTC_CSSLSE_IRQn:
 830                     ; 288     case EXTIB_G_IRQn:
 830                     ; 289     case EXTID_H_IRQn:
 830                     ; 290 #endif  /* STM8L15X_MD */
 830                     ; 291       ITC->ISPR2 &= Mask;
 832  00f4 c67f71        	ld	a,32625
 833  00f7 1401          	and	a,(OFST-1,sp)
 834  00f9 c77f71        	ld	32625,a
 835                     ; 292       ITC->ISPR2 |= NewPriority;
 837  00fc c67f71        	ld	a,32625
 838  00ff 1a02          	or	a,(OFST+0,sp)
 839  0101 c77f71        	ld	32625,a
 840                     ; 293       break;
 842  0104 206a          	jra	L503
 843  0106               L332:
 844                     ; 295     case EXTI0_IRQn:
 844                     ; 296     case EXTI1_IRQn:
 844                     ; 297     case EXTI2_IRQn:
 844                     ; 298     case EXTI3_IRQn:
 844                     ; 299       ITC->ISPR3 &= Mask;
 846  0106 c67f72        	ld	a,32626
 847  0109 1401          	and	a,(OFST-1,sp)
 848  010b c77f72        	ld	32626,a
 849                     ; 300       ITC->ISPR3 |= NewPriority;
 851  010e c67f72        	ld	a,32626
 852  0111 1a02          	or	a,(OFST+0,sp)
 853  0113 c77f72        	ld	32626,a
 854                     ; 301       break;
 856  0116 2058          	jra	L503
 857  0118               L532:
 858                     ; 303     case EXTI4_IRQn:
 858                     ; 304     case EXTI5_IRQn:
 858                     ; 305     case EXTI6_IRQn:
 858                     ; 306     case EXTI7_IRQn:
 858                     ; 307       ITC->ISPR4 &= Mask;
 860  0118 c67f73        	ld	a,32627
 861  011b 1401          	and	a,(OFST-1,sp)
 862  011d c77f73        	ld	32627,a
 863                     ; 308       ITC->ISPR4 |= NewPriority;
 865  0120 c67f73        	ld	a,32627
 866  0123 1a02          	or	a,(OFST+0,sp)
 867  0125 c77f73        	ld	32627,a
 868                     ; 309       break;
 870  0128 2046          	jra	L503
 871  012a               L732:
 872                     ; 311     case SWITCH_CSS_BREAK_DAC_IRQn:
 872                     ; 312 #else
 872                     ; 313     case SWITCH_CSS_IRQn:
 872                     ; 314 #endif /*	STM8L15X_LD	*/
 872                     ; 315     case ADC1_COMP_IRQn:
 872                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 872                     ; 317     case LCD_IRQn:
 872                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 872                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 872                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 872                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 872                     ; 322     case LCD_AES_IRQn:
 872                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 872                     ; 324 #endif  /* STM8L15X_MD */
 872                     ; 325       ITC->ISPR5 &= Mask;
 874  012a c67f74        	ld	a,32628
 875  012d 1401          	and	a,(OFST-1,sp)
 876  012f c77f74        	ld	32628,a
 877                     ; 326       ITC->ISPR5 |= NewPriority;
 879  0132 c67f74        	ld	a,32628
 880  0135 1a02          	or	a,(OFST+0,sp)
 881  0137 c77f74        	ld	32628,a
 882                     ; 327       break;
 884  013a 2034          	jra	L503
 885  013c               L142:
 886                     ; 329     case TIM1_UPD_OVF_TRG_IRQn:
 886                     ; 330 #endif  /* STM8L15X_LD */
 886                     ; 331 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 886                     ; 332  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 886                     ; 333     case TIM2_CC_IRQn:
 886                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 886                     ; 335     case TIM3_CC_IRQn:
 886                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 886                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 886                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 886                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 886                     ; 340 #endif  /* STM8L15X_MD */
 886                     ; 341       ITC->ISPR6 &= Mask;
 888  013c c67f75        	ld	a,32629
 889  013f 1401          	and	a,(OFST-1,sp)
 890  0141 c77f75        	ld	32629,a
 891                     ; 342       ITC->ISPR6 |= NewPriority;
 893  0144 c67f75        	ld	a,32629
 894  0147 1a02          	or	a,(OFST+0,sp)
 895  0149 c77f75        	ld	32629,a
 896                     ; 343       break;
 898  014c 2022          	jra	L503
 899  014e               L342:
 900                     ; 346     case TIM1_CC_IRQn:
 900                     ; 347 #endif  /* STM8L15X_LD */
 900                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 900                     ; 349     case SPI1_IRQn:
 900                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 900                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 900                     ; 352     case USART1_TX_IRQn:
 900                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 900                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 900                     ; 355 #endif  /* STM8L15X_MD */
 900                     ; 356       ITC->ISPR7 &= Mask;
 902  014e c67f76        	ld	a,32630
 903  0151 1401          	and	a,(OFST-1,sp)
 904  0153 c77f76        	ld	32630,a
 905                     ; 357       ITC->ISPR7 |= NewPriority;
 907  0156 c67f76        	ld	a,32630
 908  0159 1a02          	or	a,(OFST+0,sp)
 909  015b c77f76        	ld	32630,a
 910                     ; 358       break;
 912  015e 2010          	jra	L503
 913  0160               L542:
 914                     ; 362     case USART1_RX_IRQn:
 914                     ; 363     case I2C1_IRQn:
 914                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 914                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 914                     ; 366     case I2C1_SPI2_IRQn:
 914                     ; 367 #endif  /* STM8L15X_MD */
 914                     ; 368       ITC->ISPR8 &= Mask;
 916  0160 c67f77        	ld	a,32631
 917  0163 1401          	and	a,(OFST-1,sp)
 918  0165 c77f77        	ld	32631,a
 919                     ; 369       ITC->ISPR8 |= NewPriority;
 921  0168 c67f77        	ld	a,32631
 922  016b 1a02          	or	a,(OFST+0,sp)
 923  016d c77f77        	ld	32631,a
 924                     ; 370       break;
 926  0170               L742:
 927                     ; 372     default:
 927                     ; 373       break;
 929  0170               L503:
 930                     ; 375 }
 933  0170 5b04          	addw	sp,#4
 934  0172 81            	ret
 947                     	xdef	_ITC_GetSoftwarePriority
 948                     	xdef	_ITC_SetSoftwarePriority
 949                     	xdef	_ITC_GetSoftIntStatus
 950                     	xdef	_ITC_GetCPUCC
 951                     	xdef	_ITC_DeInit
 970                     	end
