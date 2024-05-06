# Building Examples


> TODO: This section is especially incomplete.
>
>

### Building capability sanity check
You will need a copy of [CHERIoT RTOS](https://github.com/microsoft/cheriot-rtos/tree/main) for this section.

Building the software:
```sh
pushd sw/cheri/cheri_sanity
make CHERIOT_LLVM_ROOT=/path/to/cheriot-llvm/bin CHERIOT_RTOS_SDK=/path/to/cheriot-rtos/sdk
popd
```
