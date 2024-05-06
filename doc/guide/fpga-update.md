# Reloading the FPGA Image

The first thing you should do before building the firmware is to get the latest version of the bitstream. The bitstream is your microcontroller
core, and defines things like what peripherals you have and where they are located in memory.

If your bitstream doesn't match the one defined in the repository, your software will fail. While you can build your own bitstream as described
in [FPGA Development](../dev/fpga-development.md), we recommend starting with our prebuilt bitstream first. Building the bitstream requires
installing Vivado which takes a large amount of hard drive space and requires a seperate manual installation process.

## Selecting a Bitstream

When the Sonata board is plugged in, it loads one of three bitstreams. This is selected by the switch below the USB port:

> TODO IMAGE WITH ARROW

The LEDs besides the switch show the current image selected as well for confirmation. We recommend using Slot 2 (the middle setting), leaving Slot 1 as our default image we shipped.

In case you have trouble with the board, you can quickly switch to Slot 1 to confirm the LCD, LEDs, and similar are all functioning correctly.

> TODO - do we want to recommend a different slot?

## Drag & Drop Programming

> TODO: Where is this bitstream located?

To program the Sonata bitstream:

1. Download `GOODSTUFF.bit` from SWEETURL.com
2. Select slot 2.
3. Plug in Sonata board. You should see a SONATA drive (see troubleshooting section).
4. Drag the updated `.bit` file and wait for the copy to complete (on Linux note the copy command may return immediately, so you need to wait until it's done.)
5. The board should automatically restart once the image is copied over. You should see the XXX LED come on:

TODO

## Troubleshooting

### Sonata Mass Storage Drive

The Sonata board when plugged in should show a mass storage drive with these files:

```

```

If the board has a RPI loader, visible because you'll see the files XXXX, you may need to reload the RP2040 as described in the [Sonata Board Updating Firmware] section.

The Sonata board will print status and messages to the `LOG.TXT` which can be helpful for debugging.

### Backup FPGA Programming

If for some reason the mass storage programming isn't working, you can also use the built-in FTDI JTAG programming. This requires the setup described in [FPGA Programming](../dev/fpga-programming.md) to build openFPGALoader:

```sh
openFPGALoader -c ft4232 GOODSTUFF.bit
```

Note this requires the `udev` setup described in [FPGA Programming](../dev/fpga-programming.md). If you are lazy you can just run the command as root instead (not recommended, but can be helpful for troubleshooting on VMs):

```sh
sudo openFPGALoader -c ft4232 GOODSTUFF.bit
```

>TODO GOODSTUFF.bit->realname.bit