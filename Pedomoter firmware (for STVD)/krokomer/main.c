
//===================== IMPORTOVAN� KNIHOVNY ==========
#include "stm8l15x.h"
#include "stm8l15x_gpio.h"
#include "delay.h"
#include "stm8l15x_tim4.h"
#include "stm8l15x_itc.h"
#include "stm8l15x_exti.h"
#include "stm8l15x_it.h"
#include "stm8l15x_lcd.h"
#include "stm8l15x_flash.h"
#include "stm8l15x_clk.h"
#include "stm8l15x_adc.h"

//======================== DEKLARACE ROM�NN�CH ============
volatile bool stav = 0;			//pro ulo�en� stavu ovl. tla��tka - zaj� m� n�s hlavn� kdy se rovn� nule
volatile bool wut = 0;			//pro idikaci interruptu z wake up timeru
volatile bool odp = 0;			//pro idikaci interruptu p�i zapnut� nebo vypnut� nab�jen� bterie
volatile bool dup = 0;			//pro idikaci interruptu z krokom�rov�ho modulu
volatile bool preteceni = 0;			//idikuje p�es�hnut� maxim�ln� hodnoty, kter� lze na LCD zobrazit
bool vymaz = 1;			//pomocn� prom�nn� d�ky kter� se po vymaz�n� rekordu/po�tu krok�/rozsv�cen� nep�epne hodnota na n�sleduj�c� v po�ad�
bool nab_pripojeno = 0;			//nastaveno na 1 kdy� je se baterie nenab�j�
bool wut_vyp = 0;			//pomocn� promnn� aby se wakeup timer natavoval jenom kdy� nen� nastaven
bool zobrazeno0 = 0;			//tyto prom�nn� ur�uj� jestli se po�adovan� hodnota m� zobrazit nebo ne
bool zobrazeno1 = 0;
bool zobrazeno2 = 0;

int8_t menu = 0;			//ur�uje kter� hofdnota se m� na LCD zobrazit
uint16_t maxU;			//prom�nn� pro v�po�et nap�t� baterie
uint16_t rozdil_max_min = 611;			//ide�ln� rozd�l min a max nap�t� baterie - hodnota p�i�azen� ude slou�� jako pojistka kdyby v EEPROM nebyla nastavena 
uint16_t minU = 2429;			//ide�ln� min hodnota nap�t� baterie - hodnota p�i�azen� ude slou�� jako pojistka kdyby v EEPROM nebyla nastavena
int32_t vzorek;
volatile uint32_t kroky = 0;			//zde se zapisuje po�et krok�
uint32_t rekord;			//sem se na�te rekord ulo�en� v EEPROM

//========================== DEKLARACE FUNKC� =============
void init_milis(void);
void nastaveniGPIO(void);
void nastaveniLCD (void);
void nastaveniINTERRUPTU(void);
void nastaveniADC(void);
void nastaveniCLK(void);
void detekce_nabijeni(void);
void zobraz_pomlcky(void);
void ADC(bool stav);
void spanek (void);
void cislanaLCD (uint32_t cislo);
void zobraz_na_LCD(void);
void EEPROMzapis(uint32_t zapsat, uint32_t adresa);
uint32_t EEPROMcteni(uint32_t adresa);
uint8_t baterie (void);

//========================= POLE PRO OVL�D�N� LCD ===========
uint8_t cislanaseg[5];
uint8_t posun [5] = {0,2,4,6,8};
uint8_t celkovyvysledek [8][2] = {{0,0b00000000},{3,0b0000000},{7,0b00000000},{10,0b0000000},{1,0b00000000},{4,0b0000000},{8,0b0000000},{11,0b0000000}};
uint8_t vysledek [8][2];
uint8_t vyber [10][4][2] = 
{{{1,0b00000011},{4,0b00100000},{8,0b00000011},{11,0b00100000}},//0
{{1,0b00000001},{4,0b00000000},{8,0b00000001},{11,0b00000000}},//1
{{1,0b00000011},{4,0b00010000},{8,0b00000010},{11,0b00100000}},//2
{{1,0b00000011},{4,0b00010000},{8,0b00000001},{11,0b00100000}},//3
{{1,0b00000001},{4,0b00110000},{8,0b00000001},{11,0b00000000}},//4
{{1,0b00000010},{4,0b00110000},{8,0b00000001},{11,0b00100000}},//5
{{1,0b00000010},{4,0b00110000},{8,0b00000011},{11,0b00100000}},//6
{{1,0b00000011},{4,0b00000000},{8,0b00000001},{11,0b00000000}},//7
{{1,0b00000011},{4,0b00110000},{8,0b00000011},{11,0b00100000}},//8
{{1,0b00000011},{4,0b00110000},{8,0b00000001},{11,0b00100000}}};//9

