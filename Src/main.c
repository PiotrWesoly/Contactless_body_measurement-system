/**
  ******************************************************************************
  * @file    LTDC_Paint/Src/main.c 
  * @author  Piotr Wesoły
  * @brief   Main program body
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
//#define BOOL char
//#define TRUE '1'
//#define FALSE '0'

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
uint16_t* imageBufferPtr = LCD_FRAME_BUFFER;
//uint8_t spi_data[12846] = {0};
uint16_t spi_data[6423] = {0};
SPI_HandleTypeDef hspi4;
int isEndOfFrame = 0;

/* Private function prototypes -----------------------------------------------*/
static void SystemClock_Config(void);
static void Error_Handler(void);
static void MX_SPI4_Init(void);
static void testDisplay(void);
static void sendDataToSDRAM(uint16_t* dataPtr);
static void receiveDataFromCamera(void);
static int findEndOfFrame(uint16_t* dataPtr);

/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program
  * @param  None
  * @retval None
  */
int main(void)
{
  /* STM32F4xx HAL library initialization:
       - Configure the Flash prefetch, instruction and Data caches
       - Configure the Systick to generate an interrupt each 1 msec
       - Set NVIC Group Priority to 4
       - Global MSP (MCU Support Package) initialization
     */
  HAL_Init();

  /* Configure the system clock to 168 MHz */
  SystemClock_Config(); 
    
  /* Configure LED3 and LED4 */
  BSP_LED_Init(LED3);
  BSP_LED_Init(LED4);
  
  MX_SPI4_Init();

  /*##-1- LCD Initialization #################################################*/ 
  /* Initialize the LCD */
  BSP_LCD_Init();

  /* Layer2 Init */
  BSP_LCD_LayerDefaultInit(1, LCD_FRAME_BUFFER_LAYER1);
  /* Set Foreground Layer */
  BSP_LCD_SelectLayer(1);
  /* Clear the LCD */
  //BSP_LCD_Clear(LCD_COLOR_WHITE);
  //  BSP_LCD_SetColorKeying(1, LCD_COLOR_WHITE);
  // BSP_LCD_SetLayerVisible(1, DISABLE);
  
  /* Layer1 Init */
//  BSP_LCD_LayerDefaultInit(0, LCD_FRAME_BUFFER_LAYER0);
  
  /* Set Foreground Layer */
  //BSP_LCD_SelectLayer(1);
 
  /* Enable The LCD */
  BSP_LCD_DisplayOn();


  /* Clear the LCD */
  BSP_LCD_Clear(LCD_COLOR_WHITE);

  testDisplay(); //shows moving colors in 80x80 window


  /* Infinite loop */  
  while (1)
  { 
	  HAL_Delay(100);
	  while(HAL_GPIO_ReadPin(GPIOE, GPIO_PIN_4))        //wait until NSS (CS) pin changes from high to low
	  {
		  if(HAL_GPIO_ReadPin(GPIOE, GPIO_PIN_4) == 0)    //check if NSS (CS) pin is low
		  {
			  receiveDataFromCamera();
			  isEndOfFrame = findEndOfFrame(&spi_data[0]);     //check if the whole data was received by checking if the footer is there
			  if(isEndOfFrame == 1)
			  {
				  BSP_LED_On(LED3);                           //if footer is there, signalize by setting LED3 on
				  while(1);
			  }
		  }
	  }
  }
}

/**
  * @brief  This function starts the receving data from camera using SPI4 
  * @param  None
  * @retval None
  */
static void receiveDataFromCamera(void)
{
	HAL_SPI_Receive(&hspi4, (uint8_t*)spi_data, 6423, 200);
}

/**
  * @brief  This function sends data from dataPtr to the SDRAM 0xD0000000
  * @param  dataPtr
  * @retval None
  */
static void sendDataToSDRAM(uint16_t* dataPtr)
{
	 for(int i = 0; i<80*80; i++)
	  {
		  *(imageBufferPtr+i)=*(dataPtr+i);
	  }
}

/**
  * @brief  This function checks if the footer of the camera image is in dataPtr
  * @param  dataPtr
  * @retval None
  */
static int findEndOfFrame(uint16_t* dataPtr)
{

	for(int i=0; i<12842; i++)
	{
		if(*(dataPtr+i)== 0u)
		{
			if(*(dataPtr+i+1)== 0x55)
			{
				if(*(dataPtr+i+2)== 0xC6)
				{
					return 1;
				}
			}
		}
	}
	return 0;
}

