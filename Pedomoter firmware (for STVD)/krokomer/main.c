
//===================== IMPORTOVANÉ KNIHOVNY ==========
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

//======================== DEKLARACE ROMĚNNÝCH ============
volatile bool stav = 0;			//pro uložení stavu ovl. tlačítka - zají má nás hlavně kdy se rovná nule
volatile bool wut = 0;			//pro idikaci interruptu z wake up timeru
volatile bool odp = 0;			//pro idikaci interruptu při zapnutí nebo vypnutí nabíjení bterie
volatile bool dup = 0;			//pro idikaci interruptu z krokoměrového modulu
volatile bool preteceni = 0;			//idikuje přesáhnutí maximální hodnoty, která lze na LCD zobrazit
bool vymaz = 1;			//pomocná proměnná díky které se po vymazání rekordu/počtu kroků/rozsvícení nepřepne hodnota na následující v pořadí
bool nab_pripojeno = 0;			//nastaveno na 1 když je se baterie nenabíjí
bool wut_vyp = 0;			//pomocná promnná aby se wakeup timer natavoval jenom když není nastaven
bool zobrazeno0 = 0;			//tyto proměnné určují jestli se požadovaní hodnota má zobrazit nebo ne
bool zobrazeno1 = 0;
bool zobrazeno2 = 0;

int8_t menu = 0;			//určuje která hofdnota se má na LCD zobrazit
uint16_t maxU;			//proměnné pro výpočet napětí baterie
uint16_t rozdil_max_min = 611;			//ideální rozdíl min a max napětí baterie - hodnota přiřazená ude slouží jako pojistka kdyby v EEPROM nebyla nastavena 
uint16_t minU = 2429;			//ideální min hodnota napětí baterie - hodnota přiřazená ude slouží jako pojistka kdyby v EEPROM nebyla nastavena
int32_t vzorek;
volatile uint32_t kroky = 0;			//zde se zapisuje počet kroků
uint32_t rekord;			//sem se načte rekord uložený v EEPROM

//========================== DEKLARACE FUNKCÍ =============
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

//========================= POLE PRO OVLÁDÁNÍ LCD ===========
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

//======================== HLAVNÍ PROGRAM =============
void main(void)			//nastavení požívaných preriferií, hodinového signálu a interruptů
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

	if(EEPROMcteni(0x001008) != 0 && EEPROMcteni(0x001004) != 0){			//pokud máž v EEPROM zapsány referenční napětí prourčení stavubaterie tak si je načti a pracuj s nimi 
		rozdil_max_min = (uint16_t)EEPROMcteni(0x001008);
		minU = (uint16_t)EEPROMcteni(0x001004);
	}
	
  while (1){ //cyklus se provede vždy jen jednou a to když dojde k interruptu
		detekce_nabijeni();			//zkontroluj jestli není připojena nabíječka
		
		if (preteceni){			//zkontroluj jestli nedošlo k překročení maximálního početu kroků, které dokážeme zobrazit
			EEPROMzapis(99999, 0x001000);
			preteceni = 0;
		}
		
		if(GPIO_ReadInputDataBit(GPIOE,GPIO_Pin_6) != RESET){			//pokud je ovl. tlačítko puštěno stav je 0 a pokud šlo o probuzení interruptem z tlečítka pohni se v menu 
			stav = 0;
			if(!vymaz && !dup && !wut && !odp && (TIM5_GetCounter() > 8)){
				menu++;
				if (menu == 3){			// když je menu 3 tak se vrať zpět na nulu › točíme se v kruhu
					menu = 0;
				}
			}else{
				vymaz = 0;
			}
		}
		
		if(menu == 0){			//pokud chceme zobrazit menu 0 (aktuální počet kroků)
			if( TIM5_GetCounter() > 1000 && !vymaz && !dup && !wut){ //pokud držím tlačítko, uběhly 2s a mám povoleno vymazávání tak vymaž kroky a zakaž další vymazávání
				if (EEPROMcteni(0x001000) < kroky){			//překonali jsme rekord? pokud ano tak ho ulož do EEPROM
					EEPROMzapis(kroky,0x001000);
				}
				kroky = 0;
				zobrazeno0 = 0;			//zobraz smazané kroky na displeji
				vymaz = 1;
				TIM5_SetCounter(0);			//vynuluj časovač 
			}	
			
			if (dup || !zobrazeno0){			//udělali jsme krok nebo nebo jsme povolili zobrazení kroků tak zobraz aktuální počet kroků 
				cislanaLCD(kroky);
				zobraz_na_LCD();
				zobrazeno0 = 1;	
				dup = 0;
			}
			zobrazeno1 = 0;
			
		}else if(menu == 1){			// chceme se podívat na náš rekord
			if(TIM5_GetCounter() > 1333 && !vymaz && !dup && !wut){			//pokd držím tlačítko cca 4.5 sekundy tak vypaž rekord
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
		
		}else if(menu == 2){			//chceme vidět stav baterie
			if(!zobrazeno2 || odp){			//chceme zobrazit stav baterie na displeji
				if(!nab_pripojeno){			//baterie se nenabíjí - zobraz její procentuální stav
					cislanaLCD(baterie());
					zobraz_na_LCD();
				}else{			//baterie se nabíjí - zobraz pomlčka na displeji
					zobraz_pomlcky();
				}
				zobrazeno2 = 1;
			}
			
			if(TIM5_GetCounter() > 667 && !vymaz && !dup && !wut){			//pokud držím tlačítko cca 2 sekundy změň podsvícení displeje na opak aktuálního stavu
				GPIO_ToggleBits(GPIOB,GPIO_Pin_2);
				vymaz = 1;
				wut = 0;
				TIM5_SetCounter(0);
			}
			zobrazeno0 = 0;
		}
		
		odp = 0;
		dup = 0;
		
		if(!stav){			//pokud není ovl. tlačítko stisknuto předi do režimu spánku
			spanek ();
		}
	}
}
	
