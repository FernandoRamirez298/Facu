################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../board/board.c \
../board/clock_config.c \
../board/peripherals.c \
../board/pin_mux.c 

OBJS += \
./board/board.o \
./board/clock_config.o \
./board/peripherals.o \
./board/pin_mux.o 

C_DEPS += \
./board/board.d \
./board/clock_config.d \
./board/peripherals.d \
./board/pin_mux.d 


# Each subdirectory must supply rules for building sources it contributes
board/%.o: ../board/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MKL46Z256VLL4_cm0plus -DCPU_MKL46Z256VLL4 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"D:\Documentos de fernando\Facu\Sitemas Digitales I\TPS\TP3\TP3\board" -I"D:\Documentos de fernando\Facu\Sitemas Digitales I\TPS\TP3\TP3\source" -I"D:\Documentos de fernando\Facu\Sitemas Digitales I\TPS\TP3\TP3" -I"D:\Documentos de fernando\Facu\Sitemas Digitales I\TPS\TP3\TP3\drivers" -I"D:\Documentos de fernando\Facu\Sitemas Digitales I\TPS\TP3\TP3\CMSIS" -I"D:\Documentos de fernando\Facu\Sitemas Digitales I\TPS\TP3\TP3\utilities" -I"D:\Documentos de fernando\Facu\Sitemas Digitales I\TPS\TP3\TP3\startup" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


