# Evaluation Scripts

## Guide for First Use

- In `common-perf.sh`, change `perf` executable path and items to record
  
- Write workload drivers, see below for details
  
- Follow the **Guide for Each Run**
  

## Guide for Each Run

- In `config.sh`, edit batch identifier (`TAG`), and select execution core (`COMMON`)
  
- Run your workload driver
  
- If you need to download results for inspection:
  
  - Just download `results/` folder
    
  - If you want to save some bandwidth, run `slim-result.sh` and download `results-slim/` folder it generated.
    

## How to Write A Driver

Use this template, see `w-parsec-gcc.sh` or `w-tailbench-impl.sh` for examples

```bash
#!/usr/bin/env bash

SUFFIX="-<workload_identifier>"

source ./init.sh # invoke the init script

function pre_hook { 
  :; # if you want to run some command before starting the benchmark, write them here
}

function post_hook {
  :; # if you want to run some command right after starting the benchmark, write them here
}

COMMAND="<command to start workload>"

source ./common.sh # invoke the execution engine
```

## How to Use Drivers

- You can directly execute a driver
  
- Or you can use script to run drivers serially (see `w-parsec.sh`, `w-tailbench.sh` and `w-all.sh`)
  

## Result Folder Structure

- Results will be stored into `results/` folder
  
- The naming convention is `<date>-<unix_timestamp>-<workload_id>-<batch_id>`, e.g. `2023-06-09-1686365528-parsec-fluidanimate-firstbatch`
  
- You can use this Perl Compatible Regular Expressions (PCRE) to parse sane folder names:
  

```regex
^(?<date>\d+-\d+-\d+)-(?<time>\d+)-(?<app>.*)-(?<batch>\w+)$
```

- Each sub-folder will contain `perf.data` (raw data, binary) and `perf.log` (mixed application output and `perf` output, plain text, in time order)
  
- You can use this PCRE to filter `perf` output from `perf.log`:
  

```regex
^ +(?<time>\d+(?:\.\d+)?) +(?<count>[0-9,]+(?:\.\d+)?) +(?:(?<unit>msec|) +)?(?<name>[^ ]+)(?: +# +(?<comment>(?:[^ ]| [^ ])+))?(?: +\((?<percent>\d+(?:\.\d+)?%)\))?$
```

## Files

### User Facing Files

`config.sh`: Execution configuration

- `TAG`: A suffix for result folders, used to distinguish run batches
  
- `CREATE_OUTPUT`: Should the scripts create output folders (if no, you should manually create them)
  
- `COMMON`: Which execution core to invoke (`./common-perf.sh` or `./common-plain.sh`)
  

`slim-result.sh`: Give you a "slimmed" ***copy*** of the result folder, i.e. only keep human readable results

`w-*.sh`: Run workloads

### Framework Files

`init.sh`: Execution core initializer

`common.sh`: Execution core implementation

`common-perf.sh`: Execution core for `perf`-driven workloads

- `PERF_PATH`: Path to your `perf` executable
  
- `PERF_ITEMS`: Event items for `perf`
  

`common-plain.sh`: Execution core for running workload with core affinity
