#include "../extern/qfr/extern/dd_package/include/dd/QuantumCircuitSimulation.hpp"

#include <gtest/gtest.h>
#include <memory>

using namespace dd::literals;

TEST(LimddSimTest, SimpleCircuit) {
    dd::QuantumCircuit c(3);

    c.addGate(dd::Hmat, 0);
    c.addGate(dd::Xmat, 0_pc, 2);
    c.addGate(dd::Tmat, 0);
    c.addGate(dd::Hmat, 0);
    c.addGate(dd::Xmat, 0_pc, 1);
    c.addGate(dd::Hmat, 1);
    c.addGate(dd::Xmat, 1_pc, 2);
    ///     =====     THE BUG HAPPENS HERE
    ///               We are about to apply a Hadamard gate to qubit #2 twice. This should not change the state
    ///               However, the state before the two Hadamards is a Tower LIMDD, whereas the state after the two Hadamards does NOT have a Tower LIMDD
    ///               Therefore, a single state has two different reduced LIMDDs. This should not happen.
    ///               A node receives the wrong LIM edge labels, and therefore it not merged with equivalent states, leading to a too-large diagram.
    ///               The function normalizeLIMDDPauli() is supposed to set these edge labels; therefore, the bug likely resides in (a subroutine of) this function

    c.addGate(dd::Hmat, 2);
    c.addGate(dd::Hmat, 2);

    simulateCircuitQMDDvsLIMDDGateByGate(c);
}
