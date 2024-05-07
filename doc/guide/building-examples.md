# Building Examples

You will need a copy of [CHERIoT RTOS](https://github.com/microsoft/cheriot-rtos/tree/main) for this section:

```sh
git clone https://github.com/microsoft/cheriot-rtos.git
```

**IMPORTANT**: Set these two environmental variables. The first should point to the llvm build you did in the previous part,
and the second should point to the `cheriot-rtos` repo you just checked out:

```sh
export CHERIOT_LLVM_ROOT=/path/to/cheriot-llvm/bin
export CHERIOT_RTOS_SDK=/path/to/cheriot-rtos/sdk
```

The following assume you have run the `source .venv/bin/activate` command in the terminal you are using, and you are
currently at the root directory of your local `sonata-system` git repository.

## Capability sanity check

### Building Example

```sh
pushd sw/cheri/cheri_sanity
make
popd
```

This should produce XXXXXX

> HINT: If you don't have the environmental variables defined, you can also pass the paths to the make command itself:
> `make CHERIOT_LLVM_ROOT=/path/to/cheriot-llvm/bin CHERIOT_RTOS_SDK=/path/to/cheriot-rtos/sdk`

### Programming Software

>TODO FINISH THIS

There are four ways of programming the software:

1. You can use the flash storage on the Sonata board. This does not require special tools and allows an image to come
   online automatically at boot.

2. You can use OpenOCD to program the image onto RAM and then run this image. This is typically used during development.

3. You can use the CHERIoT serial bootloader. This loads the image into RAM on the CHERIoT system and then runs the image.

4. You can 'splice' the software into the FPGA image. This provides a single 'bitstream' including both hardware definition and software.
  This can be helpful for making system images that come alive as soon as possible after boot.