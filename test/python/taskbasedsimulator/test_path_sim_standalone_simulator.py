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

        sim = ddsim.PathCircuitSimulator(circ)
        result = sim.simulate(1000)
        assert len(result.keys()) == 2
        assert "000" in result
        assert "111" in result

    def test_standalone_with_seed(self):
        circ = QuantumCircuit(3)
        circ.h(0)
        circ.cx(0, 1)
        circ.cx(0, 2)

        sim = ddsim.PathCircuitSimulator(circ, seed=1337)
        result = sim.simulate(1000)
        assert len(result.keys()) == 2
        assert "000" in result
        assert "111" in result

    def test_standalone_individual_objects(self):
        circ = QuantumCircuit(3)
        circ.h(0)
        circ.cx(0, 1)
        circ.cx(0, 2)
        sim = ddsim.PathCircuitSimulator(circ, seed=0, mode=ddsim.PathSimulatorMode.bracket, bracket_size=2)
        result = sim.simulate(1000)
        assert len(result.keys()) == 2
        assert "000" in result
        assert "111" in result

    def test_standalone_pairwise_only(self):
        circ = QuantumCircuit(3)
        circ.h(0)
        circ.cx(0, 1)
        circ.cx(0, 2)
        sim = ddsim.PathCircuitSimulator(circ, mode=ddsim.PathSimulatorMode.pairwise_recursive, seed=1)
        result = sim.simulate(1000)
        assert len(result.keys()) == 2
        assert "000" in result
        assert "111" in result
