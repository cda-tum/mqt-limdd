[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://opensource.org/licenses/MIT)
![C++ Workflow](https://github.com/cda-tum/mqt-limdd/actions/workflows/cmake.yml/badge.svg)

# MQT LIMDD - A quantum circuit simulator based on decision diagrams written in C++

> [!IMPORTANT]
> This simulator uses LIMDD type decision diagrams which only cover a subset of functionality available in [mqt-ddsim](https://github.com/cda-tum/mqt-ddsim) and [mqt-core](https://github.com/cda-tum/mqt-limdd).

A tool for classical quantum circuit simulation developed as part of the [_Munich Quantum Toolkit_](https://mqt.readthedocs.io) (_MQT_)[^1] by the [Chair for Design Automation](https://www.cda.cit.tum.de/) at the [Technical University of Munich](https://www.tum.de/).
It builds upon [MQT Core](https://github.com/cda-tum/mqt-core), which forms the backbone of the MQT.

## Building

```
mkdir build
cd build
cmake ..
cmake --build .
```

## Usage

The simulator comes with a stand alone executable that takes input via the command line and output their results as json object.

The following example assumes the simulator has been build from source in the `build/` directory.
Afterwards, there will be an executable `ddsim_simple` in `build/apps/` which can be used to simulate (among others) OpenQASM files. All executables support the `--help` parameter to list their options.

```
build/apps/ddsim_simple --help
MQT LIMDD by https://www.cda.cit.tum.de/ -- Allowed options:
  -h [ --help ]          produce help message
  --shots arg            number of measurements (if the algorithm
                         does not contain non-unitary gates, weak
                         simulation is used) (default: 0)
  --ps                   print simulation stats (applied gates, sim.
                         time, and maximal size of the DD)
  --simulate_file arg    simulate a quantum circuit given by file
                         (detection by the file extension)
[...]

build/apps/ddsim_simple --shots 1000 --ps --simulate_file path/to/ghz_03.qasm
{
  "statistics": {
    "applied_gates": 3,
    "approximation_runs": "0",
    "benchmark": "ghz_03",
    "distinct_results": 2,
    "final_fidelity": "1.000000",
    "max_nodes": 7,
    "n_qubits": 3,
    "seed": "0",
    "shots": 1000,
    "simulation_time": 0.00044452399015426636,
    "single_shots": "1",
    "step_fidelity": "1.000000"
  }
}
```

## Documentation

To build documentation, install `doxygen` and run

```
doxygen doxyfile.in
```
The documentation is found in `docs/html/index.html` and could be displayed by for example going to `docs/html` and spinning up a server: `python3 -m http.server`, followed by opening your web browser and navigating to the web page that python returns (often something like `0.0.0.0/8000`).

**Note:** we would like to also have documentation of the libraries, which is done by setting `RECURSIVE` in `doxyfile.in` to YES. However, at the moment this yields an error.

## References

L. Vinkhuijzen, T. Grurl, S. Hillmich, S. Brand, R. Wille, and A. Laarman. [Efficient implementation of LIMDDs for quantum circuit simulation](https://www.cda.cit.tum.de/files/eda/2023_spin_efficient_limdd_implementation.pdf). In International Symposium on Model Checking of Software (SPIN), 2023. DOI: [10.1007/978-3-031-32157-3_1](https://doi.org/10.1007/978-3-031-32157-3_1)

[^1]: The Munich Quantum Toolkit was formerly known under the acronym _JKQ_ and developed by the [Institute for Integrated Circuits](https://iic.jku.at/) at the [Johannes Kepler University Linz](https://jku.at)).