//======================== HLAVN� PROGRAM =============
void main(void)			//nastaven� po��van�ch preriferi�, hodinov�ho sign�lu a interrupt�
{
	disableInterrupts();
	nastaveniCLK();
	nastaveniINTERRUPTU();
	init_milis();
	nastaveniGPIO();
	nastaveniLCD();
	nastaveniADC();
	GPIO_WriteBit(GPIOB, GPIO_Pin_2, RESET);
	enableInterrupts();

	if(EEPROMcteni(0x001008) != 0 && EEPROMcteni(0x001004) != 0){			//pokud m� v EEPROM zaps�ny referen�n� nap�t� prour�en� stavubaterie tak si je na�ti a pracuj s nimi 
		rozdil_max_min = (uint16_t)EEPROMcteni(0x001008);
		minU = (uint16_t)EEPROMcteni(0x001004);
	}
	
  while (1){ //cyklus se provede v�dy jen jednou a to kdy� dojde k interruptu
		detekce_nabijeni();			//zkontroluj jestli nen� p�ipojena nab�je�ka
		
		if (preteceni){			//zkontroluj jestli nedo�lo k p�ekro�en� maxim�ln�ho po�etu krok�, kter� dok�eme zobrazit
			EEPROMzapis(99999, 0x001000);
			preteceni = 0;
		}
		
		if(GPIO_ReadInputDataBit(GPIOE,GPIO_Pin_6) != RESET){			//pokud je ovl. tla��tko pu�t�no stav je 0 a pokud �lo o probuzen� interruptem z tle��tka pohni se v menu 
			stav = 0;
			if(!vymaz && !dup && !wut && !odp && (TIM5_GetCounter() > 8)){
				menu++;
				if (menu == 3){			// kdy� je menu 3 tak se vra� zp�t na nulu � to��me se v kruhu
					menu = 0;
				}
			}else{
				vymaz = 0;
			}
		}
		
		if(menu == 0){			//pokud chceme zobrazit menu 0 (aktu�ln� po�et krok�)
			if( TIM5_GetCounter() > 1000 && !vymaz && !dup && !wut){ //pokud dr��m tla��tko, ub�hly 2s a m�m povoleno vymaz�v�n� tak vyma� kroky a zaka� dal�� vymaz�v�n�
				if (EEPROMcteni(0x001000) < kroky){			//p�ekonali jsme rekord? pokud ano tak ho ulo� do EEPROM
					EEPROMzapis(kroky,0x001000);
				}
				kroky = 0;
				zobrazeno0 = 0;			//zobraz smazan� kroky na displeji
				vymaz = 1;
				TIM5_SetCounter(0);			//vynuluj �asova� 
			}	
			
			if (dup || !zobrazeno0){			//ud�lali jsme krok nebo nebo jsme povolili zobrazen� krok� tak zobraz aktu�ln� po�et krok� 
				cislanaLCD(kroky);
				zobraz_na_LCD();
				zobrazeno0 = 1;	
				dup = 0;
			}
			zobrazeno1 = 0;
			
		}else if(menu == 1){			// chceme se pod�vat na n� rekord
			if(TIM5_GetCounter() > 1333 && !vymaz && !dup && !wut){			//pokd dr��m tla��tko cca 4.5 sekundy tak vypa� rekord
				EEPROMzapis(0, 0x001000);
				vymaz = 1;
				zobrazeno1 = 0;
				TIM5_SetCounter(0);
			}
			
			if(!zobrazeno1){			//chceme zobrazit rekord na displeji
				rekord = EEPROMcteni(0x001000);
				cislanaLCD(rekord);
				zobraz_na_LCD();
				zobrazeno1 = 1;
			}
			zobrazeno2 = 0;
		
		}else if(menu == 2){			//chceme vid�t stav baterie
			if(!zobrazeno2 || odp){			//chceme zobrazit stav baterie na displeji
				if(!nab_pripojeno){			//baterie se nenab�j� - zobraz jej� procentu�ln� stav
					cislanaLCD(baterie());
					zobraz_na_LCD();
				}else{			//baterie se nab�j� - zobraz poml�ka na displeji
					zobraz_pomlcky();
				}
				zobrazeno2 = 1;
			}
			
			if(TIM5_GetCounter() > 667 && !vymaz && !dup && !wut){			//pokud dr��m tla��tko cca 2 sekundy zm�� podsv�cen� displeje na opak aktu�ln�ho stavu
				GPIO_ToggleBits(GPIOB,GPIO_Pin_2);
				vymaz = 1;
				wut = 0;
				TIM5_SetCounter(0);
			}
			zobrazeno0 = 0;
		}
		
		odp = 0;
		dup = 0;
		
		if(!stav){			//pokud nen� ovl. tla��tko stisknuto p�edi do re�imu sp�nku
			spanek ();
		}
	}
}
	
