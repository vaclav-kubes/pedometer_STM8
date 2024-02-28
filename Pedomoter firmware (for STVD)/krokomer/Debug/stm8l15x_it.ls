   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  44                     ; 52 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  44                     ; 53 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 57 }
  53  0000 80            	iret
  75                     ; 67 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 68 {
  76                     	switch	.text
  77  0001               f_TRAP_IRQHandler:
  81                     ; 72 }
  84  0001 80            	iret
 106                     ; 78 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 106                     ; 79 {
 107                     	switch	.text
 108  0002               f_FLASH_IRQHandler:
 112                     ; 83 }
 115  0002 80            	iret
 138                     ; 89 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 138                     ; 90 {
 139                     	switch	.text
 140  0003               f_DMA1_CHANNEL0_1_IRQHandler:
 144                     ; 94 }
 147  0003 80            	iret
 170                     ; 100 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 170                     ; 101 {
 171                     	switch	.text
 172  0004               f_DMA1_CHANNEL2_3_IRQHandler:
 176                     ; 105 }
 179  0004 80            	iret
 202                     ; 122 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 202                     ; 123 {
 203                     	switch	.text
 204  0005               f_EXTIE_F_PVD_IRQHandler:
 208                     ; 127 }
 211  0005 80            	iret
 233                     ; 134 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 233                     ; 135 {
 234                     	switch	.text
 235  0006               f_EXTIB_G_IRQHandler:
 239                     ; 139 }
 242  0006 80            	iret
 264                     ; 146 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 264                     ; 147 {
 265                     	switch	.text
 266  0007               f_EXTID_H_IRQHandler:
 270                     ; 151 }
 273  0007 80            	iret
 295                     ; 158 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 295                     ; 159 {
 296                     	switch	.text
 297  0008               f_EXTI0_IRQHandler:
 301                     ; 163 }
 304  0008 80            	iret
 326                     ; 170 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 326                     ; 171 {
 327                     	switch	.text
 328  0009               f_EXTI1_IRQHandler:
 332                     ; 175 }
 335  0009 80            	iret
 357                     ; 182 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 357                     ; 183 {
 358                     	switch	.text
 359  000a               f_EXTI2_IRQHandler:
 363                     ; 187 }
 366  000a 80            	iret
 388                     ; 194 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 388                     ; 195 {
 389                     	switch	.text
 390  000b               f_EXTI3_IRQHandler:
 394                     ; 199 }
 397  000b 80            	iret
 419                     ; 206 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 419                     ; 207 {
 420                     	switch	.text
 421  000c               f_EXTI4_IRQHandler:
 425                     ; 211 }
 428  000c 80            	iret
 450                     ; 253 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 450                     ; 254 {
 451                     	switch	.text
 452  000d               f_LCD_AES_IRQHandler:
 456                     ; 258 }
 459  000d 80            	iret
 482                     ; 264 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 482                     ; 265 {
 483                     	switch	.text
 484  000e               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 488                     ; 269 }
 491  000e 80            	iret
 514                     ; 276 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 514                     ; 277 {
 515                     	switch	.text
 516  000f               f_ADC1_COMP_IRQHandler:
 520                     ; 281 }
 523  000f 80            	iret
 547                     ; 288 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 547                     ; 289 {
 548                     	switch	.text
 549  0010               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 553                     ; 293 }
 556  0010 80            	iret
 579                     ; 300 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 579                     ; 301 {
 580                     	switch	.text
 581  0011               f_TIM2_CC_USART2_RX_IRQHandler:
 585                     ; 305 }
 588  0011 80            	iret
 612                     ; 313 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 612                     ; 314 {
 613                     	switch	.text
 614  0012               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 618                     ; 318 }
 621  0012 80            	iret
 644                     ; 324 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 644                     ; 325 {
 645                     	switch	.text
 646  0013               f_TIM3_CC_USART3_RX_IRQHandler:
 650                     ; 329 }
 653  0013 80            	iret
 676                     ; 335 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 676                     ; 336 {
 677                     	switch	.text
 678  0014               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 682                     ; 340 }
 685  0014 80            	iret
 707                     ; 346 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 707                     ; 347 {
 708                     	switch	.text
 709  0015               f_TIM1_CC_IRQHandler:
 713                     ; 351 }
 716  0015 80            	iret
 739                     ; 358 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 739                     ; 359 {
 740                     	switch	.text
 741  0016               f_TIM4_UPD_OVF_TRG_IRQHandler:
 745                     ; 364 }
 748  0016 80            	iret
 770                     ; 370 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 770                     ; 371 {
 771                     	switch	.text
 772  0017               f_SPI1_IRQHandler:
 776                     ; 375 }
 779  0017 80            	iret
 803                     ; 382 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 803                     ; 383 {
 804                     	switch	.text
 805  0018               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 809                     ; 387 }
 812  0018 80            	iret
 835                     ; 394 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
 835                     ; 395 {
 836                     	switch	.text
 837  0019               f_USART1_RX_TIM5_CC_IRQHandler:
 841                     ; 399 }
 844  0019 80            	iret
 867                     ; 406 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
 867                     ; 407 {
 868                     	switch	.text
 869  001a               f_I2C1_SPI2_IRQHandler:
 873                     ; 411 }
 876  001a 80            	iret
 888                     	xdef	f_I2C1_SPI2_IRQHandler
 889                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
 890                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 891                     	xdef	f_SPI1_IRQHandler
 892                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
 893                     	xdef	f_TIM1_CC_IRQHandler
 894                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 895                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
 896                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 897                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
 898                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 899                     	xdef	f_ADC1_COMP_IRQHandler
 900                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
 901                     	xdef	f_LCD_AES_IRQHandler
 902                     	xdef	f_EXTI4_IRQHandler
 903                     	xdef	f_EXTI3_IRQHandler
 904                     	xdef	f_EXTI2_IRQHandler
 905                     	xdef	f_EXTI1_IRQHandler
 906                     	xdef	f_EXTI0_IRQHandler
 907                     	xdef	f_EXTID_H_IRQHandler
 908                     	xdef	f_EXTIB_G_IRQHandler
 909                     	xdef	f_EXTIE_F_PVD_IRQHandler
 910                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
 911                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
 912                     	xdef	f_FLASH_IRQHandler
 913                     	xdef	f_TRAP_IRQHandler
 914                     	xdef	f_NonHandledInterrupt
 933                     	end
