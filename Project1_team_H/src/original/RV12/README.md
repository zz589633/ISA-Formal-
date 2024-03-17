## Product Brief

The RV12 is a highly configurable single-issue, single-core RV32I, RV64I
compliant RISC CPU intended for the embedded market. The RV12 is a member of the
Roa Logic’s 32/64bit CPU family based on the industry standard [RISC-V
instruction set](https://riscv.org/)

The RV12 implements a Harvard architecture for simultaneous instruction and data
memory accesses. It features an optimizing 6-stage pipeline, which
optimizes overlaps between the execution and memory accesses, thereby reducing
stalls and improving efficiency.

Optional features include Branch Prediction, Instruction Cache, Data Cache, and
Debug Unit. Parameterised and configurable features include the instruction and
data interfaces, the branch-prediction-unit configuration, and the cache size,
associativity, and replacement algorithms. Providing the user with trade offs
between performance, power, and area to optimize the core for the application

![RV12 RISC-V Architecture](assets/img/RV12_Arch.png)

## Documentation

- [RV12 Datasheet](DATASHEET.md)
  - [PDF Format Datasheet](docs/RoaLogic_RV12_RISCV_Datasheet.pdf)

## Features

- Royalty Free Industry standard instruction set (www.riscv.org)
- Parameterized 32/64bit data
- Fast, precise interrupts
- Custom instructions enable integration of proprietary hardware accelerators
- Single cycle execution
- Optimizing folded 6-stage pipeline
- Memory Protection Support
- Optional/Parameterized branch-prediction-unit
- Optional/Parameterized caches

## Compatibility

The RV12 is compatible with the following RISC-V Foundation  specifications:

- [User Mode Specifications v2.2](https://github.com/riscv/riscv-isa-manual/releases/download/riscv-user-2.2/riscv-spec-v2.2.pdf)
- [Privilege Mode Specifications v1.10](https://github.com/riscv/riscv-isa-manual/blob/master/release/riscv-privileged-v1.10.pdf)

## Interfaces

- AHB3 Lite

## Parameters

The following parameters control the feature set of a specific implementation of
the RV12:

| Parameter               |  Type   |     Default     | Description                                                  |
| :---------------------- | :-----: | :-------------: | :----------------------------------------------------------- |
| `JEDEC_BANK`            | Integer |      0x0A       | JEDEC Bank                                                   |
| `JEDEC_MANUFACTURER_ID` | Integer |      0x6E       | JEDEC Manufacturer ID                                        |
| `XLEN`                  | Integer |       32        | Datapath width                                               |
| `PLEN`                  | Integer |     `XLEN`      | Physical Memory Address Size                                 |
| `PMP_CNT`               | Integer |       16        | Number of Physical Memory Protection Entries                 |
| `PMA_CNT`               | Integer |       16        | Number of Physical Menory Attribute Entries                  |
| `HAS_USER`              | Integer |        0        | User Mode Enable                                             |
| `HAS_SUPER`             | Integer |        0        | Supervisor Mode Enable                                       |
| `HAS_HYPER`             | Integer |        0        | Hypervisor Mode Enable                                       |
| `HAS_RVM`               | Integer |        0        | “M” Extension Enable                                         |
| `HAS_RVA`               | Integer |        0        | “A” Extension Enable                                         |
| `HAS_RVC`               | Integer |        0        | “C” Extension Enable                                         |
| `HAS_BPU`               | Integer |        1        | Branch Prediction Unit Control Enable                        |
| `IS_RV32E`              | Integer |        0        | RV32E Base Integer Instruction Set Enable                    |
| `MULT_LATENCY`          | Integer |        0        | Hardware Multiplier Latency (if “M” Extension enabled)       |
| `ICACHE_SIZE`           | Integer |       16        | Instruction Cache size in Kbytes                             |
| `ICACHE_BLOCK_SIZE`     | Integer |       32        | Instruction Cache block length in bytes                      |
| `ICACHE_WAYS`           | Integer |        2        | Instruction Cache associativity                              |
| `ICACHE_REPLACE_ALG`    | Integer |        0        | Instruction Cache replacement algorithm 0: Random 1: FIFO 2: LRU |
| `DCACHE_SIZE`           | Integer |       16        | Data Cache size in Kbytes                                    |
| `DCACHE_BLOCK_SIZE`     | Integer |       32        | Data Cache block length in bytes                             |
| `DCACHE_WAYS`           | Integer |        2        | Data Cache associativity                                     |
| `DCACHE_REPLACE_ALG`    | Integer |        0        | Data Cache replacement algorithm 0: Random 1: FIFO 2: LRU    |
| `HARTID`                | Integer |        0        | Hart Identifier                                              |
| `PC_INIT`               | Address |     `h200`      | Program Counter Initialisation Vector                        |
| `MNMIVEC_DEFAULT`       | Address | `PC_INIT-‘h004` | Machine Mode Non-Maskable Interrupt vector address           |
| `MTVEC_DEFAULT`         | Address | `PC_INIT-‘h040` | Machine Mode Interrupt vector address                        |
| `HTVEC_DEFAULT`         | Address | `PC_INIT-‘h080` | Hypervisor Mode Interrupt vector address                     |
| `STVEC_DEFAULT`         | Address | `PC_INIT-‘h0C0` | Supervisor Mode Interrupt vector address                     |
| `UTVEC_DEFAULT`         | Address | `PC_INIT-‘h100` | User Mode Interrupt vector address                           |
| `BP_LOCAL_BITS`         | Integer |       10        | Number of local predictor bits                               |
| `BP_GLOBAL_BITS`        | Integer |        2        | Number of global predictor bits                              |
| `BREAKPOINTS`           | Integer |        3        | Number of hardware breakpoints                               |
| `TECHNOLOGY`            | String  |    `GENERIC`    | Target Silicon Technology                                    |

## License

Released under the RoaLogic [Non-Commercial License](/LICENSE.md)

## Dependencies 
Requires the Roa Logic [Memories IPs](https://github.com/RoaLogic/memory) and [AHB3Lite Package](https://github.com/RoaLogic/ahb3lite_pkg). These are included as submodules. 

After cloning the RV12 git repository, perform a `git submodule init` to download the submodules.
