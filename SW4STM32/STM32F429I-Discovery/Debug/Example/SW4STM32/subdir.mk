################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
/Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/SW4STM32/startup_stm32f429xx.s 

OBJS += \
./Example/SW4STM32/startup_stm32f429xx.o 

S_DEPS += \
./Example/SW4STM32/startup_stm32f429xx.d 


# Each subdirectory must supply rules for building sources it contributes
Example/SW4STM32/startup_stm32f429xx.o: /Users/piotrwesoly/STM32CubeIDE/workspace_1.7.0/LTDC_Paint/SW4STM32/startup_stm32f429xx.s Example/SW4STM32/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

