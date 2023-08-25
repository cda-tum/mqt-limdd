from __future__ import annotations

import unittest

from qiskit import QuantumCircuit, QuantumRegister, execute

from mqt.ddsim.pathstatevectorsimulator import PathStatevectorSimulator


class MQTStatevectorSimulatorTest(unittest.TestCase):
    def setUp(self):
        self.backend = PathStatevectorSimulator()
        qr = QuantumRegister(2)
        self.q_circuit = QuantumCircuit(qr)
        self.q_circuit.h(qr[0])
        self.q_circuit.cx(qr[0], qr[1])

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

    def test_statevector_output(self):
        """Test final state vector for single circuit run."""
        result = execute(self.q_circuit, backend=self.backend).result()
        assert result.success is True
        actual = result.get_statevector(self.q_circuit)

        # state is 1/sqrt(2)|00> + 1/sqrt(2)|11>, up to a global phase
        self.assertAlmostEqual((abs(actual[0])) ** 2, 1 / 2, places=5)
        assert actual[1] == 0
        assert actual[2] == 0
        self.assertAlmostEqual((abs(actual[3])) ** 2, 1 / 2, places=5)

    def test_statevector_output_pairwise(self):
        """Test final state vector for single circuit run."""
        mode = "pairwise_recursive"
        result = execute(self.q_circuit, backend=self.backend, mode=mode).result()
        assert result.success is True
        actual = result.get_statevector(self.q_circuit)

        # state is 1/sqrt(2)|00> + 1/sqrt(2)|11>, up to a global phase
        self.assertAlmostEqual((abs(actual[0])) ** 2, 1 / 2, places=5)
        assert actual[1] == 0
        assert actual[2] == 0
        self.assertAlmostEqual((abs(actual[3])) ** 2, 1 / 2, places=5)
