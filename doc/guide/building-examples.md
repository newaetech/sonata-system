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

## Running the build

>TODO: Check that CHERI build needs above environmental variables

To build, run the following from the root of the directory which will build the examples:

```
cmake -B sw/cheri/build -S sw/cheri
cmake --build sw/cheri/build
```

The build output is put in the `sw/cheri/build` directory.
Two files of interest are created for each target: an ELF file which has no extension and a `*.vmem` file. The
`*.vmem` file can be used to load directly into the FPGA bitstream, described in more detail on the [Programming the Sonata]()
page.

### Loading software onto the FPGA

You can load software onto the FPGA over USB (JTAG) using:

```sh
./util/mem_helper.sh load_program -e sw/cheri/build/tests/spi_test
```

>TODO: What should the user load first?

There are actually four different ways of loading the program - we normally use JTAG for development, but you can also
program it into the serial flash device on the board. See the page [Programming the Sonata Software](doc/dev/sw-programming.md)