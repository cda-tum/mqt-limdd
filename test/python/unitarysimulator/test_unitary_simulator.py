from __future__ import annotations

import unittest

import numpy as np
from qiskit import QuantumCircuit, execute

from mqt.ddsim.unitarysimulator import UnitarySimulator


class MQTUnitarySimulatorTest(unittest.TestCase):
    def setUp(self):
        self.backend = UnitarySimulator()
        circ = QuantumCircuit(3)
        circ.h(0)
        circ.cx(0, 1)
        circ.cx(0, 2)
        self.circuit = circ
        self.circuit.name = "test"

    def test_configuration(self):
        """Test backend.configuration()."""
        return self.backend.configuration()

    def test_properties(self):
        """Test backend.properties()."""
        properties = self.backend.properties()
        assert properties is None

    def test_status(self):
        """Test backend.status()."""
        return self.backend.status()

    def test_unitary_simulator_sequential_mode(self):
        result = execute(self.circuit, self.backend, mode="sequential").result()
        assert result.success is True
        print(result.get_unitary("test"))
        assert np.count_nonzero(result.get_unitary("test")) == 16
        return result

    def test_unitary_simulator_recursive_mode(self):
        result = execute(self.circuit, self.backend, mode="recursive").result()
        assert result.success is True
        print(result.data("test"))
        assert np.count_nonzero(result.get_unitary("test")) == 16
        return result
