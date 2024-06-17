#include "CircuitSimulator.hpp"
#include "Simulator.hpp"
#include "algorithms/Entanglement.hpp"
#include "algorithms/Grover.hpp"
#include "algorithms/QFT.hpp"
#include "cxxopts.hpp"
#include "dd/Export.hpp"
#include "nlohmann/json.hpp"

#include <chrono>
#include <fstream>
#include <iostream>
#include <memory>
#include <string>

namespace nl = nlohmann;

int main(int argc, char** argv) {
    cxxopts::Options options("MQT DDSIM", "for more information see https://www.cda.cit.tum.de/");
    // clang-format off
    options.add_options()
        ("h,help", "produce help message")
        ("seed", "seed for random number generator (default zero is possibly directly used as seed!)", cxxopts::value<unsigned long long>()->default_value("0"))
        ("shots", "number of measurements (if the algorithm does not contain non-unitary gates, weak simulation is used)", cxxopts::value<unsigned int>()->default_value("0"))
        ("pv", "display the state vector")
        ("ps", "print simulation stats (applied gates, sim. time, and maximal size of the DD)")
        ("pm", "print measurement results")
        ("pcomplex", "print additional statistics on complex numbers")
        ("dump_complex", "dump edge weights in final state DD to file", cxxopts::value<std::string>())
        ("verbose", "Causes some simulators to print additional information to STDERR")
        ("simulate_file", "simulate a quantum circuit given by file (detection by the file extension)", cxxopts::value<std::string>())
        ("simulate_qft", "simulate Quantum Fourier Transform for given number of qubits", cxxopts::value<unsigned int>())
        ("simulate_ghz", "simulate state preparation of GHZ state for given number of qubits", cxxopts::value<unsigned int>())
        ("step_fidelity", "target fidelity for each approximation run (>=1 = disable approximation)", cxxopts::value<double>()->default_value("1.0"))
        ("steps", "number of approximation steps", cxxopts::value<unsigned int>()->default_value("1"))
        ("approx_when", "approximation method ('fidelity' (default) or 'memory'", cxxopts::value<std::string>()->default_value("fidelity"))
        ("approx_state", "do excessive approximation runs at the end of the simulation to see how the quantum state behaves");
    // clang-format on

    auto vm = options.parse(argc, argv);
    if (vm.count("help")) {
        std::cout << options.help();
        std::exit(0);
    }

    const auto seed          = vm["seed"].as<unsigned long long>();
    const auto shots         = vm["shots"].as<unsigned int>();
    const auto approx_steps  = vm["steps"].as<unsigned int>();
    const auto step_fidelity = vm["step_fidelity"].as<double>();

    ApproximationInfo::ApproximationWhen approx_when;
    if (vm["approx_when"].as<std::string>() == "fidelity") {
        approx_when = ApproximationInfo::FidelityDriven;
    } else if (vm["approx_when"].as<std::string>() == "memory") {
        approx_when = ApproximationInfo::MemoryDriven;
    } else {
        throw std::runtime_error("Unknown approximation method '" + vm["approx_when"].as<std::string>() + "'.");
    }

    std::unique_ptr<qc::QuantumComputation>   quantumComputation;
    std::unique_ptr<Simulator<dd::Package<>>> ddsim{nullptr};
    ApproximationInfo                         approx_info(step_fidelity, approx_steps, approx_when);

    if (vm.count("simulate_file")) {
        const std::string fname = vm["simulate_file"].as<std::string>();
        quantumComputation      = std::make_unique<qc::QuantumComputation>(fname);
        ddsim                   = std::make_unique<CircuitSimulator<>>(std::move(quantumComputation), approx_info, seed);
    } else if (vm.count("simulate_qft")) {
        const unsigned int n_qubits = vm["simulate_qft"].as<unsigned int>();
        quantumComputation          = std::make_unique<qc::QFT>(n_qubits);
        ddsim                       = std::make_unique<CircuitSimulator<>>(std::move(quantumComputation), approx_info, seed);
    } else if (vm.count("simulate_ghz")) {
        const unsigned int n_qubits = vm["simulate_ghz"].as<unsigned int>();
        quantumComputation          = std::make_unique<qc::Entanglement>(n_qubits);
        ddsim                       = std::make_unique<CircuitSimulator<>>(std::move(quantumComputation), approx_info, seed);
    } else {
        std::cerr << "Did not find anything to simulate. See help below.\n"
                  << options.help() << "\n";
        std::exit(1);
    }

    if (ddsim->getNumberOfQubits() > 100) {
        std::clog << "[WARNING] Quantum computation contains quite a few qubits. You're jumping into the deep end.\n";
    }

    auto t1 = std::chrono::high_resolution_clock::now();
    auto m  = ddsim->Simulate(shots);
    auto t2 = std::chrono::high_resolution_clock::now();

    std::chrono::duration<float> duration_simulation = t2 - t1;

    if (vm.count("approx_state")) {
        // TargetFidelity
        ddsim->ApproximateByFidelity(1 / 100.0, false, false, true);
        ddsim->ApproximateByFidelity(2 / 100.0, false, false, true);
        ddsim->ApproximateByFidelity(3 / 100.0, false, false, true);
        ddsim->ApproximateByFidelity(4 / 100.0, false, false, true);
        for (int i = 6; i <= 95; i += 2) {
            ddsim->ApproximateByFidelity(i / 100.0, false, false, true);
        }
        ddsim->ApproximateByFidelity(96 / 100.0, false, false, true);
        ddsim->ApproximateByFidelity(97 / 100.0, false, false, true);
        ddsim->ApproximateByFidelity(98 / 100.0, false, false, true);
        ddsim->ApproximateByFidelity(99 / 100.0, false, false, true);
        ddsim->ApproximateByFidelity(100 / 100.0, false, false, true);

        // TargetFidelityPerLevel
        ddsim->ApproximateByFidelity(1 / 1000.0, true, false, true);
        ddsim->ApproximateByFidelity(5 / 1000.0, true, false, true);
        ddsim->ApproximateByFidelity(10 / 1000.0, true, false, true);
        ddsim->ApproximateByFidelity(20 / 1000.0, true, false, true);
        ddsim->ApproximateByFidelity(30 / 1000.0, true, false, true);
        ddsim->ApproximateByFidelity(40 / 1000.0, true, false, true);
        for (int i = 50; i <= 950; i += 10) {
            ddsim->ApproximateByFidelity(i / 1000.0, true, false, true);
        }
        ddsim->ApproximateByFidelity(960 / 1000.0, true, false, true);
        ddsim->ApproximateByFidelity(970 / 1000.0, true, false, true);
        ddsim->ApproximateByFidelity(980 / 1000.0, true, false, true);
        ddsim->ApproximateByFidelity(985 / 1000.0, true, false, true);
        ddsim->ApproximateByFidelity(990 / 1000.0, true, false, true);
        ddsim->ApproximateByFidelity(995 / 1000.0, true, false, true);
        ddsim->ApproximateByFidelity(1000 / 1000.0, true, false, true);

        // Traversal
        for (int i = 1; i < 10; i += 1) {
            ddsim->ApproximateBySampling(i, 0, false, true);
        }
        for (int i = 10; i < 100; i += 10) {
            ddsim->ApproximateBySampling(i, 0, false, true);
        }
        for (int i = 100; i < 1000; i += 100) {
            ddsim->ApproximateBySampling(i, 0, false, true);
        }
        for (int i = 1000; i < 100000; i += 1000) {
            ddsim->ApproximateBySampling(i, 0, false, true);
        }
        for (int i = 100000; i <= 1000000; i += 10000) {
            ddsim->ApproximateBySampling(i, 0, false, true);
        }

        // Traversal+Threshold
        for (int i = 1; i < 10; i += 1) {
            ddsim->ApproximateBySampling(1000000, i, false, true);
        }
        for (int i = 10; i < 100; i += 10) {
            ddsim->ApproximateBySampling(1000000, i, false, true);
        }

        for (int i = 100; i <= 5000; i += 100) {
            ddsim->ApproximateBySampling(1000000, i, false, true);
        }
    }

    nl::json output_obj;

    if (vm.count("pm")) {
        output_obj["measurement_results"] = m;
    }

    if (vm.count("pv")) {
        output_obj["state_vector"] = ddsim->getVectorPair();
    }

    if (vm.count("ps")) {
        output_obj["statistics"] = {
                {"simulation_time", duration_simulation.count()},
                {"benchmark", ddsim->getName()},
                {"n_qubits", +ddsim->getNumberOfQubits()},
                {"applied_gates", ddsim->getNumberOfOps()},
                {"max_nodes", ddsim->getMaxNodeCount()},
                {"shots", shots},
                {"distinct_results", m.size()},
                {"seed", ddsim->getSeed()},
                {"active_nodes", ddsim->dd->size(ddsim->rootEdge)},
                {"number_of_lims", ddsim->dd->limCount(ddsim->rootEdge)},
                {"number_of_number", ddsim->dd->numberCount(ddsim->rootEdge)},
                {"size_of_a_single_node", sizeof(*ddsim->rootEdge.p)},
        };

        for (const auto& [stat, value]: ddsim->AdditionalStatistics()) {
            output_obj["statistics"][stat] = value;
        }
    }

    if (vm.count("pcomplex")) {
        output_obj["complex_stats"] = ddsim->dd->cn.complexTable.getStatistics();
    }

    if (vm.count("dump_complex")) {
        auto filename = vm["dump_complex"].as<std::string>();
        auto ostream  = std::fstream(filename, std::fstream::out);
        dd::exportEdgeWeights(ddsim->rootEdge, ostream);
    }

    std::cout << std::setw(2) << output_obj << std::endl;
}