//=================== INTERRUPTOV� RUTINY ===========
INTERRUPT_HANDLER(EXTI7_IRQHandler,15)			//rutina pro obsluhu p�eru�en� z modulu krokom�ru
{
	kroky++;
	dup = 1;
	EXTI_ClearITPendingBit(EXTI_IT_Pin7);
	if (kroky > 99999){
		kroky = 0;
		preteceni = 1;
	}
}

INTERRUPT_HANDLER(EXTI6_IRQHandler,14)			//rutina pro obsluhu p�eru�en� z ovl. tla��tka
{	
	stav = 1;
	EXTI_ClearITPendingBit(EXTI_IT_Pin6);
}

INTERRUPT_HANDLER(EXTI5_IRQHandler,13)			//rutina pro obsluhu p�eru�en� p�i nab�jen�
{	
	odp = 1;
	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
}

INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)			//rutina pro obsluhu p�eru�en� �asova�e probuzen�
{
	GPIO_WriteBit(GPIOB, GPIO_Pin_2, RESET);
	wut = 1;
	RTC_ClearITPendingBit(RTC_IT_WUT);
	//RTC_ClearFlag(RTC_FLAG_WUTF);
}

//==================== FUNKCE PRO NASTAVEN� ============
void nastaveniCLK(void){			//nastaven� hlavn�ho zdroje hodinov�ho sign�lu
	CLK_DeInit();			//vynuluj nastaven� 
	CLK_LSICmd(ENABLE);			//zapni vnit�n� oscil�tor 38 kHz
	while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY)== RESET);			//dokud nen� zapnut po�kej
	CLK_SYSCLKSourceSwitchCmd(ENABLE);			//zapni p�ep�n�n� taktovac�ch hodin
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);			//zm�� taktovac� hodiny na LSI
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);			//d�li�ku LSI nastav ne jedna
	while(CLK_GetFlagStatus(CLK_FLAG_SWBSY)== SET);			//dokud nen� v�m�na taktovac�ch hodin dokon�ena tak �ekej 
	CLK_SYSCLKSourceSwitchCmd(DISABLE);			//vypni mo�nost zm�nit taktovac� hodiny
	CLK_HSICmd(DISABLE);			//vypni vsnit�n� oscil�tor 16 Mhz - moc velk� spot�eba
	CLK_HaltConfig(CLK_Halt_FastWakeup, DISABLE);			//nastav jak se chovat p�i halt modu
	CLK_HaltConfig(CLK_Halt_SlowWakeup, ENABLE);
	}

void init_milis(void){			//nastaven� �asova�e po��van�ho pro v�po�et �asu
	TIM5_DeInit();			//vynuluj nastaven� �asova�e 5
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM5, ENABLE);			//zapni p��vod taktovac�ho sign�lu do �asova�e 5
	TIM5_TimeBaseInit(TIM5_Prescaler_128,TIM5_CounterMode_Up, 0xffff);			//d�l p��choz� taktovac� sign�l 128, po��t nahoru, po��tej do 65535 (65536 takt� - za��n� se od 0)
	TIM5_Cmd(ENABLE);			//zapni �asova� 5
}