//=================== INTERRUPTOVÉ RUTINY ===========
INTERRUPT_HANDLER(EXTI7_IRQHandler,15)			//rutina pro obsluhu přerušení z modulu krokoměru
{
	kroky++;
	dup = 1;
	EXTI_ClearITPendingBit(EXTI_IT_Pin7);
	if (kroky > 99999){
		kroky = 0;
		preteceni = 1;
	}
}

INTERRUPT_HANDLER(EXTI6_IRQHandler,14)			//rutina pro obsluhu přerušení z ovl. tlačítka
{	
	stav = 1;
	EXTI_ClearITPendingBit(EXTI_IT_Pin6);
}

INTERRUPT_HANDLER(EXTI5_IRQHandler,13)			//rutina pro obsluhu přerušení při nabíjení
{	
	odp = 1;
	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
}

INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)			//rutina pro obsluhu přerušení časovače probuzení
{
	GPIO_WriteBit(GPIOB, GPIO_Pin_2, RESET);
	wut = 1;
	RTC_ClearITPendingBit(RTC_IT_WUT);
	//RTC_ClearFlag(RTC_FLAG_WUTF);
}

//==================== FUNKCE PRO NASTAVENÍ ============
void nastaveniCLK(void){			//nastavení hlavního zdroje hodinového signálu
	CLK_DeInit();			//vynuluj nastavení 
	CLK_LSICmd(ENABLE);			//zapni vnitřní oscilátor 38 kHz
	while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY)== RESET);			//dokud není zapnut počkej
	CLK_SYSCLKSourceSwitchCmd(ENABLE);			//zapni přepínání taktovacích hodin
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);			//změň taktovací hodiny na LSI
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);			//děličku LSI nastav ne jedna
	while(CLK_GetFlagStatus(CLK_FLAG_SWBSY)== SET);			//dokud není výměna taktovacích hodin dokončena tak čekej 
	CLK_SYSCLKSourceSwitchCmd(DISABLE);			//vypni možnost změnit taktovací hodiny
	CLK_HSICmd(DISABLE);			//vypni vsnitřní oscilátor 16 Mhz - moc velká spotřeba
	CLK_HaltConfig(CLK_Halt_FastWakeup, DISABLE);			//nastav jak se chovat při halt modu
	CLK_HaltConfig(CLK_Halt_SlowWakeup, ENABLE);
	}

