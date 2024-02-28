   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  78                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  78                     ; 175 {
  80                     	switch	.text
  81  0000               _FLASH_SetProgrammingTime:
  85                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  87                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  89  0000 72115050      	bres	20560,#0
  90                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  92  0004 ca5050        	or	a,20560
  93  0007 c75050        	ld	20560,a
  94                     ; 181 }
  97  000a 81            	ret
 122                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 122                     ; 189 {
 123                     	switch	.text
 124  000b               _FLASH_GetProgrammingTime:
 128                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 130  000b c65050        	ld	a,20560
 131  000e a401          	and	a,#1
 134  0010 81            	ret
 190                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 190                     ; 204 {
 191                     	switch	.text
 192  0011               _FLASH_PowerWaitModeConfig:
 196                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 198                     ; 209   if(FLASH_Power != FLASH_Power_On)
 200  0011 a101          	cp	a,#1
 201  0013 2706          	jreq	L57
 202                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 204  0015 72145050      	bset	20560,#2
 206  0019 2004          	jra	L77
 207  001b               L57:
 208                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 210  001b 72155050      	bres	20560,#2
 211  001f               L77:
 212                     ; 218 }
 215  001f 81            	ret
 238                     ; 259 void FLASH_DeInit(void)
 238                     ; 260 {
 239                     	switch	.text
 240  0020               _FLASH_DeInit:
 244                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 246  0020 725f5050      	clr	20560
 247                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 249  0024 725f5051      	clr	20561
 250                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 252  0028 35405054      	mov	20564,#64
 253                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 255  002c c65054        	ld	a,20564
 256                     ; 265 }
 259  002f 81            	ret
 315                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 315                     ; 276 {
 316                     	switch	.text
 317  0030               _FLASH_Unlock:
 319  0030 88            	push	a
 320       00000000      OFST:	set	0
 323                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 325                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 327  0031 a1fd          	cp	a,#253
 328  0033 2608          	jrne	L731
 329                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 331  0035 35565052      	mov	20562,#86
 332                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 334  0039 35ae5052      	mov	20562,#174
 335  003d               L731:
 336                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 338  003d 7b01          	ld	a,(OFST+1,sp)
 339  003f a1f7          	cp	a,#247
 340  0041 2608          	jrne	L141
 341                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 343  0043 35ae5053      	mov	20563,#174
 344                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 346  0047 35565053      	mov	20563,#86
 347  004b               L141:
 348                     ; 293 }
 351  004b 84            	pop	a
 352  004c 81            	ret
 387                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 387                     ; 304 {
 388                     	switch	.text
 389  004d               _FLASH_Lock:
 393                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 395                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 397  004d c45054        	and	a,20564
 398  0050 c75054        	ld	20564,a
 399                     ; 310 }
 402  0053 81            	ret
 445                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 445                     ; 319 {
 446                     	switch	.text
 447  0054               _FLASH_ProgramByte:
 449       00000000      OFST:	set	0
 452                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 454                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 456  0054 7b07          	ld	a,(OFST+7,sp)
 457  0056 1e05          	ldw	x,(OFST+5,sp)
 458  0058 f7            	ld	(x),a
 459                     ; 324 }
 462  0059 81            	ret
 496                     ; 331 void FLASH_EraseByte(uint32_t Address)
 496                     ; 332 {
 497                     	switch	.text
 498  005a               _FLASH_EraseByte:
 500       00000000      OFST:	set	0
 503                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 505                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 507  005a 1e05          	ldw	x,(OFST+5,sp)
 508  005c 7f            	clr	(x)
 509                     ; 337 }
 512  005d 81            	ret
 555                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 555                     ; 346 {
 556                     	switch	.text
 557  005e               _FLASH_ProgramWord:
 559       00000000      OFST:	set	0
 562                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 564                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 566  005e 721c5051      	bset	20561,#6
 567                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 569  0062 7b07          	ld	a,(OFST+7,sp)
 570  0064 1e05          	ldw	x,(OFST+5,sp)
 571  0066 f7            	ld	(x),a
 572                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 574  0067 7b08          	ld	a,(OFST+8,sp)
 575  0069 1e05          	ldw	x,(OFST+5,sp)
 576  006b e701          	ld	(1,x),a
 577                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 579  006d 7b09          	ld	a,(OFST+9,sp)
 580  006f 1e05          	ldw	x,(OFST+5,sp)
 581  0071 e702          	ld	(2,x),a
 582                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 584  0073 7b0a          	ld	a,(OFST+10,sp)
 585  0075 1e05          	ldw	x,(OFST+5,sp)
 586  0077 e703          	ld	(3,x),a
 587                     ; 360 }
 590  0079 81            	ret
 624                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 624                     ; 368 {
 625                     	switch	.text
 626  007a               _FLASH_ReadByte:
 628       00000000      OFST:	set	0
 631                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 633  007a 1e05          	ldw	x,(OFST+5,sp)
 634  007c f6            	ld	a,(x)
 637  007d 81            	ret
 682                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 682                     ; 418 {
 683                     	switch	.text
 684  007e               _FLASH_ProgramOptionByte:
 686  007e 89            	pushw	x
 687       00000000      OFST:	set	0
 690                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 692                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 694  007f 721e5051      	bset	20561,#7
 695                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 697  0083 7b05          	ld	a,(OFST+5,sp)
 698  0085 1e01          	ldw	x,(OFST+1,sp)
 699  0087 f7            	ld	(x),a
 700                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 702  0088 a6fd          	ld	a,#253
 703  008a cd01cb        	call	_FLASH_WaitForLastOperation
 705                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 707  008d 721f5051      	bres	20561,#7
 708                     ; 432 }
 711  0091 85            	popw	x
 712  0092 81            	ret
 748                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 748                     ; 440 {
 749                     	switch	.text
 750  0093               _FLASH_EraseOptionByte:
 754                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 756                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 758  0093 721e5051      	bset	20561,#7
 759                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 761  0097 7f            	clr	(x)
 762                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 764  0098 a6fd          	ld	a,#253
 765  009a cd01cb        	call	_FLASH_WaitForLastOperation
 767                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 769  009d 721f5051      	bres	20561,#7
 770                     ; 454 }
 773  00a1 81            	ret
 830                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 830                     ; 463 {
 831                     	switch	.text
 832  00a2               _FLASH_GetReadOutProtectionStatus:
 834  00a2 88            	push	a
 835       00000001      OFST:	set	1
 838                     ; 464   FunctionalState state = DISABLE;
 840                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 842  00a3 c64800        	ld	a,18432
 843  00a6 a1aa          	cp	a,#170
 844  00a8 2606          	jrne	L743
 845                     ; 469     state =  ENABLE;
 847  00aa a601          	ld	a,#1
 848  00ac 6b01          	ld	(OFST+0,sp),a
 851  00ae 2002          	jra	L153
 852  00b0               L743:
 853                     ; 474     state =  DISABLE;
 855  00b0 0f01          	clr	(OFST+0,sp)
 857  00b2               L153:
 858                     ; 477   return state;
 860  00b2 7b01          	ld	a,(OFST+0,sp)
 863  00b4 5b01          	addw	sp,#1
 864  00b6 81            	ret
 898                     ; 485 uint16_t FLASH_GetBootSize(void)
 898                     ; 486 {
 899                     	switch	.text
 900  00b7               _FLASH_GetBootSize:
 902  00b7 89            	pushw	x
 903       00000002      OFST:	set	2
 906                     ; 487   uint16_t temp = 0;
 908                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 910  00b8 c64802        	ld	a,18434
 911  00bb 5f            	clrw	x
 912  00bc 97            	ld	xl,a
 913  00bd 4f            	clr	a
 914  00be 02            	rlwa	x,a
 915  00bf 44            	srl	a
 916  00c0 56            	rrcw	x
 917  00c1 1f01          	ldw	(OFST-1,sp),x
 919                     ; 493   if(OPT->UBC > 0x7F)
 921  00c3 c64802        	ld	a,18434
 922  00c6 a180          	cp	a,#128
 923  00c8 2505          	jrult	L173
 924                     ; 495     temp = 8192;
 926  00ca ae2000        	ldw	x,#8192
 927  00cd 1f01          	ldw	(OFST-1,sp),x
 929  00cf               L173:
 930                     ; 499   return(temp);
 932  00cf 1e01          	ldw	x,(OFST-1,sp)
 935  00d1 5b02          	addw	sp,#2
 936  00d3 81            	ret
 970                     ; 508 uint16_t FLASH_GetCodeSize(void)
 970                     ; 509 {
 971                     	switch	.text
 972  00d4               _FLASH_GetCodeSize:
 974  00d4 89            	pushw	x
 975       00000002      OFST:	set	2
 978                     ; 510   uint16_t temp = 0;
 980                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 982  00d5 c64807        	ld	a,18439
 983  00d8 5f            	clrw	x
 984  00d9 97            	ld	xl,a
 985  00da 4f            	clr	a
 986  00db 02            	rlwa	x,a
 987  00dc 44            	srl	a
 988  00dd 56            	rrcw	x
 989  00de 1f01          	ldw	(OFST-1,sp),x
 991                     ; 516   if(OPT->PCODESIZE > 0x7F)
 993  00e0 c64807        	ld	a,18439
 994  00e3 a180          	cp	a,#128
 995  00e5 2505          	jrult	L114
 996                     ; 518     temp = 8192;
 998  00e7 ae2000        	ldw	x,#8192
 999  00ea 1f01          	ldw	(OFST-1,sp),x
1001  00ec               L114:
1002                     ; 522   return(temp);
1004  00ec 1e01          	ldw	x,(OFST-1,sp)
1007  00ee 5b02          	addw	sp,#2
1008  00f0 81            	ret
1043                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
1043                     ; 548 {
1044                     	switch	.text
1045  00f1               _FLASH_ITConfig:
1049                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1051                     ; 552   if(NewState != DISABLE)
1053  00f1 4d            	tnz	a
1054  00f2 2706          	jreq	L134
1055                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1057  00f4 72125050      	bset	20560,#1
1059  00f8 2004          	jra	L334
1060  00fa               L134:
1061                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1063  00fa 72135050      	bres	20560,#1
1064  00fe               L334:
1065                     ; 562 }
1068  00fe 81            	ret
1177                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1177                     ; 577 {
1178                     	switch	.text
1179  00ff               _FLASH_GetFlagStatus:
1181  00ff 88            	push	a
1182       00000001      OFST:	set	1
1185                     ; 578   FlagStatus status = RESET;
1187                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1189                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1191  0100 c45054        	and	a,20564
1192  0103 2706          	jreq	L505
1193                     ; 584     status = SET; /* Flash_FLAG is set*/
1195  0105 a601          	ld	a,#1
1196  0107 6b01          	ld	(OFST+0,sp),a
1199  0109 2002          	jra	L705
1200  010b               L505:
1201                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1203  010b 0f01          	clr	(OFST+0,sp)
1205  010d               L705:
1206                     ; 592   return status;
1208  010d 7b01          	ld	a,(OFST+0,sp)
1211  010f 5b01          	addw	sp,#1
1212  0111 81            	ret
1248                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1248                     ; 720 {
1249                     	switch	.text
1250  0112               _FLASH_PowerRunModeConfig:
1254                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1256                     ; 724   if(FLASH_Power != FLASH_Power_On)
1258  0112 a101          	cp	a,#1
1259  0114 2706          	jreq	L725
1260                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1262  0116 72165050      	bset	20560,#3
1264  011a 2004          	jra	L135
1265  011c               L725:
1266                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1268  011c 72175050      	bres	20560,#3
1269  0120               L135:
1270                     ; 732 }
1273  0120 81            	ret
1337                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1337                     ; 746 {
1338                     	switch	.text
1339  0121               _FLASH_GetPowerStatus:
1343                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1345  0121 c65050        	ld	a,20560
1346  0124 a40c          	and	a,#12
1349  0126 81            	ret
1453                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1453                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1453                     ; 767 {
1454                     	switch	.text
1455  0127               _FLASH_ProgramBlock:
1457  0127 89            	pushw	x
1458  0128 5206          	subw	sp,#6
1459       00000006      OFST:	set	6
1462                     ; 768   uint16_t Count = 0;
1464                     ; 769   uint32_t startaddress = 0;
1466                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1468                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1470                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1472  012a 7b0b          	ld	a,(OFST+5,sp)
1473  012c a1fd          	cp	a,#253
1474  012e 260c          	jrne	L136
1475                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1477                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1479  0130 ae8000        	ldw	x,#32768
1480  0133 1f03          	ldw	(OFST-3,sp),x
1481  0135 ae0000        	ldw	x,#0
1482  0138 1f01          	ldw	(OFST-5,sp),x
1485  013a 200a          	jra	L336
1486  013c               L136:
1487                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1489                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1491  013c ae1000        	ldw	x,#4096
1492  013f 1f03          	ldw	(OFST-3,sp),x
1493  0141 ae0000        	ldw	x,#0
1494  0144 1f01          	ldw	(OFST-5,sp),x
1496  0146               L336:
1497                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1499  0146 1e07          	ldw	x,(OFST+1,sp)
1500  0148 a680          	ld	a,#128
1501  014a cd0000        	call	c_cmulx
1503  014d 96            	ldw	x,sp
1504  014e 1c0001        	addw	x,#OFST-5
1505  0151 cd0000        	call	c_lgadd
1508                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1510  0154 0d0c          	tnz	(OFST+6,sp)
1511  0156 2606          	jrne	L536
1512                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1514  0158 72105051      	bset	20561,#0
1516  015c 2004          	jra	L736
1517  015e               L536:
1518                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1520  015e 72185051      	bset	20561,#4
1521  0162               L736:
1522                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1524  0162 5f            	clrw	x
1525  0163 1f05          	ldw	(OFST-1,sp),x
1527  0165               L146:
1528                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1530  0165 1e0d          	ldw	x,(OFST+7,sp)
1531  0167 72fb05        	addw	x,(OFST-1,sp)
1532  016a f6            	ld	a,(x)
1533  016b 1e03          	ldw	x,(OFST-3,sp)
1534  016d 72fb05        	addw	x,(OFST-1,sp)
1535  0170 f7            	ld	(x),a
1536                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1538  0171 1e05          	ldw	x,(OFST-1,sp)
1539  0173 1c0001        	addw	x,#1
1540  0176 1f05          	ldw	(OFST-1,sp),x
1544  0178 1e05          	ldw	x,(OFST-1,sp)
1545  017a a30080        	cpw	x,#128
1546  017d 25e6          	jrult	L146
1547                     ; 805 }
1550  017f 5b08          	addw	sp,#8
1551  0181 81            	ret
1614                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1614                     ; 818 {
1615                     	switch	.text
1616  0182               _FLASH_EraseBlock:
1618  0182 89            	pushw	x
1619  0183 5206          	subw	sp,#6
1620       00000006      OFST:	set	6
1623                     ; 819   uint32_t startaddress = 0;
1625                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1627                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1629  0185 7b0b          	ld	a,(OFST+5,sp)
1630  0187 a1fd          	cp	a,#253
1631  0189 260c          	jrne	L107
1632                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1634                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1636  018b ae8000        	ldw	x,#32768
1637  018e 1f05          	ldw	(OFST-1,sp),x
1638  0190 ae0000        	ldw	x,#0
1639  0193 1f03          	ldw	(OFST-3,sp),x
1642  0195 200a          	jra	L307
1643  0197               L107:
1644                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1646                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1648  0197 ae1000        	ldw	x,#4096
1649  019a 1f05          	ldw	(OFST-1,sp),x
1650  019c ae0000        	ldw	x,#0
1651  019f 1f03          	ldw	(OFST-3,sp),x
1653  01a1               L307:
1654                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1656  01a1 1e07          	ldw	x,(OFST+1,sp)
1657  01a3 a680          	ld	a,#128
1658  01a5 cd0000        	call	c_cmulx
1660  01a8 96            	ldw	x,sp
1661  01a9 1c0003        	addw	x,#OFST-3
1662  01ac cd0000        	call	c_ladd
1664  01af be02          	ldw	x,c_lreg+2
1665  01b1 1f01          	ldw	(OFST-5,sp),x
1667                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1669  01b3 721a5051      	bset	20561,#5
1670                     ; 855     *pwFlash = (uint32_t)0;  
1672  01b7 1e01          	ldw	x,(OFST-5,sp)
1673  01b9 a600          	ld	a,#0
1674  01bb e703          	ld	(3,x),a
1675  01bd a600          	ld	a,#0
1676  01bf e702          	ld	(2,x),a
1677  01c1 a600          	ld	a,#0
1678  01c3 e701          	ld	(1,x),a
1679  01c5 a600          	ld	a,#0
1680  01c7 f7            	ld	(x),a
1681                     ; 863 }
1684  01c8 5b08          	addw	sp,#8
1685  01ca 81            	ret
1770                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1770                     ; 876 {
1771                     	switch	.text
1772  01cb               _FLASH_WaitForLastOperation:
1774  01cb 5203          	subw	sp,#3
1775       00000003      OFST:	set	3
1778                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1780  01cd aeffff        	ldw	x,#65535
1781  01d0 1f01          	ldw	(OFST-2,sp),x
1783                     ; 878   uint8_t flagstatus = 0x00;
1785  01d2 0f03          	clr	(OFST+0,sp)
1787                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1789  01d4 a1fd          	cp	a,#253
1790  01d6 2628          	jrne	L367
1792  01d8 200e          	jra	L157
1793  01da               L747:
1794                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1794                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1796  01da c65054        	ld	a,20564
1797  01dd a405          	and	a,#5
1798  01df 6b03          	ld	(OFST+0,sp),a
1800                     ; 887       timeout--;
1802  01e1 1e01          	ldw	x,(OFST-2,sp)
1803  01e3 1d0001        	subw	x,#1
1804  01e6 1f01          	ldw	(OFST-2,sp),x
1806  01e8               L157:
1807                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1809  01e8 0d03          	tnz	(OFST+0,sp)
1810  01ea 261c          	jrne	L757
1812  01ec 1e01          	ldw	x,(OFST-2,sp)
1813  01ee 26ea          	jrne	L747
1814  01f0 2016          	jra	L757
1815  01f2               L167:
1816                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1816                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1818  01f2 c65054        	ld	a,20564
1819  01f5 a441          	and	a,#65
1820  01f7 6b03          	ld	(OFST+0,sp),a
1822                     ; 896       timeout--;
1824  01f9 1e01          	ldw	x,(OFST-2,sp)
1825  01fb 1d0001        	subw	x,#1
1826  01fe 1f01          	ldw	(OFST-2,sp),x
1828  0200               L367:
1829                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1831  0200 0d03          	tnz	(OFST+0,sp)
1832  0202 2604          	jrne	L757
1834  0204 1e01          	ldw	x,(OFST-2,sp)
1835  0206 26ea          	jrne	L167
1836  0208               L757:
1837                     ; 900   if(timeout == 0x00)
1839  0208 1e01          	ldw	x,(OFST-2,sp)
1840  020a 2604          	jrne	L177
1841                     ; 902     flagstatus = FLASH_Status_TimeOut;
1843  020c a602          	ld	a,#2
1844  020e 6b03          	ld	(OFST+0,sp),a
1846  0210               L177:
1847                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1849  0210 7b03          	ld	a,(OFST+0,sp)
1852  0212 5b03          	addw	sp,#3
1853  0214 81            	ret
1866                     	xdef	_FLASH_WaitForLastOperation
1867                     	xdef	_FLASH_EraseBlock
1868                     	xdef	_FLASH_ProgramBlock
1869                     	xdef	_FLASH_GetPowerStatus
1870                     	xdef	_FLASH_PowerRunModeConfig
1871                     	xdef	_FLASH_GetFlagStatus
1872                     	xdef	_FLASH_ITConfig
1873                     	xdef	_FLASH_EraseOptionByte
1874                     	xdef	_FLASH_ProgramOptionByte
1875                     	xdef	_FLASH_GetReadOutProtectionStatus
1876                     	xdef	_FLASH_GetCodeSize
1877                     	xdef	_FLASH_GetBootSize
1878                     	xdef	_FLASH_ReadByte
1879                     	xdef	_FLASH_ProgramWord
1880                     	xdef	_FLASH_EraseByte
1881                     	xdef	_FLASH_ProgramByte
1882                     	xdef	_FLASH_Lock
1883                     	xdef	_FLASH_Unlock
1884                     	xdef	_FLASH_DeInit
1885                     	xdef	_FLASH_PowerWaitModeConfig
1886                     	xdef	_FLASH_SetProgrammingTime
1887                     	xdef	_FLASH_GetProgrammingTime
1888                     	xref.b	c_lreg
1907                     	xref	c_ladd
1908                     	xref	c_lgadd
1909                     	xref	c_cmulx
1910                     	end
