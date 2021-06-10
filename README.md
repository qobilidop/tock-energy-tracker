# TET: A Proof-of-Concept Tock Energy Tracker
TET (Tock Energy Tracker) is built as a [course](https://patpannuto.com/classes/2021/spring/cse291/) project for [Tock](https://www.tockos.org/) to track energy consumption of individual board components and concurrently running apps.

This repo holds the experiments for this project. The actual TET implementation is hosted in [another repo](https://github.com/JFHwang/tock/tree/energy-tracker). The code to make figures for the report and other data analysis is contained in [analysis.ipynb](analysis.ipynb).

## Tock Versions
All relevant Tock versions are linked as Git submodules under the `extern` directory:
- tock-orig: This is the unmodified Tock code our development based on.
- tock-base: We removed the `ble_radio` capsule from the `nrf52840dk` board for a fairer comparison with our TET version.
- tock-tet: This is our development branch that holds the actual TET implementation.

## Setup

### Hardware
We develop for the [nRF52840 DK](https://www.nordicsemi.com/Software-and-Tools/Development-Kits/nRF52840-DK) board specifically. So it is required to run our code and reproduce the experiments.

### Software
To reproduce our work, [set up the environment to develop Tock as normal](https://github.com/tock/tock/blob/master/doc/Getting_Started.md). To check things are set up correctly, try:
```bash
make test-build
```

And you shall see
```
...
    Finished release [optimized + debuginfo] target(s) in 0.04s
   text    data     bss     dec     hex filename
 180225      68   24504  204797   31ffd /path/to/tock-energy-tracker/extern/tock-tet/target/thumbv7em-none-eabi/release/...  /path/to/tock-energy-tracker/extern/tock-tet/target/thumbv7em-none-eabi/release/nrf52840dk.bin
```

Then you could flash the board with:
```bash
make test-install
```