void init_milis(void){			//nastavení časovače požívaného pro výpočet času
	TIM5_DeInit();			//vynuluj nastavení časovače 5
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM5, ENABLE);			//zapni přívod taktovacího signálu do časovače 5
	TIM5_TimeBaseInit(TIM5_Prescaler_128,TIM5_CounterMode_Up, 0xffff);			//děl příchozí taktovací signál 128, počít nahoru, počítej do 65535 (65536 taktů - začíná se od 0)
	TIM5_Cmd(ENABLE);			//zapni časovač 5
}

void nastaveniGPIO(void){			//nastavení pinů vstupů a výstupů
	GPIO_DeInit(GPIOC);			//resetuj nastavení požívaných portů
	GPIO_DeInit(GPIOE);
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOE, GPIO_Pin_6, GPIO_Mode_In_PU_IT);			//nastav E6 pro vstup ovl. tlačítka
	GPIO_Init(GPIOE, GPIO_Pin_7, GPIO_Mode_In_FL_IT);			//nastav E7 pro vstup krokoměrového modulu
	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_In_FL_IT);			//nastav C5 na detekci nabijeni
	GPIO_Init(GPIOC, GPIO_Pin_7, GPIO_Mode_In_FL_No_IT);			//nastav C7 pro čtení napeti baterie
	GPIO_Init(GPIOB, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Slow);			//nastav B2 jako výstup pro ovládání podsvícení dispelje
}

void nastaveniLCD (void){			//nastavení LCD driveru
	CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);			//zapni RTC hodiny jejichž hodinovým signálem bude LSI dělený 1
	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);			//zapni přívod hodinového signálu do LCD driveru
	RTC_WakeUpClockConfig(RTC_WakeUpClock_RTCCLK_Div16);			//nastav signál jsoucí do čítače pro automatické probuzení jako hodiny z RTC dělené 16
	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);			//přiveď hodinový signál do LCD driveru
	LCD_Init(LCD_Prescaler_1,LCD_Divider_16,LCD_Duty_1_4,LCD_Bias_1_3,LCD_VoltageSource_Internal);			//nastav LCD driver
	LCD_PortMaskConfig(LCD_PortMaskRegister_0,255);			//nastav vybrané piny jako vývody pro LCD
	LCD_PortMaskConfig(LCD_PortMaskRegister_1,15);
	LCD_ContrastConfig(LCD_Contrast_Level_5);			//nastav kontrast LCD
	LCD_Cmd(ENABLE);			//zapni LCD driver
}

void nastaveniINTERRUPTU(void){			//nastavení interruptů
	EXTI_DeInit();			//vymaž nastavvení interruptů
	EXTI_ClearITPendingBit(EXTI_IT_Pin7);			//vymaž bit signalizující interrupt na daném pinu
	EXTI_ClearITPendingBit(EXTI_IT_Pin6);
	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
	EXTI_SetPinSensitivity(EXTI_Pin_7,EXTI_Trigger_Rising);			//nastav kdy se generuje interrupt na daném pinu - z modulu krokměru
	EXTI_SetPinSensitivity(EXTI_Pin_6,EXTI_Trigger_Falling);			//z ovl. tlačítka
	EXTI_SetPinSensitivity(EXTI_Pin_5,EXTI_Trigger_Rising_Falling);			//interrupt z C5 - detekce nabijeni
	ITC_SetSoftwarePriority(EXTI6_IRQn,ITC_PriorityLevel_3);			//nastav prioritu přerušení
	ITC_SetSoftwarePriority(EXTI5_IRQn,ITC_PriorityLevel_3);
	ITC_SetSoftwarePriority(EXTI7_IRQn,ITC_PriorityLevel_1);
}

void nastaveniADC(void){			//nastavení ADC převodníku
	ADC_DeInit(ADC1);			//vymaž nastavení ADC přeodníku
	ADC_Init(ADC1, ADC_ConversionMode_Single, ADC_Resolution_12Bit, ADC_Prescaler_2);			//nastav jak bude ADC fungovt: vezme pouze jeden vzorek, rozlišení 12 b frekvence vzorkoání je taktovací signál /2
	ADC_SchmittTriggerConfig(ADC1,ADC_Channel_3,DISABLE);			//vypni schmittuv přepínač na pinu 7
	ADC_SamplingTimeConfig(ADC1,ADC_Group_SlowChannels, ADC_SamplingTime_4Cycles);			//nastavení času pro oedbírání jednoho vzorku
}

