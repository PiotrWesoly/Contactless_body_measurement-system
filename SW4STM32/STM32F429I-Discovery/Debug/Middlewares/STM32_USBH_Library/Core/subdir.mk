################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_core.c \
/Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ctlreq.c \
/Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ioreq.c \
/Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_pipes.c 

OBJS += \
./Middlewares/STM32_USBH_Library/Core/usbh_core.o \
./Middlewares/STM32_USBH_Library/Core/usbh_ctlreq.o \
./Middlewares/STM32_USBH_Library/Core/usbh_ioreq.o \
./Middlewares/STM32_USBH_Library/Core/usbh_pipes.o 

C_DEPS += \
./Middlewares/STM32_USBH_Library/Core/usbh_core.d \
./Middlewares/STM32_USBH_Library/Core/usbh_ctlreq.d \
./Middlewares/STM32_USBH_Library/Core/usbh_ioreq.d \
./Middlewares/STM32_USBH_Library/Core/usbh_pipes.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/STM32_USBH_Library/Core/usbh_core.o: /Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_core.c Middlewares/STM32_USBH_Library/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F429xx -DUSE_STM32F429I_DISCO -DUSE_USB_OTG_HS -DUSE_EMBEDDED_PHY -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F429I-Discovery -I../../../Middlewares/Third_Party/FatFs/src -I../../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../../Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/STM32_USBH_Library/Core/usbh_ctlreq.o: /Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ctlreq.c Middlewares/STM32_USBH_Library/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F429xx -DUSE_STM32F429I_DISCO -DUSE_USB_OTG_HS -DUSE_EMBEDDED_PHY -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F429I-Discovery -I../../../Middlewares/Third_Party/FatFs/src -I../../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../../Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/STM32_USBH_Library/Core/usbh_ioreq.o: /Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ioreq.c Middlewares/STM32_USBH_Library/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F429xx -DUSE_STM32F429I_DISCO -DUSE_USB_OTG_HS -DUSE_EMBEDDED_PHY -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F429I-Discovery -I../../../Middlewares/Third_Party/FatFs/src -I../../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../../Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/STM32_USBH_Library/Core/usbh_pipes.o: /Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_pipes.c Middlewares/STM32_USBH_Library/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F429xx -DUSE_STM32F429I_DISCO -DUSE_USB_OTG_HS -DUSE_EMBEDDED_PHY -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F429I-Discovery -I../../../Middlewares/Third_Party/FatFs/src -I../../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../../Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

