from __future__ import annotations

import unittest

from qiskit import *

from mqt import ddsim


class MQTStandaloneSimulatorTests(unittest.TestCase):
    def test_standalone(self):
        circ = QuantumCircuit(3)
        circ.h(0)
        circ.cx(0, 1)
        circ.cx(0, 2)

        sim = ddsim.CircuitSimulator(circ)
        result = sim.simulate(1000)
        assert len(result.keys()) == 2
        assert "000" in result
        assert "111" in result

    def test_standalone_with_seed(self):
        circ = QuantumCircuit(3)
        circ.h(0)
        circ.cx(0, 1)
        circ.cx(0, 2)

        sim = ddsim.CircuitSimulator(circ, 1337)
        result = sim.simulate(1000)
        assert len(result.keys()) == 2
        assert "000" in result
        assert "111" in result