/**
  * @brief  This function tests the LCD by displaying 80x80 image of moving colors
  * @param  None
  * @retval None
  */
static void testDisplay(void)
{
  uint16_t colorVar = 1u;	// 0b0000011111100000 rrrrrggggggbbbbb green
  int col = 0u;
  int row = 0u;
  
  for(int i = 0; i<20; i++)
  {
    HAL_Delay(100);

    for( row = 0; row<80; row++)
    {
	    for( col = 0; col<80; col++)
	    {
		    *(imageBufferPtr+(col+(row*80)))=colorVar;
	    }
	    colorVar=colorVar<<1;
	    if(colorVar == 1u<<15u)
		  colorVar =1u;
    }
  col=0u;
  row=0u;
  }
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @param  None
  * @retval None
  */
static void Error_Handler(void)
{
  /* Turn LED4 on */
  BSP_LED_On(LED4);
  while(1)
  {
  }
}

/**
  * @brief  SPI4 initialziation by setting up parameters and hardware configuration
  * @param  dataPtr
  * @retval None
  */
static void MX_SPI4_Init(void)
{
  /* SPI4 parameter configuration*/

  hspi4.Instance = SPI4;
  hspi4.Init.Mode = SPI_MODE_SLAVE;
  hspi4.Init.Direction = SPI_DIRECTION_2LINES_RXONLY;
  hspi4.Init.DataSize = SPI_DATASIZE_16BIT;
  hspi4.Init.CLKPolarity = SPI_POLARITY_HIGH;
  hspi4.Init.CLKPhase = SPI_PHASE_2EDGE;
  hspi4.Init.NSS = SPI_NSS_SOFT;
  hspi4.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi4.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi4.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi4.Init.CRCPolynomial = 10;
  if (HAL_SPI_Init(&hspi4) != HAL_OK)
  {
    Error_Handler();
  }

  /* SPI4 hardware configuration*/

  GPIO_InitTypeDef GPIO_InitStruct = {0};
  if(hspi4.Instance==SPI4)
  {
    /* Peripheral clock enable */
    __HAL_RCC_SPI4_CLK_ENABLE();

    __HAL_RCC_GPIOE_CLK_ENABLE();
    /**SPI4 GPIO Configuration
    PE2     ------> SPI4_SCK
    PE4     ------> SPI4_NSS
    PE6     ------> SPI4_MOSI
    */
    GPIO_InitStruct.Pin = GPIO_PIN_2|GPIO_PIN_4|GPIO_PIN_6;
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
    GPIO_InitStruct.Alternate = GPIO_AF5_SPI4;
    HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);
  }

}

/**
  * @brief  System Clock Configuration
  *         The system Clock is configured as follow : 
  *            System Clock source            = PLL (HSE)
  *            SYSCLK(Hz)                     = 168000000
  *            HCLK(Hz)                       = 168000000
  *            AHB Prescaler                  = 1
  *            APB1 Prescaler                 = 4
  *            APB2 Prescaler                 = 2
  *            HSE Frequency(Hz)              = 8000000
  *            PLL_M                          = 8
  *            PLL_N                          = 336
  *            PLL_P                          = 2
  *            PLL_Q                          = 7
  *            VDD(V)                         = 3.3
  *            Main regulator output voltage  = Scale1 mode
  *            Flash Latency(WS)              = 5
  * @param  None
  * @retval None
  */
static void SystemClock_Config(void)
{
  RCC_ClkInitTypeDef RCC_ClkInitStruct;
  RCC_OscInitTypeDef RCC_OscInitStruct;

  /* Enable Power Control clock */
  __HAL_RCC_PWR_CLK_ENABLE();
  
  /* The voltage scaling allows optimizing the power consumption when the device is 
     clocked below the maximum system frequency, to update the voltage scaling value 
     regarding system frequency refer to product datasheet.  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
  
  /* Enable HSE Oscillator and activate PLL with HSE as source */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 336;
  RCC_OscInitStruct.PLL.PLLP = 2;
  RCC_OscInitStruct.PLL.PLLQ = 7;
  HAL_RCC_OscConfig(&RCC_OscInitStruct);

  /* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2 
     clocks dividers */
  RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;  
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;  
  HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5);
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
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

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