//======================= OSTATNÍ FUNKCE =============
void ADC (bool stav){			//zapnutí a připravení ADC na převod (to vše kvůli spotřebě)
	if (stav){			//když bylo ovl. tlačítko stisknuto
		CLK_HSICmd(ENABLE);			//nastav taktovací signál z LSI oscilátoru na HSI protože LSI je pro ADC příliš pomalý (min f ADC kolme 400 kHz)
		while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY)== RESET);
		CLK_SYSCLKSourceSwitchCmd(ENABLE);
		CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
		CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_16);
		while(CLK_GetFlagStatus(CLK_FLAG_SWBSY)== SET);
		CLK_SYSCLKSourceSwitchCmd(DISABLE);
		CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);			//spuštění ADC
		ADC_Cmd(ADC1, ENABLE);
		ADC_ChannelCmd(ADC1,ADC_Channel_3, ENABLE);
		_delay_us(7);
	}else{
		while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY)== RESET);			//nastav taktovací signál zpět
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

void cislanaLCD (uint32_t cislo){			//příprava čísel na zobrazení na LCD
	uint8_t i;
	uint16_t delitel= 10000;
	
	for (i = 0; i != 5; i++){			//rozdělí číslo na jednoky desítky stovky...
		if (cislo < 100000){
			cislanaseg[i] = cislo/delitel;
			cislo = cislo % delitel;
			delitel = delitel/10;
		}
	}
}

void zobraz_na_LCD(void){			//zobrazení čísel na LCD
	uint8_t i;
	uint8_t x;
	uint8_t y;
	uint8_t posunute;
	uint8_t pomoc;
	uint8_t pocetpred1 =0 ;
	uint8_t pocetpo1 = 0;
	uint8_t celkovyvysledek [8][2] = {{1,0b00000000},{4,0b0000000},{8,0b0000000},{11,0b0000000},{0,0b00000000},{3,0b0000000},{7,0b00000000},{10,0b0000000}};
	bool nezobrazovat = 0;
	
	for (i = 0; i != 5; i++){			//cyklus pro zpracování 5 čísel
		
		if (cislanaseg[0] == 0 && cislanaseg[1] == 0 && cislanaseg[2] == 0 && cislanaseg[3] == 0 && cislanaseg[4] == 0){			//ošetření pro zobrazování nul
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
		
		for (x = 0; x != 4; x++){			//každé jedno číslo je zapisováno pomocí 4 registrů protože máme 4 comy
			
			posunute = vyber[cislanaseg[i]][x][1];			//vezme předpis daneého čísla pro první pozici na displeji a podle pozice právě zpracovávaného čísla ji posune tak aby se zprávně zobrazovaly na řádech jednotek desítek stovek...
			pomoc = posunute;
			
			while (pomoc){			//zajištění správnosti bitová rotace
				pomoc &= (pomoc -1);
				pocetpred1 ++;
			}
			
			pomoc = posunute >> posun[i];
			
			while (pomoc){
				pomoc &= (pomoc -1);
				pocetpo1 ++;
			}
			
			posunute =  posunute >> posun[i] | posunute << 8u-posun[i];			//bitová rotace
			
			if (pocetpred1 == pocetpo1){			//úprava pro zápis do registrů
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
			for (y = 0; y != 8; y++){			//uložení mezivýsledku
			celkovyvysledek[y][1] = celkovyvysledek[y][1] | vysledek[y][1];
			vysledek[y][0] = 0;
			vysledek[y][1] = 0;
		}
	}
	LCD_ClearFlag();			//ukládáí dat do jednotlivých registrů
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

void zobraz_pomlcky(void){			//zobrazení pomlček na LCD
	LCD_WriteRAM(LCD_RAMRegister_8, 0);			//ulož do LCD registrů data pro zobrazení pomlček
	LCD_WriteRAM(LCD_RAMRegister_0, 0 );
	LCD_WriteRAM(LCD_RAMRegister_1, 0 );
	LCD_WriteRAM(LCD_RAMRegister_3, 0b01010000 );
	LCD_WriteRAM(LCD_RAMRegister_4, 0 );
	LCD_WriteRAM(LCD_RAMRegister_7, 0 );
	LCD_WriteRAM(LCD_RAMRegister_8, 0 );
	LCD_WriteRAM(LCD_RAMRegister_10, 0 );
	LCD_WriteRAM(LCD_RAMRegister_11, 0 );
}

void EEPROMzapis(uint32_t zapsat,uint32_t adresa){			//ukládání do EEPROM
	FLASH_Unlock(FLASH_MemType_Data);			//odemkni zabezpečenou EEPROM
	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL)== RESET);			//dokud není připravená čekej
	if(sizeof(zapsat) > 1){			//na základě dané adresy zapiš buť jeden Byte nebo celé slovo (4 B)
		FLASH_ProgramWord(adresa, zapsat);
	}else{
		uint8_t zapsat = (uint8_t)zapsat;
		FLASH_ProgramByte(adresa,zapsat);
	}
	while(FLASH_GetFlagStatus(FLASH_FLAG_EOP)== RESET);
	FLASH_Lock(FLASH_MemType_Data);			//zamkli EEPROM
}

uint32_t EEPROMcteni(uint32_t adresa){			// čtení z EEPROM
	uint32_t precteno = 0;	
	uint8_t byte = 0;
	int8_t i;
	FLASH_Unlock(FLASH_MemType_Data);			//odemkni EEPROM
	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL)== RESET);		//dokud není připravená čekej

	for (i=4; i>0; i--){			//umíme číst jenom po Bytu ne po slovech proto požijeme cyklus
		byte = FLASH_ReadByte(adresa);
		precteno = precteno | (byte<<((i-1)*8));
		adresa++;
	}
	FLASH_Lock(FLASH_MemType_Data);			//zamči EEPROM
	return precteno;			//hodnotou to funkce je přečtená hodnota
}

