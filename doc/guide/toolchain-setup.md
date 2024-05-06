# Setting up the Toolchain for Software Development

## Software

All those special CHERIoT goodness comes with it's own compiler that understands how to use them. For this reason you'll need to build your
own toolchain.

### Python

Setting up your Python environment:
```sh
# Setup python venv
python3 -m venv .venv
source .venv/bin/activate

# Install python requirements
pip3 install -r python-requirements.txt
```

### Toolchain

> HINT: You can see all the commands used to setup the test running in the
> [CI YAML file](https://github.com/CHERIoT-Platform/llvm-project/blob/cheriot/.cirrus.yml). This provides a set of commands that
> is tested on each commit, in case you are having trouble building anything and want to see the expected output.

Here are the insructions I used to build the LLVM toolchain:
```sh
# Checkout the repository
git clone --depth 1 https://github.com/CHERIoT-Platform/llvm-project cheriot-llvm
cd cheriot-llvm
git checkout cheriot
# Create build directory
export LLVM_PATH=$(pwd)
mkdir -p builds/cheriot-llvm
cd builds/cheriot-llvm
# Build the toolchain
cmake ${LLVM_PATH}/llvm -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld" -DCMAKE_INSTALL_PREFIX=install -DLLVM_ENABLE_UNWIND_TABLES=NO -DLLVM_TARGETS_TO_BUILD=RISCV -DLLVM_DISTRIBUTION_COMPONENTS="clang;clangd;lld;llvm-objdump;llvm-objcopy" -G Ninja
export NINJA_STATUS='%p [%f:%s/%t] %o/s, %es'
ninja install-distribution
```