void nastaveniGPIO(void){			//nastaven� pin� vstup� a v�stup�
	GPIO_DeInit(GPIOC);			//resetuj nastaven� po��van�ch port�
	GPIO_DeInit(GPIOE);
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOE, GPIO_Pin_6, GPIO_Mode_In_PU_IT);			//nastav E6 pro vstup ovl. tla��tka
	GPIO_Init(GPIOE, GPIO_Pin_7, GPIO_Mode_In_FL_IT);			//nastav E7 pro vstup krokom�rov�ho modulu
	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_In_FL_IT);			//nastav C5 na detekci nabijeni
	GPIO_Init(GPIOC, GPIO_Pin_7, GPIO_Mode_In_FL_No_IT);			//nastav C7 pro �ten� napeti baterie
	GPIO_Init(GPIOB, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Slow);			//nastav B2 jako v�stup pro ovl�d�n� podsv�cen� dispelje
}

void nastaveniLCD (void){			//nastaven� LCD driveru
	CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);			//zapni RTC hodiny jejich� hodinov�m sign�lem bude LSI d�len� 1
	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);			//zapni p��vod hodinov�ho sign�lu do LCD driveru
	RTC_WakeUpClockConfig(RTC_WakeUpClock_RTCCLK_Div16);			//nastav sign�l jsouc� do ��ta�e pro automatick� probuzen� jako hodiny z RTC d�len� 16
	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);			//p�ive� hodinov� sign�l do LCD driveru
	LCD_Init(LCD_Prescaler_1,LCD_Divider_16,LCD_Duty_1_4,LCD_Bias_1_3,LCD_VoltageSource_Internal);			//nastav LCD driver
	LCD_PortMaskConfig(LCD_PortMaskRegister_0,255);			//nastav vybran� piny jako v�vody pro LCD
	LCD_PortMaskConfig(LCD_PortMaskRegister_1,15);
	LCD_ContrastConfig(LCD_Contrast_Level_5);			//nastav kontrast LCD
	LCD_Cmd(ENABLE);			//zapni LCD driver
}

void nastaveniINTERRUPTU(void){			//nastaven� interrupt�
	EXTI_DeInit();			//vyma� nastavven� interrupt�
	EXTI_ClearITPendingBit(EXTI_IT_Pin7);			//vyma� bit signalizuj�c� interrupt na dan�m pinu
	EXTI_ClearITPendingBit(EXTI_IT_Pin6);
	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
	EXTI_SetPinSensitivity(EXTI_Pin_7,EXTI_Trigger_Rising);			//nastav kdy se generuje interrupt na dan�m pinu - z modulu krokm�ru
	EXTI_SetPinSensitivity(EXTI_Pin_6,EXTI_Trigger_Falling);			//z ovl. tla��tka
	EXTI_SetPinSensitivity(EXTI_Pin_5,EXTI_Trigger_Rising_Falling);			//interrupt z C5 - detekce nabijeni
	ITC_SetSoftwarePriority(EXTI6_IRQn,ITC_PriorityLevel_3);			//nastav prioritu p�eru�en�
	ITC_SetSoftwarePriority(EXTI5_IRQn,ITC_PriorityLevel_3);
	ITC_SetSoftwarePriority(EXTI7_IRQn,ITC_PriorityLevel_1);
}

void nastaveniADC(void){			//nastaven� ADC p�evodn�ku
	ADC_DeInit(ADC1);			//vyma� nastaven� ADC p�eodn�ku
	ADC_Init(ADC1, ADC_ConversionMode_Single, ADC_Resolution_12Bit, ADC_Prescaler_2);			//nastav jak bude ADC fungovt: vezme pouze jeden vzorek, rozli�en� 12 b frekvence vzorko�n� je taktovac� sign�l /2
	ADC_SchmittTriggerConfig(ADC1,ADC_Channel_3,DISABLE);			//vypni schmittuv p�ep�na� na pinu 7
	ADC_SamplingTimeConfig(ADC1,ADC_Group_SlowChannels, ADC_SamplingTime_4Cycles);			//nastaven� �asu pro oedb�r�n� jednoho vzorku
}