uint8_t baterie (void){			//zjištění stavu baterie
	uint8_t i;
	ADC(1);			//zapni a připrav ADC
	for (i = 0; i < 3; i++){			//vezmi třetí vzorek - pár vzorků trvá než se hodnota ustálí
		ADC_SoftwareStartConv(ADC1);			//začni převod
		while(ADC_GetFlagStatus(ADC1,ADC_FLAG_EOC) == RESET);			//dokud není vzorek zpracován čekej
		vzorek =  ADC_GetConversionValue(ADC1);			//získej převedenou hodnotu
		ADC_ClearFlag(ADC1, ADC_FLAG_EOC);			//převod ukončen
	}
	ADC(0);			//vypni ADC
							//přepočet napětí baterie na procentuální stav naterie
	vzorek = vzorek - minU;		//rozpětí se musí pohybovat od 3.4V (- baterie vybita) až po 4.2V (plně nabita) jinak by se procenta počítala z celéo rozsahu 0 - 4.2
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
	return vzorek;			//funkce nabývá procentuální hodnoty napětí baterie
}

void detekce_nabijeni (void){			//nabíjí se baterie?
	if(GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_5)!= RESET){			//baterie se nenabíjí
		if(nab_pripojeno){			//pokud se před chvílí nabíjela odeber vozrek napětí a ulož ho jako referenční hodnotu do EEPROM
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

void spanek (void){			//potřebné přípravy na spánek a samotný spánek
	if(GPIO_ReadOutputDataBit(GPIOB, GPIO_Pin_2) == 4 && !wut){			//pokud je podsvícení displeje zapnurto 
			RTC_SetWakeUpCounter(23750);			//nastav čas vypnutí na 10 skund
			RTC_WakeUpCmd(ENABLE);
			RTC_ITConfig(RTC_IT_WUT, ENABLE);			//vypnutí podsvícení se provede v rutině interruptu
			wut_vyp = 0;
		}else if(!wut_vyp){
			wut = 0;
			wut_vyp = 1;
			RTC_ITConfig(RTC_IT_WUT, DISABLE);
			RTC_WakeUpCmd(DISABLE);
		}
		vymaz = 0;
		TIM5_Cmd(DISABLE);			//vypni časovač 5
		halt();			//zastav CPU
		TIM5_SetCounter(0);			//pokud dojde k interruptu probuď se a začni počíta v časovači 5 od 0
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

