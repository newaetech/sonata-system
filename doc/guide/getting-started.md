# Getting started with Sonata Board

This guide helps you to get started with the Sonata board. This guide is based on building custom software, but because the core is a soft-core built
into the FPGA you can also modify this (to adjust for example the number of blocks such as SPI or UART). This is documented on the [FPGA Development](../dev/fpga-development.md) page. This requires additional setup *not* covered in this guide.

> The Sonata board is a prototype board and is under active development.
> This documentation is in the process of being updated.
> We will be improving the getting started guide soon to allow for an easier way with developing against the boards.

## Getting Started Steps

To get started with your Sonata board, there are a few steps you'll need to do:

1. Get the latest FPGA image that corresponds with the software you are building. This requires you to just drag the new `.bit` file onto the SONATA drive that comes up when you plug in the board to your computer.
2. Install the software toolchain.
3. Build the example code and download to the soft-core you loaded in step 1.