//======================= OSTATN� FUNKCE =============
void ADC (bool stav){			//zapnut� a p�ipraven� ADC na p�evod (to v�e kv�li spot�eb�)
	if (stav){			//kdy� bylo ovl. tla��tko stisknuto
		CLK_HSICmd(ENABLE);			//nastav taktovac� sign�l z LSI oscil�toru na HSI proto�e LSI je pro ADC p��li� pomal� (min f ADC kolme 400 kHz)
		while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY)== RESET);
		CLK_SYSCLKSourceSwitchCmd(ENABLE);
		CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
		CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_16);
		while(CLK_GetFlagStatus(CLK_FLAG_SWBSY)== SET);
		CLK_SYSCLKSourceSwitchCmd(DISABLE);
		CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);			//spu�t�n� ADC
		ADC_Cmd(ADC1, ENABLE);
		ADC_ChannelCmd(ADC1,ADC_Channel_3, ENABLE);
		_delay_us(7);
	}else{
		while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY)== RESET);			//nastav taktovac� sign�l zp�t
		CLK_SYSCLKSourceSwitchCmd(ENABLE);
		CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);
		CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
		while(CLK_GetFlagStatus(CLK_FLAG_SWBSY)== SET);
		CLK_SYSCLKSourceSwitchCmd(DISABLE);
		CLK_HSICmd(DISABLE);
		ADC_Cmd(ADC1, DISABLE);			//vypni ADC
		ADC_ChannelCmd(ADC1,ADC_Channel_3, DISABLE);
		CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
	}
}

void cislanaLCD (uint32_t cislo){			//p��prava ��sel na zobrazen� na LCD
	uint8_t i;
	uint16_t delitel= 10000;
	
	for (i = 0; i != 5; i++){			//rozd�l� ��slo na jednoky des�tky stovky...
		if (cislo < 100000){
			cislanaseg[i] = cislo/delitel;
			cislo = cislo % delitel;
			delitel = delitel/10;
		}
	}
}

void zobraz_na_LCD(void){			//zobrazen� ��sel na LCD
	uint8_t i;
	uint8_t x;
	uint8_t y;
	uint8_t posunute;
	uint8_t pomoc;
	uint8_t pocetpred1 =0 ;
	uint8_t pocetpo1 = 0;
	uint8_t celkovyvysledek [8][2] = {{1,0b00000000},{4,0b0000000},{8,0b0000000},{11,0b0000000},{0,0b00000000},{3,0b0000000},{7,0b00000000},{10,0b0000000}};
	bool nezobrazovat = 0;
	
	for (i = 0; i != 5; i++){			//cyklus pro zpracov�n� 5 ��sel
		
		if (cislanaseg[0] == 0 && cislanaseg[1] == 0 && cislanaseg[2] == 0 && cislanaseg[3] == 0 && cislanaseg[4] == 0){			//o�et�en� pro zobrazov�n� nul
			celkovyvysledek[4][1] = 0b00000011;
			celkovyvysledek[5][1] = 0b00100000;
			celkovyvysledek[6][1] = 0b00000011;
			celkovyvysledek[7][1] = 0b00100000;
			break;
		}else if (cislanaseg[i] == 0 && !nezobrazovat){
			continue;
		}else if (cislanaseg[i] > 0){
			nezobrazovat = 1;
		}
		
		for (x = 0; x != 4; x++){			//ka�d� jedno ��slo je zapisov�no pomoc� 4 registr� proto�e m�me 4 comy
			
			posunute = vyber[cislanaseg[i]][x][1];			//vezme p�edpis dane�ho ��sla pro prvn� pozici na displeji a podle pozice pr�v� zpracov�van�ho ��sla ji posune tak aby se zpr�vn� zobrazovaly na ��dech jednotek des�tek stovek...
			pomoc = posunute;
			
			while (pomoc){			//zaji�t�n� spr�vnosti bitov� rotace
				pomoc &= (pomoc -1);
				pocetpred1 ++;
			}
			
			pomoc = posunute >> posun[i];
			
			while (pomoc){
				pomoc &= (pomoc -1);
				pocetpo1 ++;
			}
			
			posunute =  posunute >> posun[i] | posunute << 8u-posun[i];			//bitov� rotace
			
			if (pocetpred1 == pocetpo1){			//�prava pro z�pis do registr�
				vysledek[x][0] = vyber[cislanaseg[i]][x][0];
				vysledek[x][1] = posunute;
			}else if (pocetpo1 == 0){
				vysledek[x+4][0] = vyber[cislanaseg[i]][x][0]-1;
				vysledek[x+4][1] = posunute;
			}else if (pocetpo1 < pocetpred1){
				vysledek[x][0] = vyber[cislanaseg[i]][x][0];
				vysledek[x][1] = posunute & 0b00001111;
				vysledek[x+4][0] = vyber[cislanaseg[i]][x][0]-1;
				vysledek[x+4][1] = posunute & 0b11110000;
			}
			pocetpred1 = 0;
			pocetpo1 = 0;
			pomoc = 0;
		}
			for (y = 0; y != 8; y++){			//ulo�en� meziv�sledku
			celkovyvysledek[y][1] = celkovyvysledek[y][1] | vysledek[y][1];
			vysledek[y][0] = 0;
			vysledek[y][1] = 0;
		}
	}
	LCD_ClearFlag();			//ukl�d�� dat do jednotliv�ch registr�
	while(LCD_GetFlagStatus() == RESET);
	LCD_WriteRAM(LCD_RAMRegister_1, celkovyvysledek[0][1]);
	
	LCD_ClearFlag();
	while(LCD_GetFlagStatus() == RESET);
	LCD_WriteRAM(LCD_RAMRegister_0, celkovyvysledek[4][1]);
	
	LCD_ClearFlag();
	while(LCD_GetFlagStatus() == RESET);
	LCD_WriteRAM(LCD_RAMRegister_4, celkovyvysledek[1][1]);

	LCD_ClearFlag();
	while(LCD_GetFlagStatus() == RESET);
	LCD_WriteRAM(LCD_RAMRegister_3, celkovyvysledek[5][1]);
	
	LCD_ClearFlag();
	while(LCD_GetFlagStatus() == RESET);
	LCD_WriteRAM(LCD_RAMRegister_8, celkovyvysledek[2][1]);
	
	LCD_ClearFlag();
	while(LCD_GetFlagStatus() == RESET);
	LCD_WriteRAM(LCD_RAMRegister_7, celkovyvysledek[6][1]);
	
	LCD_ClearFlag();
	while(LCD_GetFlagStatus() == RESET);
	LCD_WriteRAM(LCD_RAMRegister_11, celkovyvysledek[3][1]);
	
	LCD_ClearFlag();
	while(LCD_GetFlagStatus() == RESET);
	LCD_WriteRAM(LCD_RAMRegister_10, celkovyvysledek[7][1]);
	
}

