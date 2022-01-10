################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Src/main.c \
/Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Src/stm32f4xx_it.c \
/Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Src/ts_calibration.c \
/Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Src/usbh_conf.c 

OBJS += \
./Example/User/main.o \
./Example/User/stm32f4xx_it.o \
./Example/User/ts_calibration.o \
./Example/User/usbh_conf.o 

C_DEPS += \
./Example/User/main.d \
./Example/User/stm32f4xx_it.d \
./Example/User/ts_calibration.d \
./Example/User/usbh_conf.d 


# Each subdirectory must supply rules for building sources it contributes
Example/User/main.o: /Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Src/main.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F429xx -DUSE_STM32F429I_DISCO -DUSE_USB_OTG_HS -DUSE_EMBEDDED_PHY -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F429I-Discovery -I../../../Middlewares/Third_Party/FatFs/src -I../../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../../Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/stm32f4xx_it.o: /Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Src/stm32f4xx_it.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F429xx -DUSE_STM32F429I_DISCO -DUSE_USB_OTG_HS -DUSE_EMBEDDED_PHY -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F429I-Discovery -I../../../Middlewares/Third_Party/FatFs/src -I../../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../../Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/ts_calibration.o: /Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Src/ts_calibration.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F429xx -DUSE_STM32F429I_DISCO -DUSE_USB_OTG_HS -DUSE_EMBEDDED_PHY -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F429I-Discovery -I../../../Middlewares/Third_Party/FatFs/src -I../../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../../Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/usbh_conf.o: /Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Src/usbh_conf.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F429xx -DUSE_STM32F429I_DISCO -DUSE_USB_OTG_HS -DUSE_EMBEDDED_PHY -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F429I-Discovery -I../../../Middlewares/Third_Party/FatFs/src -I../../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../../Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

