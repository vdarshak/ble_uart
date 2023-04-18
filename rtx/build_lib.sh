# Path to tool-chain
ARMGCC=/opt/arm-gcc
export PATH=$PATH:$ARMGCC/bin

# Tool-chain programs
CC=$ARMGCC/bin/arm-none-eabi-gcc
LD=$ARMGCC/bin/arm-none-eabi-ld
AR=$ARMGCC/bin/arm-none-eabi-ar
SIZE=$ARMGCC/bin/arm-none-eabi-size
OBJCOPY=$ARMGCC/bin/arm-none-eabi-objcopy

# ARM architecture specific compiler flags
ARCH="-mcpu=cortex-m4 -mthumb -mabi=aapcs -mfloat-abi=hard -mfpu=fpv4-sp-d16"

# Keep every function in a separate section, this allows linker to discard unused ones
OPT="-ffunction-sections -fdata-sections -fno-strict-aliasing -fno-builtin"

# Compiler flags
CFLAGS="-Iarch -I../bsplib -O3 -g3 -Wall -Werror $ARCH $OPT"

function acc()
{
    echo Compiling $1
    $CC -c $CFLAGS $1
}

# Compile the source files
acc os_systick.c
acc RTX_Config.c
acc rtx_delay.c
acc rtx_evflags.c
acc rtx_evr.c
acc rtx_kernel.c
acc rtx_lib.c
acc rtx_memory.c
acc rtx_mempool.c
acc rtx_msgqueue.c
acc rtx_mutex.c
acc rtx_semaphore.c
acc rtx_system.c
acc rtx_thread.c
acc rtx_timer.c
acc irq_armv7m.S

# Link the object code to form exectuable program
echo Generating librtx.a
/bin/rm -f librtx.a
$AR -r librtx.a \
    os_systick.o \
    RTX_Config.o \
    rtx_delay.o \
    rtx_evflags.o \
    rtx_evr.o \
    rtx_kernel.o \
    rtx_lib.o \
    rtx_memory.o \
    rtx_mempool.o \
    rtx_msgqueue.o \
    rtx_mutex.o \
    rtx_semaphore.o \
    rtx_system.o \
    rtx_thread.o \
    rtx_timer.o \
    irq_armv7m.o \

/bin/rm -f irq_armv7m.o \
    os_systick.o \
    RTX_Config.o \
    rtx_delay.o \
    rtx_evflags.o \
    rtx_evr.o \
    rtx_kernel.o \
    rtx_lib.o \
    rtx_memory.o \
    rtx_mempool.o \
    rtx_msgqueue.o \
    rtx_mutex.o \
    rtx_semaphore.o \
    rtx_system.o \
    rtx_thread.o \