void zobraz_pomlcky(void){			//zobrazen� poml�ek na LCD
	LCD_WriteRAM(LCD_RAMRegister_8, 0);			//ulo� do LCD registr� data pro zobrazen� poml�ek
	LCD_WriteRAM(LCD_RAMRegister_0, 0 );
	LCD_WriteRAM(LCD_RAMRegister_1, 0 );
	LCD_WriteRAM(LCD_RAMRegister_3, 0b01010000 );
	LCD_WriteRAM(LCD_RAMRegister_4, 0 );
	LCD_WriteRAM(LCD_RAMRegister_7, 0 );
	LCD_WriteRAM(LCD_RAMRegister_8, 0 );
	LCD_WriteRAM(LCD_RAMRegister_10, 0 );
	LCD_WriteRAM(LCD_RAMRegister_11, 0 );
}

void EEPROMzapis(uint32_t zapsat,uint32_t adresa){			//ukl�d�n� do EEPROM
	FLASH_Unlock(FLASH_MemType_Data);			//odemkni zabezpe�enou EEPROM
	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL)== RESET);			//dokud nen� p�ipraven� �ekej
	if(sizeof(zapsat) > 1){			//na z�klad� dan� adresy zapi� bu� jeden Byte nebo cel� slovo (4 B)
		FLASH_ProgramWord(adresa, zapsat);
	}else{
		uint8_t zapsat = (uint8_t)zapsat;
		FLASH_ProgramByte(adresa,zapsat);
	}
	while(FLASH_GetFlagStatus(FLASH_FLAG_EOP)== RESET);
	FLASH_Lock(FLASH_MemType_Data);			//zamkli EEPROM
}

uint32_t EEPROMcteni(uint32_t adresa){			// �ten� z EEPROM
	uint32_t precteno = 0;	
	uint8_t byte = 0;
	int8_t i;
	FLASH_Unlock(FLASH_MemType_Data);			//odemkni EEPROM
	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL)== RESET);		//dokud nen� p�ipraven� �ekej

	for (i=4; i>0; i--){			//um�me ��st jenom po Bytu ne po slovech proto po�ijeme cyklus
		byte = FLASH_ReadByte(adresa);
		precteno = precteno | (byte<<((i-1)*8));
		adresa++;
	}
	FLASH_Lock(FLASH_MemType_Data);			//zam�i EEPROM
	return precteno;			//hodnotou to funkce je p�e�ten� hodnota
}

uint8_t baterie (void){			//zji�t�n� stavu baterie
	uint8_t i;
	ADC(1);			//zapni a p�iprav ADC
	for (i = 0; i < 3; i++){			//vezmi t�et� vzorek - p�r vzork� trv� ne� se hodnota ust�l�
		ADC_SoftwareStartConv(ADC1);			//za�ni p�evod
		while(ADC_GetFlagStatus(ADC1,ADC_FLAG_EOC) == RESET);			//dokud nen� vzorek zpracov�n �ekej
		vzorek =  ADC_GetConversionValue(ADC1);			//z�skej p�evedenou hodnotu
		ADC_ClearFlag(ADC1, ADC_FLAG_EOC);			//p�evod ukon�en
	}
	ADC(0);			//vypni ADC
							//p�epo�et nap�t� baterie na procentu�ln� stav naterie
	vzorek = vzorek - minU;		//rozp�t� se mus� pohybovat od 3.4V (- baterie vybita) a� po 4.2V (pln� nabita) jinak by se procenta po��tala z cel�o rozsahu 0 - 4.2
	if (vzorek <= 0){
		vzorek = 0;
	}else if(vzorek > rozdil_max_min){
		 vzorek = 100;
	}else{
		vzorek = (vzorek*100)/rozdil_max_min;		
		if((vzorek == 99) && (((minU + rozdil_max_min)- maxU) < 4)){
			vzorek = 100;
		}
	}
	return vzorek;			//funkce nab�v� procentu�ln� hodnoty nap�t� baterie
}

void detekce_nabijeni (void){			//nab�j� se baterie?
	if(GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_5)!= RESET){			//baterie se nenab�j�
		if(nab_pripojeno){			//pokud se p�ed chv�l� nab�jela odeber vozrek nap�t� a ulo� ho jako referen�n� hodnotu do EEPROM
			uint8_t i;
			ADC(1);
			for(i = 0; i < 3; i++){
				ADC_SoftwareStartConv(ADC1);
				while(ADC_GetFlagStatus(ADC1,ADC_FLAG_EOC) == RESET);
				maxU =  ADC_GetConversionValue(ADC1);
				ADC_ClearFlag(ADC1, ADC_FLAG_EOC);
			}
			ADC(0);
			minU = ((8 * maxU) / 10)-3;
			rozdil_max_min = maxU - minU;
			nab_pripojeno = 0;
			if(rozdil_max_min > 610 && minU > 2428){
				EEPROMzapis(minU,0x001004);
				EEPROMzapis(rozdil_max_min,0x001008);
			}else{
				rozdil_max_min = 610;
				minU = 2428;
			}
		}
	}else{
		nab_pripojeno = 1;
	}
}

void spanek (void){			//pot�ebn� p��pravy na sp�nek a samotn� sp�nek
	if(GPIO_ReadOutputDataBit(GPIOB, GPIO_Pin_2) == 4 && !wut){			//pokud je podsv�cen� displeje zapnurto 
			RTC_SetWakeUpCounter(23750);			//nastav �as vypnut� na 10 skund
			RTC_WakeUpCmd(ENABLE);
			RTC_ITConfig(RTC_IT_WUT, ENABLE);			//vypnut� podsv�cen� se provede v rutin� interruptu
			wut_vyp = 0;
		}else if(!wut_vyp){
			wut = 0;
			wut_vyp = 1;
			RTC_ITConfig(RTC_IT_WUT, DISABLE);
			RTC_WakeUpCmd(DISABLE);
		}
		vymaz = 0;
		TIM5_Cmd(DISABLE);			//vypni �asova� 5
		halt();			//zastav CPU
		TIM5_SetCounter(0);			//pokud dojde k interruptu probu� se a za�ni po��ta v �asova�i 5 od 0
		TIM5_Cmd(ENABLE);
	}
	



#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
